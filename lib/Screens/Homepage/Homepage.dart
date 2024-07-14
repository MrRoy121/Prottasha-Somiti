import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Constants/Constants.dart';
import '../../ScreensMFS/Widget/Appbar.dart';
import '../../ScreensMFS/Widget/Appbool.dart';
import '../../ScreensMFS/Widget/Notice_widget.dart';
import '../../helpers/auth_service.dart';
import '../../route.dart';

class DesktopHomePage extends StatefulWidget {
  Appbool navbool;
  DesktopHomePage({
    required this.navbool,
  });

  @override
  State<DesktopHomePage> createState() => _DesktopHomePageState();
}

class _DesktopHomePageState extends State<DesktopHomePage> {
  bool click = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetch();
  }

  Future<void> fetch() async {
    DateTime selectedDate = DateTime.now();
    String formattedDate = DateFormat.yMMMd().format(selectedDate).toString();
    var collectionReference = FirebaseFirestore.instance.collection('DayOpenClose');
    var documentReference = collectionReference.doc('5200');
    var snapshot = await documentReference.get();
    if (snapshot.exists && snapshot.data()?['OpenClose'] == true && snapshot.data()?['Date'] == formattedDate) {
      click = true;
    }
    if (AuthService.to.user!.type == "Super Admin") {
      click = true;
    } else if (AuthService.to.user!.type == "Branch Manager") {
      click = true;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var ScreenWidth = MediaQuery.of(context).size.width;

    double ResponsiveWidth = MediaQuery.of(context as BuildContext).size.width;
    double ResponsiveHeight = MediaQuery.of(context as BuildContext).size.height;

    bool desktop = false;
    bool tablet = false;
    bool mobile = false;

    if (ResponsiveWidth > 1100) {
      desktop = true;
      tablet = false;
      mobile = false;
    } else if (ResponsiveWidth > 500) {
      tablet = true;
      desktop = false;
      mobile = false;
    } else {
      mobile = true;
      desktop = false;
      tablet = false;
    }

    return Scaffold(
      appBar: Appbar(
        navbool: widget.navbool,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height - 60,
          color: AppBGColor,
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Navbar(
                //   navbool: widget.navbool,
                // ),
                desktop
                    ? Row(
                        // For Desktop
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: ScreenWidth / 19.2, top: ScreenWidth / 30.72),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            height: 550,
                            width: 550,
                            // color: Colors.white,

                            child: Padding(
                              padding: EdgeInsets.all(ScreenWidth / 51.2),
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        const Text(
                                          "Notice Board",
                                          style: TextStyle(
                                            color: AppColor,
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Spacer(),
                                        Container(
                                          padding: EdgeInsets.only(left: ScreenWidth / 85.33),
                                          decoration: BoxDecoration(
                                            color: AppColor,
                                            borderRadius: BorderRadius.circular(5),
                                          ),
                                          height: 40,
                                          width: 130,
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.calendar_today_rounded,
                                                color: Colors.white,
                                                size: 16,
                                              ),
                                              SizedBox(width: ScreenWidth / 153.6),
                                              Text(
                                                "All Notice",
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    NoticeWidget(
                                      noticeTitle: 'Notice Tile',
                                      description:
                                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Turpis vitae ultrices in sed. Feugiat metus amet, id sed volutpat enim sed. Cras vel vitae, lectus id. Egestas quam auctor commodo porttitor netus risus enim.',
                                      data: '01-Oct-2023',
                                      time: '10:30PM',
                                    ),
                                    NoticeWidget(
                                      noticeTitle: 'Notice Tile',
                                      description:
                                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Turpis vitae ultrices in sed.',
                                      data: '01-Oct-2023',
                                      time: '10:30PM',
                                    ),
                                    NoticeWidget(
                                      noticeTitle: 'Notice Tile',
                                      description:
                                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Turpis vitae ultrices in sed. Feugiat metus amet, id sed volutpat enim sed. Cras vel vitae, lectus id. Egestas quam auctor commodo porttitor netus risus enim.',
                                      data: '01-Oct-2023',
                                      time: '10:30PM',
                                    ),
                                    NoticeWidget(
                                      noticeTitle: 'Notice Tile',
                                      description:
                                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Turpis vitae ultrices in sed. Feugiat metus amet, id sed volutpat enim sed. Cras vel vitae, lectus id. Egestas quam auctor commodo porttitor netus risus enim.',
                                      data: '01-Oct-2023',
                                      time: '10:30PM',
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: ScreenWidth / 10,
                          ),
                          SingleChildScrollView(
                            child: Column(
                              children: [
                                InkWell(
                                  onTap: () async {
                                    await fetch();
                                    if (click) {
                                      Get.toNamed(
                                        dashboardPageRoute,
                                        arguments: {'CBS': true},
                                      );
                                      SharedPreferences prefs = await SharedPreferences.getInstance();
                                      prefs.setBool('CBS', true);
                                    } else {
                                      Get.snackbar("Day Is not Opened Yet.", "Redirecting to Home Page.",
                                          snackPosition: SnackPosition.BOTTOM,
                                          colorText: Colors.white,
                                          backgroundColor: Colors.red,
                                          margin: EdgeInsets.zero,
                                          duration: const Duration(milliseconds: 2000),
                                          boxShadows: [
                                            const BoxShadow(
                                                color: Colors.grey, offset: Offset(-100, 0), blurRadius: 20),
                                          ],
                                          borderRadius: 0);
                                    }
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(90.0),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.1),
                                          spreadRadius: 2,
                                          blurRadius: 5,
                                          offset: Offset(0, 2),
                                        ),
                                      ],
                                    ),
                                    margin: EdgeInsets.only(top: ScreenWidth / 17.66, left: ScreenWidth / 76.8),
                                    height: ScreenWidth / 12.8,
                                    width: ScreenWidth / 3.072,
                                    // color: Colors.white,
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: ScreenWidth / 25.6,
                                        ),
                                        Image.asset('assets/money.png',
                                            width: ScreenWidth / 19.2, height: ScreenWidth / 19.2),
                                        SizedBox(
                                          width: ScreenWidth / 25.6,
                                        ),
                                        Text(
                                          "Core Banking System",
                                          style: TextStyle(
                                              fontSize: ScreenWidth / 96,
                                              fontWeight: FontWeight.bold,
                                              color: AppColor_greyText),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () async {
                                    await fetch();
                                    if (click) {
                                      Get.toNamed(
                                        dashboardPageRoute,
                                        arguments: {'CBS': false},
                                      );
                                      SharedPreferences prefs = await SharedPreferences.getInstance();
                                      prefs.setBool('CBS', false);
                                    } else {
                                      Get.snackbar("Day Is not Opened Yet.", "Redirecting to Home Page.",
                                          snackPosition: SnackPosition.BOTTOM,
                                          colorText: Colors.white,
                                          backgroundColor: Colors.red,
                                          margin: EdgeInsets.zero,
                                          duration: const Duration(milliseconds: 2000),
                                          boxShadows: [
                                            const BoxShadow(
                                                color: Colors.grey, offset: Offset(-100, 0), blurRadius: 20),
                                          ],
                                          borderRadius: 0);
                                    }
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(90.0),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.1),
                                          spreadRadius: 2,
                                          blurRadius: 5,
                                          offset: Offset(0, 2),
                                        ),
                                      ],
                                    ),
                                    margin: EdgeInsets.only(top: ScreenWidth / 51.2, left: ScreenWidth / 76.8),
                                    height: ScreenWidth / 12.8,
                                    width: ScreenWidth / 3.072,
                                    // color: Colors.white,
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: ScreenWidth / 25.6,
                                        ),
                                        Image.asset('assets/management.png',
                                            width: ScreenWidth / 19.2, height: ScreenWidth / 19.2),
                                        SizedBox(
                                          width: ScreenWidth / 25.6,
                                        ),
                                        Text(
                                          "Microfinance Management",
                                          style: TextStyle(
                                              fontSize: ScreenWidth / 96,
                                              fontWeight: FontWeight.bold,
                                              color: AppColor_greyText),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Get.toNamed(
                                      shareHolderPageRoute,
                                    );
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(90.0),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.1),
                                          spreadRadius: 2,
                                          blurRadius: 5,
                                          offset: Offset(0, 2),
                                        ),
                                      ],
                                    ),
                                    margin: EdgeInsets.only(top: ScreenWidth / 51.2, left: ScreenWidth / 76.8),
                                    height: ScreenWidth / 12.8,
                                    width: ScreenWidth / 3.072,
                                    // color: Colors.white,
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: ScreenWidth / 25.6,
                                        ),
                                        Image.asset('assets/ShareManagement.png',
                                            width: ScreenWidth / 19.2, height: ScreenWidth / 19.2),
                                        SizedBox(
                                          width: ScreenWidth / 25.6,
                                        ),
                                        Text(
                                          "Share Management System",
                                          style: TextStyle(
                                              fontSize: ScreenWidth / 96,
                                              fontWeight: FontWeight.bold,
                                              color: AppColor_greyText),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      )
                    : tablet
                        ? Column(
                            // For Tablet
                            children: [
                              SingleChildScrollView(
                                child: Container(
                                  margin: EdgeInsets.only(left: ScreenWidth / 19.2, top: ScreenWidth / 30.72),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  height: 550,
                                  width: 600,
                                  // color: Colors.white,

                                  child: Padding(
                                    padding: EdgeInsets.all(30),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                "Notice Board",
                                                style: TextStyle(
                                                  color: AppColor,
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Spacer(),
                                              Container(
                                                padding: EdgeInsets.only(left: 18),
                                                decoration: BoxDecoration(
                                                  color: AppColor,
                                                  borderRadius: BorderRadius.circular(5),
                                                ),
                                                height: 40,
                                                width: 130,
                                                child: Row(
                                                  children: [
                                                    Icon(
                                                      Icons.calendar_today_rounded,
                                                      color: Colors.white,
                                                      size: 16,
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text(
                                                      "All Notice",
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                          NoticeWidget(
                                            noticeTitle: 'Notice Tile',
                                            description:
                                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Turpis vitae ultrices in sed. Feugiat metus amet, id sed volutpat enim sed. Cras vel vitae, lectus id. Egestas quam auctor commodo porttitor netus risus enim.',
                                            data: '01-Oct-2023',
                                            time: '10:30PM',
                                          ),
                                          NoticeWidget(
                                            noticeTitle: 'Notice Tile',
                                            description:
                                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Turpis vitae ultrices in sed.',
                                            data: '01-Oct-2023',
                                            time: '10:30PM',
                                          ),
                                          NoticeWidget(
                                            noticeTitle: 'Notice Tile',
                                            description:
                                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Turpis vitae ultrices in sed. Feugiat metus amet, id sed volutpat enim sed. Cras vel vitae, lectus id. Egestas quam auctor commodo porttitor netus risus enim.',
                                            data: '01-Oct-2023',
                                            time: '10:30PM',
                                          ),
                                          NoticeWidget(
                                            noticeTitle: 'Notice Tile',
                                            description:
                                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Turpis vitae ultrices in sed. Feugiat metus amet, id sed volutpat enim sed. Cras vel vitae, lectus id. Egestas quam auctor commodo porttitor netus risus enim.',
                                            data: '01-Oct-2023',
                                            time: '10:30PM',
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 120,
                              ),
                              SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(90.0),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.1),
                                            spreadRadius: 2,
                                            blurRadius: 5,
                                            offset: Offset(0, 2),
                                          ),
                                        ],
                                      ),
                                      margin: EdgeInsets.only(top: 86.92, left: 20),
                                      height: 120,
                                      width: 500,
                                      // color: Colors.white,
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 60,
                                          ),
                                          Image.asset('assets/money.png', width: 80, height: 80),
                                          SizedBox(
                                            width: 60,
                                          ),
                                          Text(
                                            "Core Banking System",
                                            style: TextStyle(
                                                fontSize: 16, fontWeight: FontWeight.bold, color: AppColor_greyText),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(90.0),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.1),
                                            spreadRadius: 2,
                                            blurRadius: 5,
                                            offset: Offset(0, 2),
                                          ),
                                        ],
                                      ),
                                      margin: EdgeInsets.only(top: 30, left: 20),
                                      height: 120,
                                      width: 500,
                                      // color: Colors.white,
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 60,
                                          ),
                                          Image.asset('assets/management.png', width: 80, height: 80),
                                          SizedBox(
                                            width: 60,
                                          ),
                                          Text(
                                            "Microfinance Management",
                                            style: TextStyle(
                                                fontSize: 16, fontWeight: FontWeight.bold, color: AppColor_greyText),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(90.0),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.1),
                                            spreadRadius: 2,
                                            blurRadius: 5,
                                            offset: Offset(0, 2),
                                          ),
                                        ],
                                      ),
                                      margin: EdgeInsets.only(top: 30, left: 20),
                                      height: 120,
                                      width: 500,
                                      // color: Colors.white,
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 60,
                                          ),
                                          Image.asset('assets/ShareManagement.png', width: 80, height: 80),
                                          SizedBox(
                                            width: 60,
                                          ),
                                          Text(
                                            "Share Management System",
                                            style: TextStyle(
                                                fontSize: 16, fontWeight: FontWeight.bold, color: AppColor_greyText),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 25,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          )
                        : Column(
                            // For Tablet
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 15, top: 40),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                height: 500,
                                width: 300,
                                // color: Colors.white,

                                child: Padding(
                                  padding: EdgeInsets.all(30),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              "Notice Board",
                                              style: TextStyle(
                                                color: AppColor,
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Spacer(),
                                            Container(
                                              padding: EdgeInsets.only(left: 8),
                                              decoration: BoxDecoration(
                                                color: AppColor,
                                                borderRadius: BorderRadius.circular(5),
                                              ),
                                              height: 20,
                                              width: 70,
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.calendar_today_rounded,
                                                    color: Colors.white,
                                                    size: 10,
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    "All Notice",
                                                    style: TextStyle(
                                                      fontSize: 8,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                        NoticeWidget(
                                          noticeTitle: 'Notice Tile',
                                          description:
                                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Turpis vitae ultrices in sed. Feugiat metus amet, id sed volutpat enim sed. Cras vel vitae, lectus id. Egestas quam auctor commodo porttitor netus risus enim.',
                                          data: '01-Oct-2023',
                                          time: '10:30PM',
                                        ),
                                        NoticeWidget(
                                          noticeTitle: 'Notice Tile',
                                          description:
                                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Turpis vitae ultrices in sed.',
                                          data: '01-Oct-2023',
                                          time: '10:30PM',
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 120,
                              ),
                              SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(90.0),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.1),
                                            spreadRadius: 2,
                                            blurRadius: 5,
                                            offset: Offset(0, 2),
                                          ),
                                        ],
                                      ),
                                      margin: EdgeInsets.only(top: 86.92, left: 20),
                                      height: 120,
                                      width: 500,
                                      // color: Colors.white,
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: ScreenWidth / 15.6,
                                          ),
                                          Image.asset('assets/money.png', width: 50, height: 50),
                                          SizedBox(
                                            width: ScreenWidth / 15.6,
                                          ),
                                          Text(
                                            "Core Banking System",
                                            style: TextStyle(
                                                fontSize: 12, fontWeight: FontWeight.bold, color: AppColor_greyText),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(90.0),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.1),
                                            spreadRadius: 2,
                                            blurRadius: 5,
                                            offset: Offset(0, 2),
                                          ),
                                        ],
                                      ),
                                      margin: EdgeInsets.only(top: 30, left: 20),
                                      height: 120,
                                      width: 500,
                                      // color: Colors.white,
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: ScreenWidth / 15.6,
                                          ),
                                          Image.asset('assets/management.png', width: 50, height: 50),
                                          SizedBox(
                                            width: ScreenWidth / 15.6,
                                          ),
                                          Text(
                                            "Microfinance Management",
                                            style: TextStyle(
                                                fontSize: 12, fontWeight: FontWeight.bold, color: AppColor_greyText),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(90.0),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.1),
                                            spreadRadius: 2,
                                            blurRadius: 5,
                                            offset: Offset(0, 2),
                                          ),
                                        ],
                                      ),
                                      margin: EdgeInsets.only(top: 30, left: 20),
                                      height: 120,
                                      width: 500,
                                      // color: Colors.white,
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: ScreenWidth / 15.6,
                                          ),
                                          Image.asset('assets/ShareManagement.png', width: 50, height: 50),
                                          SizedBox(
                                            width: ScreenWidth / 15.6,
                                          ),
                                          const Text(
                                            "Share Management System",
                                            style: TextStyle(
                                                fontSize: 12, fontWeight: FontWeight.bold, color: AppColor_greyText),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 25,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
