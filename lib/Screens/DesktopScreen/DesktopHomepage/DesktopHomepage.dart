import 'package:flutter/material.dart';

import '../../../Constants/Constants.dart';

class DesktopHomePage extends StatefulWidget {
  const DesktopHomePage({Key? key}) : super(key: key);

  @override
  State<DesktopHomePage> createState() => _DesktopHomePageState();
}

class _DesktopHomePageState extends State<DesktopHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppBGColor,

      body: Row(
        children: [
          Container(
            margin: EdgeInsets.only(left: 80, top: 50),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),

            ),
            height: 550,
            width: 600,
            // color: Colors.white,

            child: Padding(
              padding: const EdgeInsets.all(30),
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
                            Icon(Icons.calendar_today_rounded, color: Colors.white,),
                            SizedBox(width: 10,),
                            Text(
                                "All Notice",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),

                  Container(
                    decoration: BoxDecoration(
                      color: AppColor_second,
                      borderRadius: BorderRadius.circular(10.0),

                    ),
                    padding: EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 30),
                    margin: EdgeInsets.only(top: 30),
                    // color: Colors.grey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            'Notice Title',
                          style: TextStyle(
                            color: AppColor_green,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10,),
                        Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Turpis vitae ultrices in sed. Feugiat metus amet, id sed volutpat enim sed. Cras vel vitae, lectus id. Egestas quam auctor commodo porttitor netus risus enim.",
                        style: TextStyle(
                          color: AppColor,

                        ),
                        ),
                        SizedBox(
                          height: 20,
                        ),

                        Row(
                          children: [
                            Icon(Icons.calendar_month_sharp, color: AppColor_green,size: 16,),
                            SizedBox(width: 5,),
                            Text(
                                "Published Date: ",
                              style: TextStyle(
                                fontSize: 12,
                                color: AppColor_red,
                                  fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 5,),
                            Text(
                                "01-Oct-2023",
                              style: TextStyle(
                                fontSize: 12,
                                color: AppColor_green,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Spacer(),

                            Text(
                                "Published Time: ",
                              style: TextStyle(
                                fontSize: 12,
                                color: AppColor_red,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 5,),
                            Text(
                                "10:30PM",
                              style: TextStyle(
                                fontSize: 12,
                                color: AppColor_green,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        )

                      ],
                    ),

                  ),

                  Container(
                    decoration: BoxDecoration(
                      color: AppColor_second,
                      borderRadius: BorderRadius.circular(10.0),

                    ),
                    padding: EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 30),
                    margin: EdgeInsets.only(top: 30),
                    // color: Colors.grey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Notice Title',
                          style: TextStyle(
                            color: AppColor_green,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10,),
                        Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Turpis vitae ultrices in sed.",
                          style: TextStyle(
                            color: AppColor,

                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),

                        Row(
                          children: [
                            Icon(Icons.calendar_month_sharp, color: AppColor_green,size: 16,),
                            SizedBox(width: 5,),
                            Text(
                              "Published Date: ",
                              style: TextStyle(
                                fontSize: 12,
                                color: AppColor_red,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 5,),
                            Text(
                              "01-Oct-2023",
                              style: TextStyle(
                                fontSize: 12,
                                color: AppColor_green,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Spacer(),

                            Text(
                              "Published Time: ",
                              style: TextStyle(
                                fontSize: 12,
                                color: AppColor_red,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 5,),
                            Text(
                              "10:30PM",
                              style: TextStyle(
                                fontSize: 12,
                                color: AppColor_green,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        )

                      ],
                    ),

                  ),

                ],
              ),
            ),
          ),

          SizedBox(width: 120,),
          Column(
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
                margin: EdgeInsets.only(top: 90, left: 20),
                height: 120,
                width: 500,
                // color: Colors.white,
                child: Row(
                  children: [
                    SizedBox(width: 60,),
                    Image.asset('assets/money.png', width: 80, height: 80),
                    SizedBox(width: 60,),
                    Text(
                      "Core Banking System",
                      style: TextStyle(
                        fontSize: 16,
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
                margin: EdgeInsets.only(top: 30, left: 20),
                height: 120,
                width: 500,
                // color: Colors.white,
                child: Row(
                  children: [
                    SizedBox(width: 60,),
                    Image.asset('assets/management.png', width: 80, height: 80),
                    SizedBox(width: 60,),
                    Text(
                      "Microfinance Management",
                      style: TextStyle(
                          fontSize: 16,
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
                margin: EdgeInsets.only(top: 30, left: 20),
                height: 120,
                width: 500,
                // color: Colors.white,
                child: Row(
                  children: [
                    SizedBox(width: 60,),
                    Image.asset('assets/ShareManagement.png', width: 80, height: 80),
                    SizedBox(width: 60,),
                    Text(
                      "Share Management System",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColor_grey
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
