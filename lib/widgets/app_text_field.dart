import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled/enums/input_types.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final String errorText;
  final String labelText;
  final String hintText;
  final Icon? suffixIcon;
  final Function onChanged;
  final InputTypes inputType;

  const AppTextField(
      {super.key,
      required this.controller,
      required this.errorText,
      required this.labelText,
      required this.hintText,
      this.suffixIcon,
      required this.onChanged,
      required this.inputType});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
          labelText: labelText,
          labelStyle: const TextStyle(color: Colors.black),
          errorText: errorText,
          border: getBorder(),
          focusedBorder: getBorder(),
          enabledBorder: getBorder(),
          errorBorder: getBorder(),
          focusedErrorBorder: getBorder(),
          hintStyle: const TextStyle(color: Colors.grey),
          hintText: hintText,
          suffixIcon: suffixIcon),
      cursorColor: Colors.blue,
      onChanged: (value) {
        onChanged(value);
      },
      keyboardType: getKeyboardType(),
      inputFormatters: inputType == InputTypes.Number
          ? [
              buildFilteringTextInputFormatter(),
              buildTextInputFormatter(),
            ]
          : null,
    );
  }

  TextInputFormatter buildTextInputFormatter() {
    return TextInputFormatter.withFunction(
      (oldValue, newValue) {
        final selection = newValue.selection;
        try {
          newValue = TextEditingValue(
            text: newValue.text,
            selection: selection,
          );
          return newValue;
        } catch (e) {}
        return oldValue;
      },
    );
  }

  FilteringTextInputFormatter buildFilteringTextInputFormatter() {
    return FilteringTextInputFormatter.allow(
        RegExp('[۰۱۲۳۴۵۶۷۸۹0123456789٠١٢٣٤٥٦٧٨٩]'));
  }

  OutlineInputBorder getBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(width: 1, color: Colors.black),
      //gapPadding: 2,
    );
  }

  TextInputType getKeyboardType() {
    switch (inputType) {
      case InputTypes.Default:
        return TextInputType.text;
      case InputTypes.Email:
        return TextInputType.emailAddress;
      case InputTypes.Number:
        return TextInputType.phone;
      case InputTypes.PaymentCard:
        return TextInputType.phone;
      case InputTypes.Password:
        return TextInputType.text;
      case InputTypes.Multiline:
        return TextInputType.multiline;
      default:
        return TextInputType.text;
    }
  }
}
