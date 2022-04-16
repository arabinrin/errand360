import 'package:errand260/model/applicant.dart';
import 'package:errand260/utils/constant.dart';
import 'package:errand260/widgets/profile_detail.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ApplicantList extends StatelessWidget {
  const ApplicantList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: aplicantModels.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (ctx, index) {
            return Container(
              height: 120,
              width: 240,
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 2,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
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
                              margin: EdgeInsets.all(5),
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: kprimarycolor, width: 1),
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: NetworkImage(
                                        aplicantModels[index].avatar!)),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${aplicantModels[index].first_name} ${aplicantModels[index].last_name}',
                                  style: GoogleFonts.montserrat(
                                    textStyle: const TextStyle(
                                        color: Color(0xff787878),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16),
                                  ),
                                ),
                                Text(
                                  '${aplicantModels[index].email}',
                                  style: GoogleFonts.montserrat(
                                    textStyle: const TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 11),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.play_arrow,
                            size: 25,
                            color: Color(0xffBF9DF2),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          Container(
                            height: 26,
                            width: 83,
                            decoration: const BoxDecoration(
                              color: Color(0xff8545E5),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                            ),
                            child: Center(
                              child: InkWell(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) => ProfileDetail(
                                           applicantModel: aplicantModels[index],
                                          ));
                                },
                                child: Text('View Profile',
                                    style: GoogleFonts.montserrat(
                                      textStyle: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12),
                                    )),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Container(
                            height: 26,
                            width: 83,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border:
                                  Border.all(color: kprimarycolor, width: 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                            ),
                            child: Center(
                              child: Text('See Details',
                                  style: GoogleFonts.montserrat(
                                    textStyle: const TextStyle(
                                        color: Color(0xff8545E5),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12),
                                  )),
                            ),
                          ),
                        ],
                      ),
                    )
                  ]),
            );
          }),
    );
  }
}
