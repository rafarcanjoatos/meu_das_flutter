class UserModel {
  String? cnpj;
  String? razaoSocial;
  String? nomeFantasia;
  String? dataAbertura;
  String? porte;
  String? naturezaJuridica;
  bool? opcaoPeloMei;
  double? capitalSocial;
  String? tipo;
  String? situacao;
  String? dataSituacaoCadastral;

  UserModel.fromJson(Map<String, dynamic> json) {
    cnpj = json["cnpj"];
    razaoSocial = json["razaoSocial"];
    nomeFantasia = json["nomeFantasia"];
    dataAbertura = json["dataAbertura"];
    porte = json["porte"];
    naturezaJuridica = json["naturezaJuridica"];
    opcaoPeloMei = json["opcaoPeloMei"];
    capitalSocial = json["capitalSocial"].toDouble();
    tipo = json["tipo"];
    situacao = json["situacao"];
    dataSituacaoCadastral = json["dataSituacaoCadastral"];
  }
}
