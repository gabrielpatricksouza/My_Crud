import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart' as fireAuth;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:my_crud/app/model/Usuario.dart';

class ConexaoBD {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore db = FirebaseFirestore.instance;
  final _storageRef = FirebaseStorage.instance;


  Future cadastrarUsuario(Usuario usuario) async {
    try {
      await _auth
          .createUserWithEmailAndPassword(
          email: usuario.email, password: usuario.senha).then(
              (value) async{
                print("aq");
                final String imageProfileUrl = await uploadFile(
                    file: usuario.imagem!, path: 'uploads/usuarios/perfil',
                    userId: DateTime.now().millisecondsSinceEpoch.toString()
                );
            usuario.idUsuario = value.user!.uid;
            usuario.urlImagem = imageProfileUrl;
            db.collection("usuariosCrud").doc(value.user!.uid).set(usuario.toMap());
      });
      return true;

    } on fireAuth.FirebaseAuthException catch (error) {
      var errorMessage;

      switch (error.code) {
        case "weak-password":
          errorMessage = "Senha fraca!";
          return errorMessage;

        case "invalid-email":
          errorMessage =
          "O valor fornecido para a propriedade do usuário email é inválido!";
          return errorMessage;

        case "email-already-exists":
          errorMessage =
          "O e-mail fornecido já está em uso por outro usuário. ";
          return errorMessage;

        case "email-already-in-use":
          errorMessage =
          "O e-mail fornecido já está em uso por outro usuário. ";
          return errorMessage;

        default:
          errorMessage = "Um erro desconhecido ocorreu. $error";
          return errorMessage;
      }
    }
  }
//******************************************************************************

  Future logarUsuario(Usuario usuario) async {

    try {
      await _auth.signInWithEmailAndPassword(
          email: usuario.email, password: usuario.senha);
      return true;
    } on fireAuth.FirebaseAuthException catch (error) {
      var errorMessage;

      switch (error.code) {
        case "invalid-email":
          errorMessage =
          "O valor fornecido para a propriedade do usuário email é inválido!";
          return errorMessage;

        case "wrong-password":
          errorMessage = "Senha errada!";
          return errorMessage;

        case "user-not-found":
          errorMessage = "O usuário não existe.";

          return errorMessage;
        case "user-disable":
          errorMessage = "Esse usuário foi desabilitado.";
          return errorMessage;

        case "too-many-requests":
          errorMessage = "Muitas requisições. Tente mais tarde.";
          return errorMessage;

        case "operation-not-allowed":
          errorMessage = "Login com email e senha não está habilitado.";
          return errorMessage;

        case "email-already-in-use":
          errorMessage =
          "O e-mail fornecido já está em uso por outro usuário. ";
          return errorMessage;

        default:
          errorMessage = "Um erro desconhecido ocorreu.";
          return errorMessage;
      }
    }
  }

//******************************************************************************

  Future<String> uploadFile({
    required File file,
    required String path,
    required String userId,
  }) async {
    // Image name
    String imageName = userId + DateTime.now().millisecondsSinceEpoch.toString();
    // Upload file
    final UploadTask uploadTask =
    _storageRef.ref().child(path + '/' + userId + '/' + imageName).putFile(file);
    final TaskSnapshot snapshot = await uploadTask;
    String url = await snapshot.ref.getDownloadURL();
    // return file link
    return url;
  }

//******************************************************************************


  Future<bool> deslogarUsuario() async {

    await  _auth.signOut();

    bool verificarUsuarioDeslogado = checkCurrentUser();
    if (verificarUsuarioDeslogado) {
      return false;
    } else {
      return true;
    }
  }
//******************************************************************************

  bool checkCurrentUser() {
    User? user = _auth.currentUser;
    return user != null ? true : false;
  }
}
