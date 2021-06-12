import 'package:flutter/material.dart';
import 'package:manejador_estados/services/usuario_service.dart';

import '../models/usuario.dart';

class Pagina2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder(
          stream: usuarioService.usuarioStream,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return usuarioService.existeUsuario
                ? Text('Usuario: ${usuarioService.usuario.nombre}')
                : Text('Pagina 2');
          },
        ),
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
              final nuevoUsuario = new Usuario(nombre: 'edwin', edad: 21);
              usuarioService.cargarUsuario(nuevoUsuario);
            },
          ),
          MaterialButton(
            child: Text(
              'Cambiar Edad',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.blue,
            onPressed: () {
              usuarioService.cambiarEdad(22);
            },
          ),
          MaterialButton(
            child: Text(
              'Añadir una profesión',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.blue,
            onPressed: () {},
          )
        ],
      )),
    );
  }
}
