import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_crud/app/modules/login/store/register_store.dart';
import 'package:my_crud/app/widgets/custom_animated_button.dart';
import 'package:my_crud/app/widgets/custom_change_choice.dart';
import 'package:my_crud/app/widgets/input_customizado.dart';

class SingUp extends StatelessWidget {
  final RegisterStore controller = Modular.get();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Observer(
          builder: (_) =>Scaffold(
            key: scaffoldKey,
            backgroundColor: Colors.deepPurpleAccent,
            body:  Stack(
              children: [
                if (controller.carregando == false)
                  Positioned(
                    top: 20,
                    left: 0,
                    child: IconButton(
                        icon: Icon(Icons.arrow_back_ios_outlined),
                        iconSize: 30,
                        onPressed: (){
                          controller.next == true ? controller.mudarNext() : Modular.to.pop();
                          FocusScope.of(context).unfocus();
                        }),
                  ),
                controller.carregando
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Center(child: CircularProgressIndicator())
                        ],
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 38.0),
                      child: NotificationListener<
                          OverscrollIndicatorNotification>(
                        onNotification:
                            (OverscrollIndicatorNotification overscroll) {
                          overscroll.disallowGlow();
                          return true;
                        },
                        child: SingleChildScrollView(
                          child: Observer(
                            builder: (_) => SafeArea(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(height: controller.next != true ? 100 : 40,),

                                  if(controller.next != true)
                                  Text(
                                    "MEU\nCADASTRO",
                                    style: TextStyle(
                                        fontSize: MediaQuery.of(context).size.width / 8,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white70),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(height: 30,),

                                  if (controller.next != true) ...[
                                    Container(
                                      height: MediaQuery.of(context).size.height / 3.5,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          InputCustomizado(
                                            icon: Icons.person,
                                            hintText: "Nome",
                                            hintStyle:
                                            TextStyle(color: Colors.white),
                                            fillColor: Colors.white.withOpacity(0.2),
                                            keyboardType: TextInputType.text,
                                            controller:
                                            controller.nomeController,
                                          ),
                                          SizedBox(height: 20),

                                          InputCustomizado(
                                            icon: Icons.mail,
                                            hintText: "E-mail",
                                            hintStyle:
                                            TextStyle(color: Colors.white),
                                            fillColor: Colors.white.withOpacity(0.2),
                                            keyboardType: TextInputType.emailAddress,
                                            controller: controller.emailController,
                                          ),
                                          SizedBox(height: 20),
                                        ],
                                      ),
                                    )
                                  ] else ...[

                                    Observer(
                                      builder:(_) =>  GestureDetector(
                                        child: Center(
                                          child: controller.imageFile == null
                                            ? CircleAvatar(
                                                radius: 60,
                                                backgroundColor: Colors.white.withOpacity(0.2),
                                                child: Icon(Icons.camera_alt_outlined, size: 40, color: Colors.white),
                                              )
                                            : CircleAvatar(
                                                radius: 60,
                                                backgroundImage: FileImage(controller.imageFile!),
                                                )),
                                        onTap: () {
                                          FocusScope.of(context).unfocus();
                                          controller.pegarImagem(context);
                                        },
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text("Foto do usuário",
                                        textAlign: TextAlign.center),
                                    SizedBox(height: 20),

                                    InputCustomizado(
                                      icon: Icons.phone_android,
                                      hintText: "Telefone",
                                      hintStyle: TextStyle(color: Colors.white),
                                      fillColor: Colors.white.withOpacity(0.2),
                                      enableColor: Colors.white,
                                      keyboardType: TextInputType.phone,
                                      controller: controller.tellController,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly,
                                        TelefoneInputFormatter(),
                                      ],
                                    ),
                                    SizedBox(height: 20),

                                    InputCustomizado(
                                      icon: Icons.credit_card_outlined,
                                      hintText: "CPF",
                                      hintStyle: TextStyle(color: Colors.white),
                                      fillColor: Colors.white.withOpacity(0.2),
                                      enableColor: Colors.white,
                                      keyboardType: TextInputType.number,
                                      controller: controller.cpfController,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly,
                                        CpfInputFormatter(),
                                      ],
                                    ),
                                    SizedBox(height: 20),

                                    Observer(
                                      builder: (_) => CustomChangeChoice(
                                        function: (int num) {
                                          FocusScope.of(context).unfocus();
                                          controller.mudarValorSexo(num);
                                        },
                                        valueSex: controller.valorSexo,
                                      ),
                                    ),
                                    SizedBox(height: 20),

                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child: Padding(
                                            padding: const EdgeInsets.only(left: 8),
                                            child: Text(
                                              "Estado Civil :",
                                              style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.white.withOpacity(0.8),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Material(
                                            borderRadius: BorderRadius.circular(20),
                                            elevation: 2.0,
                                            color: Colors.white,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 15, right: 20),
                                              child: Observer(
                                                builder: (_) => DropdownButton(
                                                  dropdownColor: Colors.white,
                                                  focusColor: Colors.white,
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 18,
                                                  ),
                                                  value: controller.estadoCivil,
                                                  items: [
                                                    DropdownMenuItem(
                                                        child: Text("Solteiro"),
                                                        value: "Solteiro"),
                                                    DropdownMenuItem(
                                                        child: Text("Casado"),
                                                        value: "Casado"),
                                                    DropdownMenuItem(
                                                        child: Text("Separado"),
                                                        value: "Separado"),
                                                    DropdownMenuItem(
                                                        child: Text("Divorciado"),
                                                        value: "Divorciado"),
                                                    DropdownMenuItem(
                                                        child: Text("Viúvo"),
                                                        value: "Viúvo"),
                                                  ],
                                                  onChanged: (val) {
                                                    FocusScope.of(context).unfocus();
                                                    controller.mudarEstadoCivil(val.toString());
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 20),

                                    InputCustomizado(
                                      icon: Icons.lock,
                                      hintText: "Senha",
                                      hintStyle:
                                          TextStyle(color: Colors.white),
                                      fillColor: Colors.white.withOpacity(0.2),
                                      enableColor: Colors.white,
                                      suffixIcon: GestureDetector(
                                        onTap: controller.boolVisualizarSenha,
                                        child: Icon(
                                          controller.visualizarSenha
                                              ? Icons.visibility_off
                                              : Icons.visibility,
                                          color:  Colors.white,
                                        ),
                                      ),
                                      controller:
                                          controller.senhaController,
                                      obscure: controller.visualizarSenha,
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                    ),
                                    SizedBox(height: 20),

                                    InputCustomizado(
                                      icon: Icons.lock,
                                      hintText: "Confirmar Senha",
                                      hintStyle: TextStyle(color: Colors.white),
                                      fillColor: Colors.white.withOpacity(0.2),
                                      enableColor: Colors.white,
                                      suffixIcon: GestureDetector(
                                        onTap: controller.boolVisualizarSenha2,
                                        child: Icon(
                                          controller.visualizarSenha2
                                              ? Icons.visibility_off
                                              : Icons.visibility,
                                          color:  Colors.white,
                                        ),
                                      ),
                                      controller:
                                          controller.senha2Controller,
                                      obscure: controller.visualizarSenha2,
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                    ),
                                    SizedBox(height: 10),
                                  ],
                                  controller.next == false
                                      ? Padding(
                                          padding:
                                              const EdgeInsets.only(top: 10.0),
                                          child: Column(
                                            children: [
                                              CustomAnimatedButton(
                                                onTap: () {
                                                  controller.validandoNomeEmail(context);
                                                  FocusScope.of(context).unfocus();
                                                },
                                                widhtMultiply: 1,
                                                height: 60,
                                                color: Color(0XFF338fa0),
                                                text: "Próximo",
                                              ),
                                            ],
                                          )
                                        )
                                      : Padding(
                                          padding:
                                              const EdgeInsets.only(top: 10.0),
                                          child: Column(
                                            children: [
                                              CustomAnimatedButton(
                                                onTap: () {
                                                  controller.validandoSenhas(context);
                                                  FocusScope.of(context).unfocus();
                                                },
                                                widhtMultiply: 1,
                                                height: 60,
                                                color: Color(0XFF338fa0),
                                                text: "Cadastrar",
                                              ),
                                              SizedBox(height: 20.0,),
                                            ],
                                          ),
                                        ),
                                  SizedBox(height: 10),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
              ],
            ),
          )
      ),
    );
  }
}
