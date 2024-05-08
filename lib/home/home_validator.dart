
import 'package:flutter/material.dart';
import 'package:untitled/app_validator.dart';
class HomeFormValidator {
  final TextEditingController? controller1;
  final TextEditingController? controller2;
  final AppValidator? validator;

  HomeFormValidator({
    this.controller1,
    this.controller2,
    this.validator,
  });

  String validateField1() {
    return validator!.validateName(controller1!.text);
  }

  String validateField2() {
    return validator!.validateMobile(controller2!.text);
  }

  bool isFormValid() {
    return validateField1().isEmpty && validateField2().isEmpty;
  }
}