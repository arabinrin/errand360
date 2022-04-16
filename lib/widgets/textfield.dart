import 'package:errand260/utils/constant.dart';
import 'package:errand260/utils/navigator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final IconData? icon2;
  final String? Function(String?)? validator;
  bool obscure;

  TextEditingController? controller;
  RoundedInputField(
      {required this.controller,
      required this.hintText,
      this.icon2,
      this.icon = Icons.person,
      this.obscure = false,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        validator: validator,
        obscureText: obscure,
        // onChanged: onChanged,
        cursorColor: kprimarycolor,
        controller: controller,
        decoration: InputDecoration(
          hintStyle: GoogleFonts.montserrat(
            textStyle: const TextStyle(
              color: Color(0xffB7B6B6),
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
          suffixIcon: Icon(
            icon2,
            color: Colors.grey,
            size: 18,
          ),
          icon: Icon(
            icon,
            color: Colors.grey,
            size: 18,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  TextFieldContainer({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: kLightGrey,
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }
}

class LightButton extends StatelessWidget {
  final String text;
  void Function()? onTap;
  LightButton({
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        border: Border.all(color: kprimarycolor, width: 1),
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Image.asset(
            'assets/Google.png',
            height: 30,
            width: 30,
            // color: kGreen,
          ),
          SizedBox(
            width: 50,
          ),
          InkWell(
            onTap: onTap,
            child: Center(
              child: Text(text,
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                      color: kThickAsh,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}

class PrimaryButton extends StatelessWidget {
  final String text;
  void Function()? onTap;

  PrimaryButton({
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: kprimarycolor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: onTap,
        child: Center(
          child: Text(text,
              style: GoogleFonts.montserrat(
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              )),
        ),
      ),
    );
  }
}
