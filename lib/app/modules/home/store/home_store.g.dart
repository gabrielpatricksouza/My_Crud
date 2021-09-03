// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on _HomeStore, Store {
  final _$lerApenasAtom = Atom(name: '_HomeStore.lerApenas');

  @override
  bool get lerApenas {
    _$lerApenasAtom.reportRead();
    return super.lerApenas;
  }

  @override
  set lerApenas(bool value) {
    _$lerApenasAtom.reportWrite(value, super.lerApenas, () {
      super.lerApenas = value;
    });
  }

  final _$imageFileAtom = Atom(name: '_HomeStore.imageFile');

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

  final _$carregandoAtom = Atom(name: '_HomeStore.carregando');

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

  final _$pegarImagemAsyncAction = AsyncAction('_HomeStore.pegarImagem');

  @override
  Future pegarImagem(BuildContext context) {
    return _$pegarImagemAsyncAction.run(() => super.pegarImagem(context));
  }

  final _$_salvarAlteracoesAsyncAction =
      AsyncAction('_HomeStore._salvarAlteracoes');

  @override
  Future _salvarAlteracoes(dynamic context) {
    return _$_salvarAlteracoesAsyncAction
        .run(() => super._salvarAlteracoes(context));
  }

  final _$_HomeStoreActionController = ActionController(name: '_HomeStore');

  @override
  dynamic alterarLerApenas(bool value) {
    final _$actionInfo = _$_HomeStoreActionController.startAction(
        name: '_HomeStore.alterarLerApenas');
    try {
      return super.alterarLerApenas(value);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic buscarDadosUsuario() {
    final _$actionInfo = _$_HomeStoreActionController.startAction(
        name: '_HomeStore.buscarDadosUsuario');
    try {
      return super.buscarDadosUsuario();
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic limparImagem() {
    final _$actionInfo = _$_HomeStoreActionController.startAction(
        name: '_HomeStore.limparImagem');
    try {
      return super.limparImagem();
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
lerApenas: ${lerApenas},
imageFile: ${imageFile},
carregando: ${carregando}
    ''';
  }
}
