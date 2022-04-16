import 'package:errand260/model/search.dart';
import 'package:errand260/utils/constant.dart';
import 'package:errand260/widgets/applicant_list.dart';
import 'package:errand260/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SaerchPage extends StatefulWidget {
  SaerchPage({Key? key}) : super(key: key);

  @override
  State<SaerchPage> createState() => _SaerchPageState();
}

class _SaerchPageState extends State<SaerchPage> {
  TextEditingController search = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  int scrollIndex = 0;

  List<Widget> body = [
    ApplicantList(),
    ApplicantList(),
    ApplicantList(),
    ApplicantList(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: RoundedInputField(
              icon2: Icons.more_horiz_outlined,
              obscure: false,
              controller: search,
              hintText: 'Search Applicants',
              icon: Icons.search_outlined,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Text('Applicants',
                style: GoogleFonts.montserrat(
                  textStyle: const TextStyle(
                      color: Color(0xff787878),
                      fontWeight: FontWeight.w700,
                      fontSize: 16),
                )),
          ),
          Container(
            height: 40,
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: searchModel.length,
                itemBuilder: (_, i) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        scrollIndex = i;
                      });
                    },
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: i == scrollIndex
                                    ? Colors.white
                                    : Colors.grey,
                                width: .5),
                            borderRadius: BorderRadius.circular(5),
                            color:
                                i == scrollIndex ? kprimarycolor : Colors.white,
                          ),
                          child: Text(
                            searchModel[i].name,
                            style: GoogleFonts.dmSans(
                              textStyle: TextStyle(
                                color: i == scrollIndex
                                    ? Colors.white
                                    : Colors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ),
          Container(
            child: body[scrollIndex],
          ),
        ],
      )),
    );
  }
}
