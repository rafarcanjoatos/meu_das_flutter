import 'package:flutter/material.dart';
import 'package:meu_das_flutter/services/user_service.dart';
import 'package:meu_das_flutter/utils/app_strings.dart';
import 'package:meu_das_flutter/utils/navigator_utils.dart';
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
  TextEditingController controller = TextEditingController();
  UserService user = UserService();

  @override
  Widget build(BuildContext context) {
    return GenericAppPageWidget(
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: user.consumerApi(),
          builder: (context, user) {
            return Column(
              children: [
                InputWidget(
                  hintText: user.data?.cpf ?? "",
                  controller: controller,
                  readOnly: true,
                  title: AppStrings.cpf,
                  keyboardType: TextInputType.none,
                ),
                InputWidget(
                  hintText: user.data?.fullName ?? "",
                  controller: controller,
                  readOnly: true,
                  title: AppStrings.fullName,
                  keyboardType: TextInputType.none,
                ),
                InputWidget(
                  hintText: user.data?.email ?? "",
                  controller: controller,
                  autoFocus: true,
                  title: AppStrings.email,
                  keyboardType: TextInputType.emailAddress,
                ),
                InputWidget(
                  hintText: user.data?.telephone ?? "",
                  controller: controller,
                  title: AppStrings.telephone,
                  keyboardType: TextInputType.phone,
                  padding: 20.0,
                ),
                ButtonWidget(
                  onPressed: () => NavigatorUtils.navigatorScreen(
                      context,
                      const DialogModal(
                        title: AppStrings.modalSaveEdition,
                        description: AppStrings.modalAreYouSure,
                      )),
                  buttonText: AppStrings.buttonSave,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
