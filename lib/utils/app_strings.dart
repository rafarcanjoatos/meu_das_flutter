class AppStrings {
  static const String appName = "meuDAS";

  static const String titleForgotMyPassword = "Recuperação de Senha";
  static const String descriptionForgotMyPassword =
      "Preencha o seu CPF abaixo para receber uma senha provisória em seu e-mail";

  static const String titleVerifyYourEmail = "Verifique seu Email";
  static const String descriptionVerifyYourEmail =
      "Enviamos sua senha provisória. Acesse seu e-mail e tente fazer o login novamente";

  static const String buttonSend = "Enviar";
  static const String buttonLogin = "Entrar";
  static const String buttonLoginPage = "Tela de login";
  static const String buttonEdit = "Editar";
  static const String buttonSave = "Salvar";
  static const String buttonClose = "Fechar";
  static const String buttonCancel = "Cancelar";
  static const String buttonDasGenerate = "Gerar DAS";

  static const String linkForgotMyPassword = "Esqueci Minha Senha";

  static const String hintTextCpf = "CPF";
  static const String hintTextPassword = "Senha";

  static const String menuDashboard = "Dashboard";
  static const String menuHome = "Home";
  static const String menuNotifications = "Notificações";

  static const String cpf = "CPF";
  static const String fullName = "Nome Completo";
  static const String email = "E-mail";
  static const String telephone = "Telefone";

  static const String dasMoneyBilling = "Faturamento";
  static const String dasMoneyBillingHintText = "R\$0";
  static const String dasMonth = "Mês de Apuração";
  static const String dasSelectTheMonth = "Selecione o Mês";

  static const String modalSaveEdition = "Salvar Edição";
  static const String modalConfirmDasGeneration = "Salvar Edição";
  static const String modalAreYouSure =
      "Tem certeza que gostaria de salvar estas informações?";

  static const Map<String, String> menuTitles = {
    "generateDas": "Gerar DAS",
    "myData": "Meus Dados",
    "companyData": "Dados Empresa",
    "dashboard": "Dashboard",
    "dasHistory": "Histórico DAS",
    "notification": "Notificações",
  };

  static const Map<String, String> yearMonths = {
    "january": "Janeiro",
    "february": "Fevereiro",
    "march": "Março",
    "april": "Abril",
    "may": "Maio",
    "june": "Junho",
    "july": "Julho",
    "august": "Agosto",
    "september": "Setembro",
    "october": "Outubro",
    "november": "Novembro",
    "december": "Dezembro",
  };

  static const String cpfInvalid = "CPF Inválido";
  static const String passwordInvalid = "Senha Inválido";
  static const String passwordInvalidCharacters =
      "Senha deve ter no mínimo 8 caracteres";
  static const String loginInvalid = "Login Inválido";
  static const String loadDataError =
      "Erro ao consultar informações do Usuário";

  static const String noNotification = "Não há notificações";
  static const String deletedNotification = "Notificação excluída com sucesso";

  static const String billingError = "Faturamento precisa ser maior que zero";
}
