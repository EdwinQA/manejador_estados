import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manejador_estados/controllers/usuario_controller.dart';
import 'package:manejador_estados/models/usuario.dart';
import 'package:manejador_estados/pages/pagina2_page.dart';

class Pagina1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final usuarioCtrl = Get.put(UsuarioController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina 1'),
      ),
      body: Obx(() => usuarioCtrl.existeUsuario.value
          ? InformacionUsuario(usuaio: usuarioCtrl.usuario.value)
          : Center(
              child: Text('No hay un usuario'),
            )),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          //Navigator.pushNamed(context, 'pagina2');
          Get.to(Pagina2Page(), arguments: {
            'nombre': 'Fermamdo',
            'edad': '22',
          });
        },
      ),
    );
  }
}

class InformacionUsuario extends StatelessWidget {
  final Usuario usuaio;

  const InformacionUsuario({Key? key, required this.usuaio}) : super(key: key);

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
              ListTile(title: Text('Nombre: ${this.usuaio.nombre}')),
              ListTile(title: Text('Edad: ${this.usuaio.edad}')),
              Text(
                'Profesiones',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Divider(),
              ...usuaio.profesiones
                  .map((profesion) => ListTile(title: Text(profesion)))
                  .toList()
            ],
          )),
    );
  }
}
