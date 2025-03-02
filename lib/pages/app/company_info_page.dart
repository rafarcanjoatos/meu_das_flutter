import 'package:flutter/material.dart';
import 'package:meuDas/services/cache_manager_service.dart';
import 'package:meuDas/widgets/page/generic_app_page_widget.dart';
import 'package:meuDas/widgets/utils/text_widget.dart';

class CompanyInfoPage extends StatefulWidget {
  const CompanyInfoPage({super.key});

  @override
  State<CompanyInfoPage> createState() => _CompanyInfoPageState();
}

class _CompanyInfoPageState extends State<CompanyInfoPage> {
  @override
  Widget build(BuildContext context) {
    return GenericAppPageWidget(
      body: FutureBuilder(
        future: CacheManagerService.getCompanyData(),
        builder: (context, value) {
          final data = value.data;
          final identifiers = {
            "CNPJ": data?.cnpj,
            "Razão Social": data?.razaoSocial,
            "Nome Fantasia": data?.nomeFantasia,
            "Data de Abertura": data?.dataAbertura,
            "Porte": data?.porte,
            "Natureza Jurídica": data?.naturezaJuridica,
            "Opção pelo MEI": data?.opcaoPeloMei == true ? 'Sim' : 'Não',
            "Capital Social": "R\$ ${data?.capitalSocial?.toStringAsFixed(2)}",
            "Tipo": data?.tipo,
            "Situação": data?.situacao,
            "Data Situação Cadastral": data?.dataSituacaoCadastral,
          };

          return ListView(
            children: identifiers.entries.map(
              (entry) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget.title2(text: "${entry.key}: "),
                    TextWidget.description(text: entry.value ?? ""),
                  ],
                );
              },
            ).toList(),
          );
        },
      ),
      pageIndex: 1,
    );
  }
}
