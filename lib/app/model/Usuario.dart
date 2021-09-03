import 'dart:io';

class Usuario {
  String idUsuario = "";
  String nome = "";
  String email = "";
  String senha = "";
  String cpf = "";
  String sexo = "";
  String estadoCivil = "";
  String telefone = "";
  String urlImagem = "";

  File? imagem;

  Usuario({
    this.idUsuario = "",
    this.nome = "",
    this.email = "",
    this.senha = "",
    this.cpf = "",
    this.sexo = "",
    this.estadoCivil = "",
    this.telefone = "",
    this.urlImagem = "",
  });

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "id": this.idUsuario,
      "nome": this.nome,
      "email": this.email,
      "cpf"  : this.cpf,
      "sexo" : this.sexo,
      "urlImagem" : this.urlImagem,
      "telefone"   : this.telefone,
      "estadoCivil" : this.estadoCivil,
    };
    return map;
  }

  factory Usuario.fromMap(Map<dynamic, dynamic> dados) {
    return Usuario(
      idUsuario:   dados['idUsuario']   == null ? '' : dados['idUsuario'],
      nome:        dados['nome']        == null ? '' : dados['nome'],
      email:       dados['email']       == null ? '' : dados['email'],
      cpf  :       dados['cpf']         == null ? '' : dados['cpf'],
      sexo :       dados['sexo']        == null ? '' :dados['sexo'],
      urlImagem :  dados['urlImagem']   == null ? '' : dados['urlImagem'],
      telefone   : dados['telefone']    == null ? '' : dados['telefone'],
      estadoCivil :dados['estadoCivil'] == null ? '' : dados['estadoCivil']
    );
  }

  factory Usuario.clean() {
    return Usuario(idUsuario: '', nome: '', email: '',);
  }
}
