import 'package:errand260/core/http/http_repos.dart';
import 'package:errand260/utils/constant.dart';
import 'package:errand260/utils/navigator.dart';
import 'package:errand260/views/home.dart';
import 'package:errand260/views/main_home.dart';
import 'package:errand260/views/passowrd.dart';
import 'package:errand260/views/signup.dart';
import 'package:errand260/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    void _showDialog(String content, BuildContext context) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
                content: Text(
                  content,
                  style: GoogleFonts.inter(
                    textStyle: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                actions: <Widget>[
                  InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: IconButton(
                          icon: Icon(
                            Icons.cancel,
                            color: kGreen,
                          ),
                          onPressed: () {
                             Navigator.of(context).pop();
                          })),
                ]);
          });
    }

    return Scaffold(
      body: SingleChildScrollView(
          child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Text('Login into your account',
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
                controller: email,
                hintText: 'Email Address',
                icon: Icons.mail_outline,
                validator: (val) {
                  return RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(val!)
                      ? null
                      : "Enter correct email";
                },
              ),
              RoundedInputField(
                obscure: true,
                controller: password,
                hintText: 'password',
                icon: Icons.lock_outline,
                validator: (value) {
                  return value!.isEmpty || value.length < 2
                      ? "Please enter a correct password"
                      : null;
                },
              ),
              PrimaryButton(
                  onTap: () async {
                    print('starting');
                    if (_formKey.currentState!.validate()) {
                      // If the form is valid, display a snackbar. In the real world,
                      // you'd often call a server or save the information in a database.
                      // _incrementCounter();
                      changeScreenReplacement(context, MainHome());
                    }
                    await HttpRepos.loginApi
                        .login(email: email.text, password: password.text)
                        .then((value) {
                      GetStorage box = GetStorage();

                      if (value.token != null) {
                        box.write('token', value.token);
                        box.write('id', value.id);

                        // ScaffoldMessenger.of(context).showSnackBar(
                        //   const SnackBar(
                        //       content: Text('Error , Login Failed')),
                        // );

                        changeScreenReplacement(context, MainHome());
                      } else {}
                    }).onError((error, stackTrace) async {
                      await HttpRepos.loginApi
                          .loginError(
                              email: email.text, password: password.text)
                          .then((value) {
                        _showDialog(value, context);
                        // ScaffoldMessenger.of(context).showSnackBar(
                        //   SnackBar(content: Text(value)),
                        // );
                      });
                    });
                  },
                  text: 'Login'),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 1,
                color: kLightGrey,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              ),
              LightButton(
                  onTap: () => changeScreenReplacement(context, MainHome()),
                  text: 'Continue with Google '),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Don\'t have an account?',
                      style: GoogleFonts.montserrat(
                        textStyle: const TextStyle(
                          color: Color(0xffC4C4C4),
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      )),
                  InkWell(
                    onTap: () => changeScreen(context, SingnUp()),
                    child: Text(' Sign Up',
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
            ],
          ),
        ),
      )),
    );
  }
}
