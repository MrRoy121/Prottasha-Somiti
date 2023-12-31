import 'package:flutter/material.dart';

import '../Constants/Constants.dart';

class MemberImage extends StatefulWidget {



  @override
  State<MemberImage> createState() => _MemberImageState();
}

class _MemberImageState extends State<MemberImage> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 1400,
      height: 350,
      // color: Colors.white,

      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),

      child: Column(
        children: [
          Container(
            width: 1400,
            height: 40,
            color: navbarColor,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 40.0),
                  child: Text(
                    "Member’s Image",
                    style: TextStyle(
                      color: AppColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),


              ],
            ),
          ),

          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50, left: 250),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [

                      Container(

                        width: 295,
                        height: 30,
                        color: navbarColor,

                        child: Center(
                          child: Text(
                            "Chose Image",
                            style: TextStyle(
                              color: AppColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),

                      Container(
                        padding: EdgeInsets.only(left: 15),
                        height: 120,
                        width: 295,

                        child: Row(
                          children: [
                            Container(

                              height: 80,
                              width: 265,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: 20,
                                        left: 10,
                                        right: 10),
                                    child: Row(
                                      children: [

                                        Text(
                                          "Select an Image File",
                                          style: TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        SizedBox(
                                          height: 30,
                                          width: 96,
                                          child: ElevatedButton(
                                            style: ElevatedButton
                                                .styleFrom(
                                              primary:
                                              Colors.white,
                                              shape:
                                              RoundedRectangleBorder(
                                                side: BorderSide(
                                                    color: Colors
                                                        .blue),
                                                borderRadius:
                                                BorderRadius
                                                    .circular(
                                                    5.0),
                                              ),
                                            ),
                                            onPressed: () {

                                            },
                                            child: Text(
                                              "Select",
                                              style: TextStyle(
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(
                        width: 250,
                      ),


                    ],
                  ),
                ),
              ),

              Spacer(),

              Container(
                margin: EdgeInsets.only(top: 50, right: 250),
                height: 200,
                width: 200,

                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),

                child: Column(
                  children: [
                    Container(
                      width: 200,
                      height: 30,
                      color: navbarColor,
                      child: Center(
                        child: Text(
                            "Preview Image",
                          style: TextStyle(
                            color: AppColor,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(top: 25),
                      padding: EdgeInsets.only(top: 25),
                      height: 120,
                      width: 120,
                      // color: Colors.red,

                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 0.5,
                        ),
                        borderRadius: BorderRadius.circular(5.0),
                      ),

                      child: Column(
                        children: [
                          Center(child: Icon(Icons.person_2_outlined, size: 58,)),
                        ],
                      ),

                    )
                  ],
                ),
              )
            ],
          )

        ],
      ),
    );
  }
}
