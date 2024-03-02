import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../Constants/Constants.dart';
import '../../ScreensMFS/Widget/Appbar.dart';
import '../../ScreensMFS/Widget/Appbool.dart';
import '../Widgets/NavBoolCBS.dart';
import '../Widgets/NavbarScreenCBS.dart';

class DayOpenClose extends StatefulWidget {
  NavboolCBS navbool;
  Appbool appbool;

  DayOpenClose({required this.appbool, required this.navbool});

  @override
  State<DayOpenClose> createState() => _DayOpenCloseState();
}

class _DayOpenCloseState extends State<DayOpenClose> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(
        navbool: widget.appbool,
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: 100, right: 20, left: 20),
              child: Row(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(flex:10,
                    child: Container(
                      height: 400,
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
                            height: 40,
                            color: navbarColor,
                            child: const Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 40.0),
                                  child: Text(
                                    "Day Open Close",
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
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Center(
                              child: Text("No Somitee Is Selected.."),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 25,),
                  Expanded(flex:8,
                    child: Container(
                      height: 250,
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
                            height: 40,
                            color: navbarColor,
                            child: const Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 40.0),
                                  child: Text(
                                    "Branch Wise Day Open Close",
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
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Center(
                              child: Text("No Somitee Is Selected.."),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            NavbarScreenCBS(
              appbool: widget.appbool,
              navbool: widget.navbool,
            ),
          ],
        ),
      ),
    );
  }
}
