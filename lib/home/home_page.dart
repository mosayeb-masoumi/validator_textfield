import 'package:flutter/material.dart';
import 'package:untitled/app_validator.dart';
import 'package:untitled/enums/input_types.dart';
import 'package:untitled/widgets/app_text_field.dart';
import '../di.dart';
import 'home_validator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AppValidator _appValidator = di();
  HomeFormValidator _homeFormValidator = di();

  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  String _errorText1 = "";
  String _errorText2 = "";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return SafeArea(
        child: Scaffold(
            body: SizedBox(
      width: size.width,
      height: size.height,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppTextField(
                controller: _controller1,
                errorText: _errorText1,
                labelText: 'name',
                hintText: "Enter name",
                inputType: InputTypes.Default,
                suffixIcon: const Icon(Icons.person, color: Colors.black),
                onChanged: (value) {},
              ),
              const SizedBox(
                height: 16.0,
              ),
              AppTextField(
                controller: _controller2,
                errorText: _errorText2,
                labelText: 'phone',
                hintText: "Enter phone number",
                inputType: InputTypes.Number,
                onChanged: (value) {},
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                  onPressed: () {
                    _homeFormValidator = HomeFormValidator(
                      controller1: _controller1,
                      controller2: _controller2,
                      validator: _appValidator,
                    );

                    if (_homeFormValidator.isFormValid()) {
                      var validate = "validate";
                    }

                    setState(() {
                      _errorText1 = _homeFormValidator.validateField1();
                      _errorText2 = _homeFormValidator.validateField2();
                    });
                  },
                  child: const Text("send"))
            ],
          ),
        ),
      ),
    )));
  }
}
