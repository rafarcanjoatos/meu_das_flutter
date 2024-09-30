class Company {
  String cnpj;
  String razaoSocial;
  String nomeFantasia;
  String dataAbertura;
  String porte;
  String naturezaJuridica;
  bool opcaoPeloMei;
  double capitalSocial;
  String tipo;
  String situacao;
  String dataSituacaoCadastral;

  Company({
    required this.cnpj,
    required this.razaoSocial,
    required this.nomeFantasia,
    required this.dataAbertura,
    required this.porte,
    required this.naturezaJuridica,
    required this.opcaoPeloMei,
    required this.capitalSocial,
    required this.tipo,
    required this.situacao,
    required this.dataSituacaoCadastral,
  });

  void showInfo() {
    print('CNPJ: $cnpj');
    print('Razão Social: $razaoSocial');
    print('Nome Fantasia: $nomeFantasia');
    print('Data de Abertura: $dataAbertura');
    print('Porte: $porte');
    print('Natureza Jurídica: $naturezaJuridica');
    print('Opção pelo MEI: ${opcaoPeloMei ? "Sim" : "Não"}');
    print('Capital Social: R\$ ${capitalSocial.toStringAsFixed(2)}');
    print('Tipo: $tipo');
    print('Situação: $situacao');
    print('Data Situação Cadastral: $dataSituacaoCadastral');
  }
}
