class UserModel {
  String? cpf;
  String? fullName;
  String? email;
  String? telephone;

  UserModel({this.cpf, this.fullName, this.email, this.telephone});

  UserModel.fromJson(Map<String, dynamic> json) {
    cpf = json["cpf"];
    fullName = json["nomeCompleto"];
    email = json["email"];
    telephone = json["telefone"];
  }

  Map<String, dynamic> toJson() {
    return {
      'cpf': cpf,
      'fullName': fullName,
      'email': email,
      'telephone': telephone,
    };
  }
}
