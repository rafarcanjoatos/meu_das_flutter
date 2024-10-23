import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:meu_das_flutter/pages/app/user_info_page.dart';
import 'package:meu_das_flutter/services/user_service.dart';
import 'package:meu_das_flutter/utils/app_strings.dart';
import 'package:meu_das_flutter/widgets/modal/dialog_modal.dart';
import 'package:meu_das_flutter/widgets/page/generic_app_page_widget.dart';
import 'package:meu_das_flutter/widgets/utils/button_widget.dart';
import 'package:meu_das_flutter/widgets/utils/input_widget.dart';

class UserEditPage extends StatefulWidget {
  const UserEditPage({super.key});

  @override
  State<UserEditPage> createState() => _UserEditPageState();
}

class _UserEditPageState extends State<UserEditPage> {
  TextEditingController controllerEmail = TextEditingController();
  MaskedTextController controllerTelephone =
      MaskedTextController(mask: '(00)0.0000-0000');
  UserService user = UserService();

  @override
  Widget build(BuildContext context) {
    return GenericAppPageWidget(
      companyHeader: false,
      paddingCompanyHeader: 0,
      body: FutureBuilder(
        future: user.consumerApi(),
        builder: (context, user) {
          return Column(
            children: [
              InputWidget(
                hintText: user.data?.cpf ?? "",
                readOnly: true,
                title: AppStrings.cpf,
                keyboardType: TextInputType.none,
              ),
              InputWidget(
                hintText: user.data?.fullName ?? "",
                readOnly: true,
                title: AppStrings.fullName,
                keyboardType: TextInputType.none,
              ),
              InputWidget(
                hintText: user.data?.email ?? "",
                controller: controllerEmail,
                autoFocus: true,
                title: AppStrings.email,
                keyboardType: TextInputType.emailAddress,
              ),
              InputWidget(
                hintText: user.data?.telephone ?? "",
                controller: controllerTelephone,
                title: AppStrings.telephone,
                keyboardType: TextInputType.phone,
                padding: 10.0,
              ),
              ButtonWidget(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const DialogModal(
                        title: AppStrings.modalSaveEdition,
                        description: AppStrings.modalAreYouSure,
                        page: UserInfoPage(),
                      );
                    },
                  );
                },
                buttonText: AppStrings.buttonSave,
              ),
            ],
          );
        },
      ),
    );
  }
}
