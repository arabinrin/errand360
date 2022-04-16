import 'package:errand260/model/applicant.dart';
import 'package:errand260/utils/constant.dart';
import 'package:errand260/widgets/group_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileDetail extends StatelessWidget {
  const ProfileDetail({
    Key? key,
    this.applicantModel,
  }) : super(key: key);
  final ApplicantModel? applicantModel;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      elevation: 0,
      backgroundColor: Colors.white,
      child: Container(
        height: 500,
        width: 330,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            border: Border.all(color: kprimarycolor, width: 1),
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: NetworkImage(applicantModel!.avatar!)),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${applicantModel!.first_name} ${applicantModel!.last_name}',
                              style: GoogleFonts.montserrat(
                                textStyle: const TextStyle(
                                    color: Color(0xff787878),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16),
                              ),
                            ),
                            Text(
                              '${applicantModel!.email}',
                              style: GoogleFonts.montserrat(
                                textStyle: const TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.comment,
                        size: 25,
                        color: Color(0xffBF9DF2),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      'Social Skill',
                      style: GoogleFonts.montserrat(
                        textStyle: const TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w400,
                            fontSize: 10),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Home(
                  buttons: applicantModel!.social_skil!,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      'Prfessional Skill',
                      style: GoogleFonts.montserrat(
                        textStyle: const TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w400,
                            fontSize: 10),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Home(
                  buttons: applicantModel!.social_skil!,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      'Education',
                      style: GoogleFonts.montserrat(
                        textStyle: const TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w400,
                            fontSize: 10),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Text(
                    applicantModel!.education!,
                    style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                          color: Color(0xff787878),
                          fontWeight: FontWeight.w600,
                          fontSize: 13),
                    ),
                  ),
                ),
                Text(
                  'Bachelor of Business Administration',
                  style: GoogleFonts.montserrat(
                    textStyle: const TextStyle(
                        color: Color(0xff787878),
                        fontWeight: FontWeight.w400,
                        fontSize: 11),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      'Experience',
                      style: GoogleFonts.montserrat(
                        textStyle: const TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w400,
                            fontSize: 10),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Text(
                    'Tech Club',
                    style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                          color: Color(0xff787878),
                          fontWeight: FontWeight.w600,
                          fontSize: 13),
                    ),
                  ),
                ),
                Text(
                  'Mobile Develpment volunteer',
                  style: GoogleFonts.montserrat(
                    textStyle: const TextStyle(
                        color: Color(0xff787878),
                        fontWeight: FontWeight.w400,
                        fontSize: 11),
                  ),
                ),
                Container(
                  height: .5,
                  color: Color(0xff787878),
                  margin: EdgeInsets.symmetric(vertical: 20),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'View full profile',
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                            color: Color(0xff8545E5),
                            fontWeight: FontWeight.w700,
                            fontSize: 16),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
