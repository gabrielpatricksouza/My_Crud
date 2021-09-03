import 'package:brasil_fields/brasil_fields.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_crud/app/modules/home/store/home_store.dart';
import 'package:my_crud/app/widgets/input_customizado.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final HomeStore controller = Modular.get();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Observer(
        builder: (_) => Scaffold(
          backgroundColor: Colors.deepPurpleAccent,
          appBar: AppBar(
            title: Text(
              controller.lerApenas ? "Meu Perfil" : "Editar",
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white.withOpacity(0.8)),
            ),
            centerTitle: true,
            backgroundColor: Colors.deepPurpleAccent,
            leading: controller.lerApenas
                ? IconButton(
                    onPressed: () {
                      controller.buscarDadosUsuario();
                      controller.alterarLerApenas(false);
                    },
                    color: Colors.white.withOpacity(0.8),
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    icon: Icon(Icons.edit))
                : IconButton(
                    onPressed: () {
                      controller.limparImagem();
                      controller.alterarLerApenas(true);
                    },
                    color: Colors.redAccent,
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    iconSize: 30,
                    icon: Icon(Icons.close)),
            actions: [
              if (controller.lerApenas)
                IconButton(
                    onPressed: () {
                      FirebaseAuth.instance.signOut();
                      Modular.to.navigate('/login');
                    },
                    color: Colors.white.withOpacity(0.5),
                    icon: Icon(Icons.exit_to_app)),
            ],
          ),
          body: SafeArea(
            child: Observer(
              builder: (_) => controller.carregando
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Center(child: CircularProgressIndicator())
                        ],
                      ),
                    )
                  : SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 10.0,
                            ),
                            GestureDetector(
                              onTap: () {
                                controller.pegarImagem(context);
                              },
                              child: Stack(
                                children: [
                                  Container(
                                    height: 300,
                                    width: double.maxFinite,
                                    child: Card(
                                      elevation: 8.0,
                                      color: Colors.white.withOpacity(0.2),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18.0)),
                                      child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(18.0),
                                          child: controller.imageFile == null
                                              ? CachedNetworkImage(
                                                  filterQuality:
                                                      FilterQuality.high,
                                                  color: controller.lerApenas
                                                      ? null
                                                      : Colors.black.withOpacity(0.5),
                                                  colorBlendMode: BlendMode.colorBurn,
                                                  imageUrl: controller.appController.usuario.urlImagem.isEmpty
                                                      ? "https://firebasestorage.googleapis.com/v0/b/todo-list-5be73.appspot.com/o/uploads%2Fscaffod.jpg?alt=media&token=56f2ff61-7129-4f86-a529-9a53fabe6d2d"
                                                      : controller.appController
                                                          .usuario.urlImagem,
                                                  fit: BoxFit.cover,
                                                  errorWidget:
                                                      (context, url, error) =>
                                                          new Icon(Icons.error),
                                                )
                                              : Image.file(
                                                  controller.imageFile!,
                                                  filterQuality:
                                                      FilterQuality.high,
                                                  fit: BoxFit.cover,
                                                )
                                      ),
                                    ),
                                  ),
                                  if (controller.lerApenas == false)
                                    Positioned(
                                      child: Icon(
                                        Icons.camera_alt_outlined,
                                        color: Colors.white.withOpacity(0.6),
                                        size: 45,
                                      ),
                                      right: 0,
                                      left: 0,
                                      top: 0,
                                      bottom: 0,
                                    ),
                                ],
                              ),
                            ),
                            SizedBox(height: 20),
                            InputCustomizado(
                              icon: Icons.person,
                              readOnly: controller.lerApenas,
                              enableColor: controller.lerApenas
                                  ? Colors.black87
                                  : Colors.white,
                              hintText:controller.lerApenas
                                  ? controller.appController.usuario.nome
                                  : "Nome",
                              hintStyle: TextStyle(color: Colors.white),
                              fillColor: Colors.white.withOpacity(0.2),
                              keyboardType: TextInputType.text,
                              controller: controller.nomeController,
                            ),
                            SizedBox(height: 10),
                            InputCustomizado(
                              icon: Icons.mail,
                              readOnly: controller.lerApenas,
                              enableColor: controller.lerApenas
                                  ? Colors.black87
                                  : Colors.white,
                              hintText: controller.lerApenas
                                  ? controller.appController.usuario.email
                                  : "E-mail",
                              hintStyle: TextStyle(color: Colors.white),
                              fillColor: Colors.white.withOpacity(0.2),
                              keyboardType: TextInputType.emailAddress,
                              controller: controller.emailController,
                            ),
                            SizedBox(height: 10),
                            InputCustomizado(
                              icon: Icons.phone,
                              readOnly: controller.lerApenas,
                              enableColor: controller.lerApenas
                                  ? Colors.black87
                                  : Colors.white,
                              hintText: controller.lerApenas
                                  ? controller.appController.usuario.telefone
                                  : "Telefone",
                              hintStyle: TextStyle(color: Colors.white),
                              fillColor: Colors.white.withOpacity(0.2),
                              keyboardType: TextInputType.phone,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                TelefoneInputFormatter(),
                              ],
                              controller: controller.tellController,
                            ),
                            SizedBox(height: 10),
                            if (controller.lerApenas == false)
                              Padding(
                                padding: const EdgeInsets.only(top: 20.0),
                                child: TextButton(
                                    style: ButtonStyle(
                                      minimumSize: MaterialStateProperty.all(
                                          Size(double.maxFinite, 50)),
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.white.withOpacity(0.2)),
                                      shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(18.0))),
                                    ),
                                    onPressed: () {
                                      controller.validarCampos(context);
                                    },
                                    child: Text(
                                      "SALVAR",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    )),
                              )
                            else ...[
                              InputCustomizado(
                                icon: Icons.credit_card_rounded,
                                readOnly: true,
                                hintText: controller.appController.usuario.cpf,
                                hintStyle: TextStyle(color: Colors.white),
                                fillColor: Colors.white.withOpacity(0.2),
                                keyboardType: TextInputType.emailAddress,
                              ),
                              SizedBox(height: 10),
                              InputCustomizado(
                                icon: FontAwesomeIcons.venusMars,
                                readOnly: true,
                                hintText: controller.appController.usuario.sexo,
                                hintStyle: TextStyle(color: Colors.white),
                                fillColor: Colors.white.withOpacity(0.2),
                                keyboardType: TextInputType.emailAddress,
                              ),
                              SizedBox(height: 10),
                              InputCustomizado(
                                icon: Icons.people,
                                readOnly: true,
                                hintText: controller
                                    .appController.usuario.estadoCivil,
                                hintStyle: TextStyle(color: Colors.white),
                                fillColor: Colors.white.withOpacity(0.2),
                                keyboardType: TextInputType.emailAddress,
                              ),
                            ],
                            SizedBox(height: 10),
                          ],
                        ),
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
