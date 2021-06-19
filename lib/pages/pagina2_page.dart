import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manejador_estados/bloc/usuario/usuario_cubit.dart';
import 'package:manejador_estados/models/usuario.dart';

class Pagina2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final usuarioCubic = BlocProvider.of<UsuarioCubit>(context, listen: false);

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
                nombre: 'Edwin',
                edad: 21,
                profesiones: ['FullStack Developer', 'Videojugador Veterano'],
              );
              usuarioCubic.seleccionarUsuario(newUser);
            },
          ),
          MaterialButton(
            child: Text(
              'Cambiar Edad',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.blue,
            onPressed: () {
              usuarioCubic.cambiarEdad(22);
            },
          ),
          MaterialButton(
            child: Text(
              'Añadir una profesión',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.blue,
            onPressed: () {
              usuarioCubic.agregarProfesion();
            },
          )
        ],
      )),
    );
  }
}
