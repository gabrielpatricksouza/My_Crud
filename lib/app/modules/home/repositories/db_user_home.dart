import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:my_crud/app/model/Usuario.dart';

class ConexaoBDHome {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore db = FirebaseFirestore.instance;
  final _storageRef = FirebaseStorage.instance;


  Future atualizarDadosUsuario(Usuario usuario) async {
    try {
      db.collection("usuariosCrud").doc(_auth.currentUser!.uid).update({
        "nome": usuario.nome,
        "email": usuario.email,
        "telefone"   : usuario.telefone,
      });
      return true;
    } catch (error) {
      return false;
    }
  }

//******************************************************************************

  Future<String> atualizarImagem({
    required File file,
    required String path,
    required String userId,
  }) async {
    String imageName = userId + DateTime.now().millisecondsSinceEpoch.toString();
    final UploadTask uploadTask =
    _storageRef.ref().child(path + '/' + userId + '/' + imageName).putFile(file);
    final TaskSnapshot snapshot = await uploadTask;
    String url = await snapshot.ref.getDownloadURL();
    return url;
  }

//******************************************************************************

  Future<void> atualizarImagemPerfil({
    required File imageFile,
    String? oldImageUrl,
    int? index}) async {

    String uploadPath = "uploads/usuarios/perfil";
    if (oldImageUrl != null) {
      await FirebaseStorage.instance.refFromURL(oldImageUrl).delete();
    }
    final imageLink = await atualizarImagem(file: imageFile, path: uploadPath, userId: _auth.currentUser!.uid);
    await db.collection('usuariosCrud').doc(_auth.currentUser!.uid).update({"urlImagem": imageLink});
  }
//******************************************************************************


  Future deslogarUsuario() async => await _auth.signOut();
}
