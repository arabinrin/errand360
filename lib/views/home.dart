import 'package:errand260/model/applicant.dart';
import 'package:errand260/model/jobs.dart';
import 'package:errand260/utils/constant.dart';
import 'package:errand260/widgets/profile_detail.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Welcome',
                        style: GoogleFonts.montserrat(
                          textStyle: const TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w700,
                              fontSize: 28),
                        )),
                    Text('Errand360!',
                        style: GoogleFonts.montserrat(
                          textStyle: const TextStyle(
                              color: Color(0xff787878),
                              fontWeight: FontWeight.w700,
                              fontSize: 28),
                        )),
                  ],
                ),
                Image.asset(
                  'assets/Vector.png',
                  height: 30,
                  width: 30,
                  // color: kGreen,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Active Jobs',
                    style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                          color: Color(0xff787878),
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                    )),
                Text('view All',
                    style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                          color: kprimarycolor,
                          fontWeight: FontWeight.w600,
                          fontSize: 12),
                    )),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 230,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: jobs.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (ctx, index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                  height: 195,
                  width: 328,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(30)),
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            'assets/logo.png',
                            height: 25,
                            width: 25,
                            // color: kGreen,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Column(
                            children: [
                              Text(jobs[index].title!,
                                  style: GoogleFonts.montserrat(
                                    textStyle: const TextStyle(
                                        color: Color(0xff787878),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16),
                                  )),
                              Text(
                                '${jobs[index].location} | ${jobs[index].type} ',
                                style: GoogleFonts.montserrat(
                                  textStyle: const TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 11),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            '- \$${jobs[index].price} /hr',
                            style: GoogleFonts.montserrat(
                              textStyle: const TextStyle(
                                  color: Color(0xff909090),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                      Text(jobs[index].descr!,
                          style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(
                                color: Color(0xff787878),
                                fontWeight: FontWeight.w500,
                                fontSize: 12),
                          )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Edit Job Details',
                              style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                    color: kprimarycolor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12),
                              )),
                          Text('Time created ',
                              style: GoogleFonts.montserrat(
                                textStyle: const TextStyle(
                                    color: Color(0xff909090),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 11),
                              )),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            height: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Color(0xfff2f2f2),
            ),
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Applicants',
                          style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(
                                color: Color(0xff787878),
                                fontWeight: FontWeight.w700,
                                fontSize: 16),
                          )),
                      Text('view All',
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                                color: kprimarycolor,
                                fontWeight: FontWeight.w600,
                                fontSize: 12),
                          )),
                    ],
                  ),
                ),
                Container(
                  height: 250,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: aplicantModels.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (ctx, index) {
                        return Container(
                          height: 120,
                          width: 240,
                          margin: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 2,
                                blurRadius: 2,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.all(5),
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: kprimarycolor, width: 1),
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    aplicantModels[index]
                                                        .avatar!)),
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
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
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 26,
                                        width: 83,
                                        decoration: const BoxDecoration(
                                          color: Color(0xff8545E5),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5)),
                                        ),
                                        child: InkWell(
                                          onTap: () {
                                            showDialog(
                                                context: context,
                                                builder: (context) =>
                                                    ProfileDetail(
                                                      applicantModel:
                                                          aplicantModels[index],
                                                    ));
                                          },
                                          child: Center(
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
                                          border: Border.all(
                                              color: kprimarycolor, width: 1),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5)),
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
                )
              ],
            ),
          ),
        ],
      )),
    );
  }
}
