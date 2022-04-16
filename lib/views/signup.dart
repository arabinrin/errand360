import 'package:errand260/utils/constant.dart';
import 'package:errand260/utils/navigator.dart';
import 'package:errand260/views/home.dart';
import 'package:errand260/views/login.dart';
import 'package:errand260/views/main_home.dart';
import 'package:errand260/views/passowrd.dart';
import 'package:errand260/widgets/textfield.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SingnUp extends StatefulWidget {
  const SingnUp({Key? key}) : super(key: key);

  @override
  State<SingnUp> createState() => _SingnUpState();
}

class _SingnUpState extends State<SingnUp> {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();

  TextEditingController email = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
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
                controller: firstName,
                hintText: 'First Name',
                validator: (val) {
                  val!.length >= 3;
                },
                icon: Icons.people,
              ),
              RoundedInputField(
                controller: lastName,
                hintText: 'Last Name',
                icon: Icons.people,
              ),
              RoundedInputField(
                  controller: email,
                  hintText: 'Email address',
                  validator: (val) {
                    return RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(val!)
                        ? null
                        : "Enter correct email";
                  },
                  icon: Icons.email),
              RoundedInputField(
                controller: phoneNumber,
                hintText: 'Phone Number',
                icon: Icons.phone_callback,
              ),
              const SizedBox(
                height: 20,
              ),
              PrimaryButton(
                  onTap: () async {
                    print('starting');
                    if (_formKey.currentState!.validate()) {
                      // If the form is valid, display a snackbar. In the real world,
                      // you'd often call a server or save the information in a database.
                      // _incrementCounter();
                      changeScreenReplacement(context, PasswordPage());
                    }
                  },
                  text: 'Continue'),
              LightButton(
                  onTap: () => MainHome(), text: 'Sign up with Google '),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
