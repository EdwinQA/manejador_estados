import 'package:flutter/material.dart';
import 'package:manejador_estados/models/usuario.dart';
import 'package:manejador_estados/services/usuario_service.dart';
import 'package:provider/provider.dart';

class Pagina2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final usuarioService = Provider.of<UsuarioService>(context);
    return Scaffold(
      appBar: AppBar(
        title: usuarioService.existeUsuario
            ? Text('Usuario: ${usuarioService.usuario.nombre}')
            : Text('Pagina 2'),
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
              Usuario newUser = new Usuario(
                  nombre: 'Edwin Quebrada',
                  edad: 21,
                  profesiones: ['Medico', 'ingeniero']);
              usuarioService.usuario = newUser;
            },
          ),
          MaterialButton(
            child: Text(
              'Cambiar Edad',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.blue,
            onPressed: () {
              usuarioService.edad(22);
            },
          ),
          MaterialButton(
            child: Text(
              'Añadir una profesión',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.blue,
            onPressed: () {
              usuarioService.agregarProfesion('nueva profesion');
            },
          )
        ],
      )),
    );
  }
}
