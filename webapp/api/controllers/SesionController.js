/**
 * SesionController
 *
 * @description :: Server-side actions for handling incoming requests.
 * @help        :: See https://sailsjs.com/docs/concepts/actions
 */


module.exports = {
     
    registro: async (peticion,respuesta) => {
        respuesta.view('pages/registro')
    },

    procesarRegistro: async (peticion,respuesta) => {
        let cliente = await Cliente.findOne({ email: peticion.body.email});
        if(cliente){
            peticion.addFlash('mensaje','Email Duplicado')
            return respuesta.redirect("/registro");
        }
        else {
            let cliente = await Cliente.create({
                email: peticion.body.email,
                nombre: peticion.body.nombre,
                contrasena: peticion.body.contrasena,
                activo: true
            
            })
            peticion.session.cliente = cliente;
            console.log(cliente)
            peticion.addFlash('mensaje','Cliente  registrado')
            return respuesta.redirect("/");
        }
    },


    iniciosesion: async (peticion,respuesta) => {
        respuesta.view('pages/inicio_sesion')
    },


    procesarInicioSesion: async(peticion,respuesta) => {
        let cliente = await Cliente.findOne({email: peticion.body.email, contrasena: peticion.body.contrasena});
        if (cliente.activo == true){
            peticion.addFlash('mensaje','Sesión Iniciada')
            peticion.session.cliente = cliente;
            console.log(cliente)
            let carroCompra = await CarroCompra.find({cliente: cliente.id})
            peticion.session.carroCompra = carroCompra
            console.log({carroCompra})
            return respuesta.redirect("/");

        }
        else {
            peticion.addFlash('mensaje','Email o Contraseña inválidos o cliente dado de baja')
            return respuesta.redirect("/inicio-sesion")
        }
    },

    cerrarSesion: async (peticion, respuesta) => {
        peticion.session.cliente = undefined;
        peticion.addFlash('mensaje', 'Sesión finalizada')
        return respuesta.redirect("/");
      }, 
        
};


