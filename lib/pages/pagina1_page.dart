import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manejador_estados/bloc/usuario/usuario_cubit.dart';
import 'package:manejador_estados/models/usuario.dart';

class Pagina1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final usuarioCubic = BlocProvider.of<UsuarioCubit>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina 1'),
        actions: [
          IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () => usuarioCubic.borrarUsuario())
        ],
      ),
      body: BodyScaffold(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, 'pagina2');
        },
      ),
    );
  }
}

class BodyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsuarioCubit, UsuarioState>(builder: (context, state) {
      switch (state.runtimeType) {
        case UsuarioInitial:
          return Center(child: Text('No hay informacion del usuario'));
        case UsuarioActivo:
          return InformacionUsuario(usuario: (state as UsuarioActivo).usuario);
        default:
          return Center(child: Text('Estado no reconocido'));
      }
    });
  }
}

class InformacionUsuario extends StatelessWidget {
  final Usuario usuario;

  const InformacionUsuario({this.usuario});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          constraints: BoxConstraints(
              minWidth: 600,
              minHeight: 250,
              maxHeight: double.infinity,
              maxWidth: double.infinity),
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'General',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Divider(),
              ListTile(title: Text('Nombre: ${usuario.nombre}')),
              ListTile(title: Text('Edad: ${usuario.edad}')),
              Text(
                'Profesiones',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Divider(),
              ...usuario.profesiones
                  .map((profesion) => ListTile(title: Text(profesion)))
                  .toList()
            ],
          )),
    );
  }
}
