import 'package:errand260/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:group_button/group_button.dart';

class Home extends StatelessWidget {
  Home({Key? key, required this.buttons}) : super(key: key);
  final List<String> buttons;

  @override
  Widget build(BuildContext context) {
    return GroupButton(
        mainGroupAlignment : MainGroupAlignment.start,
   crossGroupAlignment : CrossGroupAlignment.start,
   groupRunAlignment : GroupRunAlignment.start,
      spacing: 5,
      isRadio: false,
      direction: Axis.horizontal,
      onSelected: (index, isSelected) {
        //   print('$index button is ${isSelected ? 'selected' : 'unselected'}'),
      },
      buttons: buttons,
      selectedButtons: [0, 1],

      /// [List<int>] after 2.2.1 version
      selectedTextStyle: GoogleFonts.nunito(
        textStyle: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 10,
          color: Colors.white,
        ),
      ),
      unselectedTextStyle: GoogleFonts.nunito(
        textStyle: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 10,
          color: Colors.white,
        ),
      ),
      selectedColor: Color(0xffBF9DF2),
      unselectedColor: Color(0xffBF9DF2),
      borderRadius: BorderRadius.circular(5),
      selectedBorderColor: Color(0xffBF9DF2),
      buttonHeight: 25,
      runSpacing: 5,
textPadding: EdgeInsets.all(3),
      selectedShadow: <BoxShadow>[BoxShadow(color: Colors.transparent)],
      unselectedShadow: <BoxShadow>[BoxShadow(color: Colors.transparent)],
    );
  }
}
