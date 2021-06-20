import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manejador_estados/controllers/usuario_controller.dart';
import 'package:manejador_estados/models/usuario.dart';

class Pagina2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print(Get.arguments);
    final usuarioCtrl = Get.find<UsuarioController>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina 2'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MaterialButton(
            child: Text(
              'Establecer Usuario',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.blue,
            onPressed: () {
              usuarioCtrl.cargarUsuario(
                Usuario(nombre: 'Edwin Quebrada', edad: 21),
              );
              Get.snackbar(
                'Titulo del snackbar',
                'Mensaje del snackbar : edwin stiven quebrada antury',
                backgroundColor: Colors.white,
                boxShadows: [
                  BoxShadow(
                    color: Colors.black38,
                    blurRadius: 10,
                  )
                ],
              );
            },
          ),
          MaterialButton(
            child: Text(
              'Cambiar Edad',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.blue,
            onPressed: () {
              usuarioCtrl.cambiarEdad(22);
            },
          ),
          MaterialButton(
            child: Text(
              'Añadir una profesión',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.blue,
            onPressed: () {
              usuarioCtrl.agregarProfesion(
                  'Nueva profesion ${usuarioCtrl.numProfesiones}');
            },
          ),
          MaterialButton(
            child: Text(
              'Cambiar tema',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.blue,
            onPressed: () {
              Get.changeTheme(ThemeData.dark());
            },
          ),
        ],
      )),
    );
  }
}
