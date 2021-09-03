import 'dart:io';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';
import 'package:my_crud/app/BO/BO_Cadastro.dart';
import 'package:my_crud/app/app_controller.dart';
import 'package:my_crud/app/model/Usuario.dart';
import 'package:my_crud/app/modules/login/repositories/db_user.dart';
import 'package:my_crud/app/widgets/image_source_sheet.dart';
import 'package:my_crud/app/widgets/simple_alert.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
part 'register_store.g.dart';

class RegisterStore = _RegisterStore with _$RegisterStore;

abstract class _RegisterStore with Store{
  ConexaoBD _acessoBD = ConexaoBD();
  AppController appController = Modular.get();

  final nomeController   = TextEditingController();
  final emailController  = TextEditingController();
  final senhaController  = TextEditingController();
  final senha2Controller = TextEditingController();
  final tellController = TextEditingController();
  final cpfController = TextEditingController();

  @observable
  int valorSexo = 3;

  @action
  mudarValorSexo(int value) => valorSexo = value;

  @observable
  String? estadoCivil;

  @action
  mudarEstadoCivil(String valueBox) => estadoCivil = valueBox;

  @observable
  bool visualizarSenha = true;

  @action
  void boolVisualizarSenha() => visualizarSenha = !visualizarSenha;

  @observable
  bool visualizarSenha2 = true;

  @action
  void boolVisualizarSenha2() => visualizarSenha2 = !visualizarSenha2;

  @observable
  File? imageFile;

  /// Pegar imagem da camera / galeria
  @action
  pegarImagem(BuildContext context) async {
    await showModalBottomSheet(
        context: context,
        builder: (context) => ImageSourceSheet(
          onImageSelected: (image) {
            if (image != null) {
              imageFile = image;
              Navigator.of(context).pop();
            }
          },
        )
    );
  }

  @observable
  bool carregando = false;

  @action
  Future _cadastrarUsuario(context) async {
    dynamic _resultado;
    carregando = true;
    Usuario usuario = Usuario();


    usuario.nome    =   nomeController.text.trim();
    usuario.senha   =   senhaController.text.trim();
    usuario.email   =   emailController.text.trim();
    usuario.cpf     =   cpfController.text.trim();
    usuario.telefone=   tellController.text.trim();
    usuario.imagem  =  imageFile!;
    usuario.sexo    =   valorSexo == 0 ? "Home" : "Mulher";
    usuario.estadoCivil= estadoCivil!;

    _resultado = await _acessoBD.cadastrarUsuario(usuario);

    carregando = false;

    if(_resultado != true){
      simpleCustomAlert(context, AlertType.error, "ATENÇÃO", _resultado);
    }
    else{
      Modular.to.navigate("/home");
      await appController.recuperarDadosUser();
    }
  }

  @observable
  bool next = false;


  @action
  mudarNext() => next = false;


  void validandoNomeEmail(context){
    String _respostaBO;

    var _validarCadastro = ValidarCadastro(
        nomeController.text.trim(),
        senhaController.text.trim(),
        senha2Controller.text.trim(),
        emailController.text.trim()
    );
    _respostaBO = _validarCadastro.validandoNomeEmail();


    if(_respostaBO  != "Valido"){
      simpleCustomAlert(
          context,
          AlertType.info,
          "ATENÇÃO",
          _respostaBO
      );
    }
    else next = true;
  }

  void validandoSenhas(context){
    String _respostaBO;

    var _validarCadastro = ValidarCadastro(
        nomeController.text.trim(),
        senhaController.text.trim(),
        senha2Controller.text.trim(),
        emailController.text.trim()
    );
    _respostaBO = _validarCadastro.validandoSenhas();

    if(_respostaBO  != "Valido"){
      simpleCustomAlert(
          context,
          AlertType.info,
          "ATENÇÃO",
          _respostaBO
      );
    }
    else _validandoCampos(context);
  }

  void _validandoCampos(context){
    if(imageFile == null){
      simpleCustomAlert(
          context,
          AlertType.info,
          "ATENÇÃO",
          "Insira uma foto de perfil!"
      );

    }else if(tellController.text.isEmpty){
      simpleCustomAlert(
          context,
          AlertType.info,
          "ATENÇÃO",
          "Insira um número de telefone válido para prosseguirmos!"
      );

    }else if(cpfController.text.isEmpty || cpfController.text.length != 14){
      simpleCustomAlert(
          context,
          AlertType.info,
          "ATENÇÃO",
          "Insira seu cpf"
      );

    }else if(valorSexo == 3){
      simpleCustomAlert(
          context,
          AlertType.info,
          "ATENÇÃO",
          "Indique qual o seu sexo para prosseguirmos!"
      );

    }else if(estadoCivil == null){
      simpleCustomAlert(
          context,
          AlertType.info,
          "ATENÇÃO",
          "Indique seu o estado civil para prosseguirmos!"
      );

    }


    else _cadastrarUsuario(context);
  }
}
