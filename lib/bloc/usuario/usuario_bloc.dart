import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:manejador_estados/models/usuario.dart';

part 'usuario_state.dart';

part 'usuario_event.dart';

class UsuarioBloc extends Bloc<UsuarioEvent, UsuarioState> {
  UsuarioBloc() : super(UsuarioState());

  @override
  Stream<UsuarioState> mapEventToState(UsuarioEvent event) async* {
    print(event);
    if (event is ActivarUsuario) {
      yield state.copyWith(usuario: event.usuario);
    } else if (event is CambiarEdad) {
      yield state.copyWith(usuario: state.usuario.copiWith(edad: event.edad));
    } else if (event is AgregarProfesion) {
      yield state.copyWith(
          usuario: state.usuario.copiWith(profesiones: [
        ...state.usuario.profesiones,
        '${event.profesion} ${state.usuario.profesiones.length + 1}'
      ]));
    } else if (event is BorrarUsuario) {
      yield state.estadoInicial();
    }
  }
}
