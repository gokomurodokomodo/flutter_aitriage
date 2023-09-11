import 'package:flutter/material.dart';

class TextControllerVM{
  final _organizationFieldController = TextEditingController();
  final _firstNameFieldController = TextEditingController();
  final _lastNameFieldController = TextEditingController();
  final _emailFieldController = TextEditingController();
  final _phoneNumberFieldController = TextEditingController();
  final _passwordFieldController = TextEditingController();

  void updateVM({
    String? organizationFieldController,
    String? firstNameFieldController,
    String? lastNameFieldController,
    String? emailFieldController,
    String? phoneNumberFieldController,
    String? passwordFieldController,
  }){
    _organizationFieldController.text = organizationFieldController ?? _organizationFieldController.text;
    _firstNameFieldController.text = firstNameFieldController ?? _firstNameFieldController.text;
    _lastNameFieldController.text = lastNameFieldController ?? _lastNameFieldController.text;
    _emailFieldController.text = emailFieldController ?? _emailFieldController.text;
    _phoneNumberFieldController.text = phoneNumberFieldController ?? _phoneNumberFieldController.text;
    _passwordFieldController.text = passwordFieldController ?? _passwordFieldController.text;
  }

  TextEditingController get organizationFieldController => _organizationFieldController;
  TextEditingController get firstNameFieldController => _firstNameFieldController;
  TextEditingController get lastNameFieldController => _lastNameFieldController;
  TextEditingController get emailFieldController => _emailFieldController;
  TextEditingController get phoneNumberFieldController => _phoneNumberFieldController;
  TextEditingController get passwordFieldController => _passwordFieldController;
}