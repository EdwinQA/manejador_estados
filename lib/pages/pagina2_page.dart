import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manejador_estados/bloc/usuario/usuario_bloc.dart';
import 'package:manejador_estados/models/usuario.dart';

class Pagina2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final usuarioBloc = BlocProvider.of<UsuarioBloc>(context);
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
              final newUser = new Usuario(
                  nombre: 'Edwin Quebrada',
                  edad: 21,
                  profesiones: ['Desarrollador', 'Futbolista']);
              usuarioBloc.add(ActivarUsuario(newUser));
            },
          ),
          MaterialButton(
            child: Text(
              'Cambiar Edad',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.blue,
            onPressed: () {
              usuarioBloc.add(CambiarEdad(22));
            },
          ),
          MaterialButton(
            child: Text(
              'Añadir una profesión',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.blue,
            onPressed: () {
              usuarioBloc.add(AgregarProfesion('profesion'));
            },
          )
        ],
      )),
    );
  }
}
