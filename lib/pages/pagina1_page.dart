import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manejador_estados/models/usuario.dart';
import 'package:manejador_estados/services/usuario_service.dart';
import 'package:provider/provider.dart';

class Pagina1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final usuarioService = Provider.of<UsuarioService>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina 1'),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () => usuarioService.removerUsuario(),
          ),
        ],
      ),
      body: usuarioService.existeUsuario
          ? InformacionUsuario(usuario: usuarioService.usuario)
          : Center(child: Text('No Hay usuario')),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, 'pagina2');
        },
      ),
    );
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
              ListTile(title: Text('Nombre : ${usuario.nombre}')),
              ListTile(title: Text('Edad : ${usuario.edad}')),
              Text(
                'Profesiones',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Divider(),
              //ListTile(title: Text('Profesion 1')),
              ...usuario.profesiones
                  .map((profesion) => ListTile(
                        title: Text(profesion),
                      ))
                  .toList(),
            ],
          )),
    );
  }
}
