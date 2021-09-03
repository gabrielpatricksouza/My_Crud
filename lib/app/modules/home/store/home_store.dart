import 'dart:io';

import 'package:email_validator/email_validator.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:my_crud/app/app_controller.dart';
import 'package:my_crud/app/model/Usuario.dart';
import 'package:my_crud/app/modules/home/repositories/db_user_home.dart';
import 'package:my_crud/app/widgets/image_source_sheet.dart';
import 'package:my_crud/app/widgets/simple_alert.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
part 'home_store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store{
  final AppController appController = Modular.get();
  final ConexaoBDHome _conexaoBD = ConexaoBDHome();

  final nomeController   = TextEditingController();
  final emailController  = TextEditingController();
  final textController  = TextEditingController();
  final tellController = TextEditingController();

  @observable
  bool lerApenas = true;

  @action
  alterarLerApenas(bool value) => lerApenas = value;

  @action
  buscarDadosUsuario(){
    nomeController.text = appController.usuario.nome;
    emailController.text = appController.usuario.email;
    tellController.text = appController.usuario.telefone;
  }

  @observable
  File? imageFile;

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
  @action
  limparImagem()=> imageFile = null;

  @observable
  bool carregando = false;

  @action
  _salvarAlteracoes(context) async {
    carregando = true;
    bool response;

    if(imageFile != null){
      await _conexaoBD.atualizarImagemPerfil(
          imageFile:  imageFile!,
          oldImageUrl: appController.usuario.urlImagem);
    }
    Usuario usuario = Usuario();
    usuario.nome = nomeController.text.trim();
    usuario.email = emailController.text.trim();
    usuario.telefone = tellController.text.trim();

    response =  await _conexaoBD.atualizarDadosUsuario(usuario);
    if(response == false){
      simpleCustomAlert(
          context,
          AlertType.error,
          "ATENÇÃO",
          "Ocorreu um erro desconhecido ao atualizar seu perfil.\nTente novamente mais tarde."
      );
    }else {
      await appController.recuperarDadosUser();
      buscarDadosUsuario();
      lerApenas = true;
    }
    carregando = false;
  }

  validarCampos(BuildContext context){
    print(EmailValidator.validate(emailController.text.trim()));

    if(nomeController.text.isEmpty){
      simpleCustomAlert(
          context,
          AlertType.info,
          "ATENÇÃO",
          "Insira seu nome para prosseguirmos!"
      );

    }else if(emailController.text.isEmpty){
      simpleCustomAlert(
          context,
          AlertType.info,
          "ATENÇÃO",
          "Insira um número de telefone válido para prosseguirmos!"
      );

    }else if(EmailValidator.validate(emailController.text.trim()) == false){
      simpleCustomAlert(
          context,
          AlertType.info,
          "ATENÇÃO",
          "Insira um e-mail válido!"
      );

    }else if(tellController.text.isEmpty ||
            ( tellController.text.length != 14
            && tellController.text.length != 15)){

      simpleCustomAlert(
          context,
          AlertType.info,
          "ATENÇÃO",
          "Insira um número de telefone válido para prosseguirmos!"
      );

    }

    else _salvarAlteracoes(context);
  }
}