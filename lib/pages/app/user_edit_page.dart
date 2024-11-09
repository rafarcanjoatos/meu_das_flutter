import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:meu_das_flutter/pages/app/user_info_page.dart';
import 'package:meu_das_flutter/services/cache_manager_service.dart';
import 'package:meu_das_flutter/utils/app_strings.dart';
import 'package:meu_das_flutter/utils/snackbar_utils.dart';
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

  @override
  Widget build(BuildContext context) {
    return GenericAppPageWidget(
      companyHeader: false,
      paddingCompanyHeader: 0,
      body: FutureBuilder(
        future: CacheManagerService.getUserData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(
              child: SnackbarUtils.showErrorMessage(
                  context, "Nenhum dado encontrado"),
            );
          }

          if (snapshot.hasData) {
            var userData = snapshot.data;

            controllerEmail.text = userData?.email ?? "";
            controllerTelephone.text = userData?.telephone ?? "";

            return Column(
              children: [
                InputWidget(
                  hintText: userData?.cpf ?? "",
                  readOnly: true,
                  title: AppStrings.cpf,
                  keyboardType: TextInputType.none,
                ),
                InputWidget(
                  hintText: userData?.fullName ?? "",
                  readOnly: true,
                  title: AppStrings.fullName,
                  keyboardType: TextInputType.none,
                ),
                InputWidget(
                  hintText: userData?.email ?? "",
                  controller: controllerEmail,
                  autoFocus: true,
                  maxLenght: 50,
                  title: AppStrings.email,
                  keyboardType: TextInputType.emailAddress,
                ),
                InputWidget(
                  hintText: userData?.telephone ?? "",
                  controller: controllerTelephone,
                  title: AppStrings.telephone,
                  keyboardType: TextInputType.phone,
                  padding: 10.0,
                ),
                ButtonWidget(
                  onPressed: () async {
                    await CacheManagerService.updateUserData(
                      controllerEmail.text,
                      controllerTelephone.text,
                    );

                    showDialog(
                      // ignore: use_build_context_synchronously
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
          } else {
            return Center(
              child: SnackbarUtils.showErrorMessage(
                  context, "Nenhum dado encontrado"),
            );
          }
        },
      ),
    );
  }
}
