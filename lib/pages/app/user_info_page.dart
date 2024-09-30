import 'package:flutter/material.dart';
import 'package:meu_das_flutter/pages/app/user_edit_page.dart';
import 'package:meu_das_flutter/services/user_service.dart';
import 'package:meu_das_flutter/utils/app_strings.dart';
import 'package:meu_das_flutter/utils/navigator_utils.dart';
import 'package:meu_das_flutter/widgets/page/generic_app_page_widget.dart';
import 'package:meu_das_flutter/widgets/utils/button_widget.dart';
import 'package:meu_das_flutter/widgets/utils/input_widget.dart';

class UserInfoPage extends StatefulWidget {
  const UserInfoPage({super.key});

  @override
  State<UserInfoPage> createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {
  TextEditingController controller = TextEditingController();
  UserService user = UserService();

  @override
  Widget build(BuildContext context) {
    return GenericAppPageWidget(
      body: FutureBuilder(
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
                readOnly: true,
                title: AppStrings.email,
                keyboardType: TextInputType.none,
              ),
              InputWidget(
                hintText: user.data?.telephone ?? "",
                controller: controller,
                readOnly: true,
                title: AppStrings.telephone,
                keyboardType: TextInputType.none,
                padding: 20.0,
              ),
              ButtonWidget(
                onPressed: () => NavigatorUtils.navigatorScreen(
                    context, const UserEditPage()),
                buttonText: AppStrings.buttonEdit,
              ),
            ],
          );
        },
      ),
    );
  }
}
