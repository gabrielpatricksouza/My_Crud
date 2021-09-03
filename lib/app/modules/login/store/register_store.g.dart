// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RegisterStore on _RegisterStore, Store {
  final _$valorSexoAtom = Atom(name: '_RegisterStore.valorSexo');

  @override
  int get valorSexo {
    _$valorSexoAtom.reportRead();
    return super.valorSexo;
  }

  @override
  set valorSexo(int value) {
    _$valorSexoAtom.reportWrite(value, super.valorSexo, () {
      super.valorSexo = value;
    });
  }

  final _$estadoCivilAtom = Atom(name: '_RegisterStore.estadoCivil');

  @override
  String? get estadoCivil {
    _$estadoCivilAtom.reportRead();
    return super.estadoCivil;
  }

  @override
  set estadoCivil(String? value) {
    _$estadoCivilAtom.reportWrite(value, super.estadoCivil, () {
      super.estadoCivil = value;
    });
  }

  final _$visualizarSenhaAtom = Atom(name: '_RegisterStore.visualizarSenha');

  @override
  bool get visualizarSenha {
    _$visualizarSenhaAtom.reportRead();
    return super.visualizarSenha;
  }

  @override
  set visualizarSenha(bool value) {
    _$visualizarSenhaAtom.reportWrite(value, super.visualizarSenha, () {
      super.visualizarSenha = value;
    });
  }

  final _$visualizarSenha2Atom = Atom(name: '_RegisterStore.visualizarSenha2');

  @override
  bool get visualizarSenha2 {
    _$visualizarSenha2Atom.reportRead();
    return super.visualizarSenha2;
  }

  @override
  set visualizarSenha2(bool value) {
    _$visualizarSenha2Atom.reportWrite(value, super.visualizarSenha2, () {
      super.visualizarSenha2 = value;
    });
  }

  final _$imageFileAtom = Atom(name: '_RegisterStore.imageFile');

  @override
  File? get imageFile {
    _$imageFileAtom.reportRead();
    return super.imageFile;
  }

  @override
  set imageFile(File? value) {
    _$imageFileAtom.reportWrite(value, super.imageFile, () {
      super.imageFile = value;
    });
  }

  final _$carregandoAtom = Atom(name: '_RegisterStore.carregando');

  @override
  bool get carregando {
    _$carregandoAtom.reportRead();
    return super.carregando;
  }

  @override
  set carregando(bool value) {
    _$carregandoAtom.reportWrite(value, super.carregando, () {
      super.carregando = value;
    });
  }

  final _$nextAtom = Atom(name: '_RegisterStore.next');

  @override
  bool get next {
    _$nextAtom.reportRead();
    return super.next;
  }

  @override
  set next(bool value) {
    _$nextAtom.reportWrite(value, super.next, () {
      super.next = value;
    });
  }

  final _$pegarImagemAsyncAction = AsyncAction('_RegisterStore.pegarImagem');

  @override
  Future pegarImagem(BuildContext context) {
    return _$pegarImagemAsyncAction.run(() => super.pegarImagem(context));
  }

  final _$_cadastrarUsuarioAsyncAction =
      AsyncAction('_RegisterStore._cadastrarUsuario');

  @override
  Future<dynamic> _cadastrarUsuario(dynamic context) {
    return _$_cadastrarUsuarioAsyncAction
        .run(() => super._cadastrarUsuario(context));
  }

  final _$_RegisterStoreActionController =
      ActionController(name: '_RegisterStore');

  @override
  dynamic mudarValorSexo(int value) {
    final _$actionInfo = _$_RegisterStoreActionController.startAction(
        name: '_RegisterStore.mudarValorSexo');
    try {
      return super.mudarValorSexo(value);
    } finally {
      _$_RegisterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic mudarEstadoCivil(String valueBox) {
    final _$actionInfo = _$_RegisterStoreActionController.startAction(
        name: '_RegisterStore.mudarEstadoCivil');
    try {
      return super.mudarEstadoCivil(valueBox);
    } finally {
      _$_RegisterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void boolVisualizarSenha() {
    final _$actionInfo = _$_RegisterStoreActionController.startAction(
        name: '_RegisterStore.boolVisualizarSenha');
    try {
      return super.boolVisualizarSenha();
    } finally {
      _$_RegisterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void boolVisualizarSenha2() {
    final _$actionInfo = _$_RegisterStoreActionController.startAction(
        name: '_RegisterStore.boolVisualizarSenha2');
    try {
      return super.boolVisualizarSenha2();
    } finally {
      _$_RegisterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic mudarNext() {
    final _$actionInfo = _$_RegisterStoreActionController.startAction(
        name: '_RegisterStore.mudarNext');
    try {
      return super.mudarNext();
    } finally {
      _$_RegisterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
valorSexo: ${valorSexo},
estadoCivil: ${estadoCivil},
visualizarSenha: ${visualizarSenha},
visualizarSenha2: ${visualizarSenha2},
imageFile: ${imageFile},
carregando: ${carregando},
next: ${next}
    ''';
  }
}
