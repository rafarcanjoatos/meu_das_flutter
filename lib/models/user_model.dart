class UserModel {
  String? cpf;
  String? fullName;
  String? email;
  String? telephone;

  UserModel.fromJson(Map<String, dynamic> json) {
    cpf = json["cpf"];
    fullName = json["nomeCompleto"];
    email = json["email"];
    telephone = json["telefone"];
  }
}
