import 'package:flutter/material.dart';
import 'package:prottashasomit/Widget/Notice_widget.dart';

import '../../../Constants/Constants.dart';

class DesktopHomePage extends StatefulWidget {
  const DesktopHomePage({Key? key}) : super(key: key);

  @override
  State<DesktopHomePage> createState() => _DesktopHomePageState();
}

class _DesktopHomePageState extends State<DesktopHomePage> {


  @override
  Widget build(BuildContext context) {

    var ScreenWidth =MediaQuery.of(context).size.width;

    // print(ScreenWidth);
    return Scaffold(
      backgroundColor: AppBGColor,

      body: Row(
        children: [
          Container(
            margin: EdgeInsets.only(left: ScreenWidth/19.2, top: ScreenWidth/30.72),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),

            ),
            height: ScreenWidth/2.79,
            width: ScreenWidth/2.56,
            // color: Colors.white,

            child: Padding(
              padding: EdgeInsets.all(ScreenWidth/51.2),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Notice Board",
                          style: TextStyle(
                            color: AppColor,
                            fontSize: ScreenWidth/64,
                            fontWeight: FontWeight.bold,

                          ),
                        ),
                        Spacer(),

                        Container(
                          padding: EdgeInsets.only(left: ScreenWidth/85.33),
                          decoration: BoxDecoration(
                            color: AppColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          height: ScreenWidth/38.4,
                          width: ScreenWidth/11.82,
                          child: Row(
                            children: [
                              Icon(Icons.calendar_today_rounded, color: Colors.white, size: ScreenWidth/96,),
                              SizedBox(width: ScreenWidth/153.6,),
                              Text(
                                  "All Notice",
                                style: TextStyle(
                                  fontSize: ScreenWidth/109.72,
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
                      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Turpis vitae ultrices in sed. Feugiat metus amet, id sed volutpat enim sed. Cras vel vitae, lectus id. Egestas quam auctor commodo porttitor netus risus enim.',
                      data: '01-Oct-2023',
                      time: '10:30PM',

                    ),

                    NoticeWidget(
                      noticeTitle: 'Notice Tile',
                      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Turpis vitae ultrices in sed.',
                      data: '01-Oct-2023',
                      time: '10:30PM',

                    ),

                  ],
                ),
              ),
            ),
          ),

          SizedBox(width: ScreenWidth/12.8,),
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
                  margin: EdgeInsets.only(top: ScreenWidth/17.67, left: ScreenWidth/76.8),
                  height: ScreenWidth/12.8,
                  width: ScreenWidth/3.072,
                  // color: Colors.white,
                  child: Row(
                    children: [
                      SizedBox(width: ScreenWidth/25.6,),
                      Image.asset('assets/money.png', width: ScreenWidth/19.2, height: ScreenWidth/19.2),
                      SizedBox(width: ScreenWidth/25.6,),
                      Text(
                        "Core Banking System",
                        style: TextStyle(
                          fontSize: ScreenWidth/96,
                          fontWeight: FontWeight.bold,
                          color: AppColor_grey
                        ),
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
                  margin: EdgeInsets.only(top: ScreenWidth/51.2, left: ScreenWidth/76.8),
                  height: ScreenWidth/12.8,
                  width: ScreenWidth/3.072,
                  // color: Colors.white,
                  child: Row(
                    children: [
                      SizedBox(width: ScreenWidth/25.6,),
                      Image.asset('assets/management.png', width: ScreenWidth/19.2, height: ScreenWidth/19.2),
                      SizedBox(width: ScreenWidth/25.6,),
                      Text(
                        "Microfinance Management",
                        style: TextStyle(
                            fontSize: ScreenWidth/96,
                            fontWeight: FontWeight.bold,
                            color: AppColor_grey
                        ),
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
                  margin: EdgeInsets.only(top: ScreenWidth/51.2, left: ScreenWidth/76.8),
                  height: ScreenWidth/12.8,
                  width: ScreenWidth/3.072,
                  // color: Colors.white,
                  child: Row(
                    children: [
                      SizedBox(width: ScreenWidth/25.6,),
                      Image.asset('assets/ShareManagement.png', width: ScreenWidth/19.2, height: ScreenWidth/19.2),
                      SizedBox(width: ScreenWidth/25.6,),
                      Text(
                        "Share Management System",
                        style: TextStyle(
                            fontSize: ScreenWidth/96,
                            fontWeight: FontWeight.bold,
                            color: AppColor_grey
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
