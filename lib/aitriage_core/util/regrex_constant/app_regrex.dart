class AppRegrex{
  AppRegrex._();

  static final emailRegrex = RegExp(
      r'^[\w-]+(?:\.[\w-]+)*@(?:[\w-]+\.)+[a-zA-Z]{2,7}$',
    );
}