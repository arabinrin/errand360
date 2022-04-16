import 'package:errand260/utils/constant.dart';
import 'package:errand260/utils/navigator.dart';
import 'package:errand260/views/home.dart';
import 'package:errand260/views/login.dart';
import 'package:errand260/views/main_home.dart';
import 'package:errand260/views/signup.dart';
import 'package:errand260/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PasswordPage extends StatefulWidget {
  const PasswordPage({Key? key}) : super(key: key);

  @override
  State<PasswordPage> createState() => _PasswordPageState();
}

class _PasswordPageState extends State<PasswordPage> {
  TextEditingController password = TextEditingController();
  TextEditingController confirm = TextEditingController();
    final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(children: [
              const SizedBox(
                height: 50,
              ),
              Text('Create a new account',
                  style: GoogleFonts.montserrat(
                    textStyle: const TextStyle(
                      color: Color(0xff787878),
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  )),
              const SizedBox(
                height: 50,
              ),
              RoundedInputField(
                obscure: true,
                controller: password,
                hintText: 'Enter Pasword',
                icon: Icons.lock_outline,
                icon2: Icons.password,
                validator: (value) {
                  return value!.isEmpty || value.length < 2
                      ? "Please enter a correct password"
                      : null;
                },
              ),
              RoundedInputField(
                obscure: true,
                controller: confirm,
                hintText: 'Confirm Password',
                validator: (value) {
                  return value!.toString() != password.text
                      ? "Password does not match"
                      : null;
                },
                icon: Icons.lock_outline,
                icon2: Icons.password,
              ),
              PrimaryButton( onTap: () async {
                    print('starting');
                    if (_formKey.currentState!.validate()) {
                      // If the form is valid, display a snackbar. In the real world,
                      // you'd often call a server or save the information in a database.
                      // _incrementCounter();
                      changeScreenReplacement(context, MainHome());
                    }
                  }, text: 'Sign Up'),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 1,
                color: kLightGrey,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              ),
              LightButton(onTap: () => MainHome(), text: 'Sign up with Google '),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already a user?',
                      style: GoogleFonts.montserrat(
                        textStyle: const TextStyle(
                          color: Color(0xffC4C4C4),
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      )),
                  InkWell(
                    onTap: () {
                      changeScreen(context, LogIn());
                    },
                    child: Text(' Login',
                        style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                            color: kprimarycolor,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        )),
                  ),
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
