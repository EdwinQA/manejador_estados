import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manejador_estados/services/usuario_service.dart';

import '../models/usuario.dart';

class Pagina1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Pagina 1')),
      ),
      body: StreamBuilder(
        stream: usuarioService.usuarioStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? InformacionUsuario(usuarioService.usuario)
              : Center(
            child: Text('No Hay informacion del usuario'),
          );
        },
      ),
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

  const InformacionUsuario(this.usuario);

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
              ListTile(title: Text('Profesion 1')),
              ListTile(title: Text('Profesion 2')),
              ListTile(title: Text('Profesion 3')),
            ],
          )),
    );
  }
}
