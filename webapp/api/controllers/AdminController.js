
const path = require('path');
const fs = require('fs');




module.exports = {

 inicioSesion: async (peticion,respuesta) => {
    respuesta.view('pages/admin/inicio_sesion')
 },


 procesarInicioSesion: async (peticion,respuesta) => {
     let admin = await Admin.findOne({email: peticion.body.email, contrasena: peticion.body.contrasena})
     if (admin){
         peticion.session.admin = admin
         console.log("se ha iniciado como administrador")
         peticion.session.cliente = undefined
         peticion.addFlash('mensaje','Sesión de admin iniciada')
         return respuesta.redirect("/admin/principal")
    }
    else {
        peticion.addFlash('mensaje','Correo o contraseña incorrecta')
        return respuesta.redirect("/admin/inicio_sesion")
    }
 },

 principal: async (peticion,respuesta) => {
     if(!peticion.session || !peticion.session.admin){
         peticion.addFlash('mensaje','Sesión Inválida')
         return respuesta.redirect("/admin/inicio-sesion")
     }
     else {
     let fotografias = await Foto.find()
     console.log({fotografias})
      respuesta.view('pages/admin/principal',{fotografias})
      console.log({fotografias})
     }
 },

 


 cerrarSesion: async(peticion,respuesta) => {
     peticion.session.admin = undefined
     peticion.addFlash('mensaje','Sesión Finalizada')
     return respuesta.redirect("/")
 },

 agregarFoto: async(peticion, respuesta) => {
    respuesta.view('pages/admin/agregar_foto')
 },

 procesarAgregarFoto: async(peticion, respuesta) => {
     let foto = await Foto.create({
         titulo: peticion.body.titulo,
         activa: false
     }).fetch()
     
     peticion.file('foto').upload({}, async (error,archivos) => {
        if (archivos && archivos[0]) {
            let upload_path = archivos[0].fd
            let ext = path.extname(upload_path)

            await fs.createReadStream(upload_path).pipe(fs.createWriteStream(path.resolve(sails.config.appPath,`assets/images/${foto.id}${ext}`)))
            await Foto.update({id: foto.id},{contenido: `${foto.id}${ext}`,activa: true})
            peticion.addFlash('mensaje','Foto agregada')
            return respuesta.redirect("/admin/principal")
        } 
        peticion.addFlash('mensaje','No hay foto seleccionada')
        return respuesta.redirect("/agregar-foto")
     })
 },

 desactivar: async(peticion,respuesta) => {
     await Foto.update({id: peticion.params.fotoId}, {activa:false})
     peticion.addFlash('mensaje','Foto desactivada con éxito')
     return respuesta.redirect("/admin/principal")
 },

 activar: async(peticion,respuesta) => {
    await Foto.update({id: peticion.params.fotoId}, {activa:true})
    peticion.addFlash('mensaje','Foto activada con éxito')
    return respuesta.redirect("/admin/principal")
},

 listadoClientes: async(peticion,respuesta) => {
    if (!peticion.session || !peticion.session.admin){
        peticion.addFlash('mensaje', 'Sesión inválida')
        return respuesta.redirect("/admin/inicio-sesion")
      }
        let listado = await Cliente.find()
        return respuesta.view('pages/admin/listado_clientes',{listado})
 }, 


 desactivarCliente: async(peticion,respuesta) => {
    await Cliente.update({id: peticion.params.clienteId}, {activo:false})
    peticion.addFlash('mensaje', 'Cliente desativado')
    return respuesta.redirect("/admin/listado-clientes")
},


activarCliente: async (peticion, respuesta) => {
    await Cliente.update({ id: peticion.params.clienteId }, { activo: true })
    peticion.addFlash('mensaje', 'Cliente ativado')
    return respuesta.redirect("/admin/listado-clientes")

},


 
 ordenesPorCliente: async(peticion,respuesta) => {
    if (!peticion.session || !peticion.session.admin){
        return respuesta.redirect("/")
    }
    let ordenes = await Orden.find({cliente: peticion.params.clienteId}).sort('id desc')
    respuesta.view('pages/admin/ordenesClientes',{ordenes})
},

detalleOrden: async(peticion,respuesta) => {
    if (!peticion.session || !peticion.session.admin){
      return respuesta.redirect("/")
  }
  let ordenDetalle = await OrdenDetalle.find({orden: peticion.params.ordenId}).populate('foto')
  console.log({ordenDetalle})
  
  respuesta.view('pages/admin/ordenesClientesDetalle',{ordenDetalle})
},

listadoAdministradores: async(peticion,respuesta) => {
    let listas = await Admin.find()
    return respuesta.view('pages/admin/administradores',{listas})

},

desactivarAdministrador: async(peticion,respuesta) => {
       if (peticion.params.admonId != peticion.session.admin.id){
        let actualizar = await Admin.update({id: peticion.params.admonId},{activo:false})
        peticion.addFlash('mensaje','Administrador desactivado')
        return respuesta.redirect("/admin/administradores")
       } 
        peticion.addFlash('mensaje','No puede inactivarse')
        return respuesta.redirect("/admin/administradores")
       
},

activarAdministrador: async(peticion,respuesta) => {
    if (peticion.params.admonId != peticion.session.admin.id){
        let actualizar = await Admin.update({id: peticion.params.admonId},{activo:true})
        peticion.addFlash('mensaje','Administrador activado')
        return respuesta.redirect("/admin/administradores")
       } 
        peticion.addFlash('mensaje','No puede activarse')
        return respuesta.redirect("/admin/administradores")
       
},

dashboard: async(peticion,respuesta) => {
    let nClientes = await Cliente.find()
    let nFotos = await Foto.find()
    let nAdmin = await Admin.find()
    let nOrdenes = await Orden.find()

    var listado = [nClientes, nFotos, nAdmin, nOrdenes]
    respuesta.view('pages/admin/dashboard',{listado})



}

}; 