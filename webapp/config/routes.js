/**
 * Route Mappings
 * (sails.config.routes)
 *
 * Your routes tell Sails what to do each time it receives a request.
 *
 * For more information on configuring custom routes, check out:
 * https://sailsjs.com/anatomy/config/routes-js
 */

module.exports.routes = {

  /***************************************************************************
  *                                                                          *
  * Make the view located at `views/homepage.ejs` your home page.            *
  *                                                                          *
  * (Alternatively, remove this and add an `index.html` file in your         *
  * `assets` directory)                                                      *
  *                                                                          *
  ***************************************************************************/

  'GET /': 'PrincipalController.inicio',

  '/acerca-de': { 
    view: 'pages/acerca_de' 
  },

  'GET /registro': 'SesionController.registro',

  'POST /procesar-registro': 'SesionController.procesarRegistro',

  'GET /inicio-sesion': 'SesionController.iniciosesion',

  'POST /procesar-inicio-sesion': 'SesionController.procesarInicioSesion',

  'GET /cerrar-sesion': 'SesionController.cerrarSesion',

  'GET /carro-de-compra': 'SesionController.agregarCarritoCompra',

  'GET /agregar-carro-compra/:fotoId': 'CompraController.agregarCarroCompra',

  'GET /carro-de-compra':'CompraController.carroCompra',

  'GET /eliminar-carro-compra/:fotoId': 'CompraController.eliminarCarroCompra',

  'GET /comprar': 'CompraController.comprar',

  'GET /mis-ordenes': 'CompraController.misOrdenes',

  'GET /orden-detalle/:ordenId': 'CompraController.detalleOrden',

  'GET /top-vendidas/': 'PrincipalController.topVendidas',

  'GET /lista-deseo/': 'CompraController.listaDeseo',

  'GET /lista-deseo-agregar/:fotoId': 'CompraController.listaDeseoAgregar',

  'GET /lista-deseo-eliminar/:fotoId': 'CompraController.listaDeseoEliminar',

  'GET /admin/inicio-sesion':'AdminController.inicioSesion',

  'POST /admin/procesar-inicio-sesion':'AdminController.procesarInicioSesion',

  'GET /admin/principal':'AdminController.principal',

  'GET /admin/cerrar-sesion':'AdminController.cerrarSesion',

  'GET /admin/agregar-foto':'AdminController.agregarFoto',

  'POST /admin/procesar-agregar-foto':'AdminController.procesarAgregarFoto',

  'GET /admin/desactivar/:fotoId':'AdminController.desactivar',

  'GET /admin/activar/:fotoId':'AdminController.activar',

  'GET /admin/listado-clientes':'AdminController.listadoClientes',

  'GET /admin/desactivar-cliente/:clienteId':'AdminController.desactivarCliente',

  'GET /admin/activar-cliente/:clienteId':'AdminController.activarCliente',

  'GET /admin/opc/:clienteId':'AdminController.ordenesPorCliente',

  'GET /admin/opcDetalle/:ordenId':'AdminController.detalleOrden',

  'GET /admin/administradores/':'AdminController.listadoAdministradores',

  'GET /admin/desactivar-administrador/:admonId':'AdminController.desactivarAdministrador',

  'GET /admin/activar-administrador/:admonId':'AdminController.activarAdministrador',

  'GET /admin/dashboard':'AdminController.dashboard'





 


  


  
  





  /***************************************************************************
  *                                                                          *
  * More custom routes here...                                               *
  * (See https://sailsjs.com/config/routes for examples.)                    *
  *                                                                          *
  * If a request to a URL doesn't match any of the routes in this file, it   *
  * is matched against "shadow routes" (e.g. blueprint routes).  If it does  *
  * not match any of those, it is matched against static assets.             *
  *                                                                          *
  ***************************************************************************/


};
