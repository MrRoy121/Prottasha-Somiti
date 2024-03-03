import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../../Constants/Constants.dart';
import '../../../../route.dart';
import '../../Model/member.dart';
import '../../ScreensMFS/Widget/Appbar.dart';
import '../../ScreensMFS/Widget/Appbool.dart';
import '../Widgets/CustomProgressBar.dart';
import '../Widgets/NavBoolCBS.dart';
import '../Widgets/NavbarScreenCBS.dart';
import 'RegularDepositAccount.dart';

class RegularACOpen extends StatefulWidget {
  NavboolCBS navbool;
  Appbool appbool;

  RegularACOpen({required this.appbool, required this.navbool});

  @override
  State<RegularACOpen> createState() => _RegularACOpenState();
}

class _RegularACOpenState extends State<RegularACOpen> {
  int index = 0;
  int _selectedValue = 1;
  bool img = false;
  List<Memberss> memberss = [];
  bool mmems = false;
  var selectedmemberss;
  var sselectedmemberss;
  var selectedsamitee;
  var selectedsector;
  late Uint8List pickedImage;

  void _save(int index) {
    index = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var ScreenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: Appbar(
        navbool: widget.appbool,
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: 125),
              child: CustomProgressBar(
                totalCheckpoints: 8,
                currentCheckpoint: index,
                customeregi: false,
              ),
            ),
            index == 0
                ? Container(
                    margin: EdgeInsets.only(top: 250, left: 50),
                    // margin: EdgeInsets.only(top: 100, left: 50),
                    width: ScreenWidth / 1.097,
                    height: 200,
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
                      // mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: ScreenWidth / 1.097,
                          height: ScreenWidth / 38.4,
                          color: navbarColor,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsets.only(left: ScreenWidth / 38.4),
                                child: Text(
                                  "Regular A/c Opening (Choose A/c Type)",
                                  style: TextStyle(
                                    color: AppColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: ScreenWidth / 96,
                                  ),
                                ),
                              ),
                              Spacer(),
                              InkWell(
                                onTap: () {
                                  _save(1);
                                },
                                child: Container(
                                  height: ScreenWidth / 38.4,
                                  width: ScreenWidth / 19.2,
                                  color: Colors.green,
                                  alignment: Alignment.center,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.fast_forward,
                                        color: Colors.white,
                                        size: ScreenWidth / 109.71,
                                      ),
                                      SizedBox(
                                        width: ScreenWidth / 212,
                                      ),
                                      Text(
                                        "Next",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: ScreenWidth / 109.71),
                                      ),
                                      SizedBox(
                                        width: ScreenWidth / 768,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: ScreenWidth / 153.6,
                              ),
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  height: ScreenWidth / 38.4,
                                  width: ScreenWidth / 19.2,
                                  color: AppColor_yellow,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        top: ScreenWidth / 512,
                                        left: ScreenWidth / 102.4),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.clear_all,
                                          color: Colors.white,
                                          size: ScreenWidth / 85.33,
                                        ),
                                        Text(
                                          "Clear",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: ScreenWidth / 109.71),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: ScreenWidth / 153.6,
                              ),
                              InkWell(
                                onTap: () {
                                  Get.back();
                                },
                                child: Container(
                                  height: ScreenWidth / 38.4,
                                  width: ScreenWidth / 30.72,
                                  color: Colors.red,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        top: ScreenWidth / 153.6,
                                        left: ScreenWidth / 76.8),
                                    child: Text(
                                      "X",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: ScreenWidth / 109.71),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: ScreenWidth / 153.6,
                              ),
                            ],
                          ),
                        ),
                        Expanded(child: SizedBox()),
                        Container(
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Transform.scale(
                                    scale: 1.5,
                                    child: Radio(
                                      value: 1,
                                      groupValue: _selectedValue,
                                      onChanged: (newValue) {
                                        setState(() {
                                          _selectedValue = newValue as int;
                                        });
                                      },
                                      activeColor: AppColor_greyText,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  const Text(
                                    'Savings Account',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Transform.scale(
                                    scale: 1.5,
                                    child: Radio(
                                      value: 2,
                                      groupValue: _selectedValue,
                                      onChanged: (newValue) {
                                        setState(() {
                                          _selectedValue = newValue as int;
                                        });
                                      },
                                      activeColor: AppColor_greyText,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Short Notice Deposits (CBS) (SND (CBS))',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Expanded(child: SizedBox()),
                      ],
                    ),
                  )
                : SizedBox(),
            index == 1
                ? RegularDepositAccount(
                    memberss: memberss,
                    mmems: mmems,save: _save,
                    selectedmemberss: selectedmemberss,
                    selectedsamitee: selectedsamitee,
                    selectedsector: selectedsector,
                  )
                : SizedBox(),

            index == 3
                ? RegularDepositAccount(
              memberss: memberss,
              mmems: mmems,save: _save,
              selectedmemberss: selectedmemberss,
              selectedsamitee: selectedsamitee,
              selectedsector: selectedsector,
            )
                : SizedBox(),
            NavbarScreenCBS(
              appbool: widget.appbool,
              navbool: widget.navbool,
            ),
          ],
        ),
      ),
      // body: Column(
      //   children: [
      //     Navbar(
      //       navbool: widget.navbool,
      //       toglechnage: _toglechnage,
      //     ),
      //     SizedBox(width: double.infinity,
      //       child: Row(
      //         children: [
      //           arr[0]
      //               ? Container(
      //                   color: Colors.blue,
      //                   // height: 800,
      //                   width: 200,
      //                   child: Column(
      //                     children: [
      //                       GestureDetector(
      //                         onTap: (){
      //                           Get.to(SamiteeRegistration());
      //                         },
      //                         child: Container(
      //                           padding: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
      //                           height: 40,
      //                             width: 200,
      //                             // color: Colors.grey,
      //                             child: Text(
      //                                 "Samitee Registration",
      //                               style: TextStyle(
      //                                 fontSize: 12,
      //                               ),
      //                             ),
      //                         ),
      //                       ),
      //                       Container(
      //                           padding: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
      //                           height: 40,
      //                           width: 200,
      //                           child: Text(
      //                               "Member Registration",
      //                             style: TextStyle(
      //                               fontSize: 12,
      //                             ),
      //                           )
      //                       ),
      //                       Container(
      //                           padding: EdgeInsets.only(top: 10, left: 20, bottom: 10),
      //                           height: 40,
      //                           width: 200,
      //                           child: Text(
      //                               "Edit Member",
      //                             style: TextStyle(
      //                               fontSize: 12,
      //                             ),
      //                           )
      //                       ),
      //                       Container(
      //                         padding: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
      //                         height: 40,
      //                         width: 200,
      //                           child: Row(
      //                             children: [
      //                               Text(
      //                                   "Member Closing",
      //                                 style: TextStyle(
      //                                   fontSize: 12,
      //                                 ),
      //                               ),
      //                               SizedBox(width: 55,),
      //                               Icon(Icons.arrow_forward_ios, size: 12,)
      //                             ],
      //                           ),
      //                       ),
      //                       Container(
      //                           padding: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
      //                           height: 40,
      //                           width: 200,
      //                           child: Row(
      //                             children: [
      //                               Text(
      //                                   "Dead Member Information",
      //                                 style: TextStyle(
      //                                   fontSize: 12,
      //                                 ),
      //                               ),
      //                               SizedBox(width: 0,),
      //                               Icon(Icons.arrow_forward_ios, size: 12,)
      //                             ],
      //                           )
      //                       ),
      //                     ],
      //                   ),
      //                 )
      //               : SizedBox(),
      //
      //           arr[1]
      //               ? Container(
      //             margin: EdgeInsets.only(left: 180),
      //             color: Colors.blue,
      //             // height: 800,
      //             width: 180,
      //             child: Column(
      //               children: [
      //                 Container(
      //                     padding: EdgeInsets.only(top: 10, left: 20, bottom: 10),
      //                     height: 40,
      //                     width: 180,
      //                     child: Text(
      //                       "Deposit",
      //                       style: TextStyle(
      //                         fontSize: 12,
      //                       ),
      //                     )
      //                 ),
      //                 Container(
      //                   padding: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
      //                   height: 40,
      //                   width: 200,
      //                   child: Row(
      //                     children: [
      //                       Text(
      //                         "Withdraw",
      //                         style: TextStyle(
      //                           fontSize: 12,
      //                         ),
      //                       ),
      //                       SizedBox(width: 73,),
      //                       Icon(Icons.arrow_forward_ios, size: 12,)
      //                     ],
      //                   ),
      //                 ),
      //                 Container(
      //                     padding: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
      //                     height: 40,
      //                     width: 200,
      //                     child: Row(
      //                       children: [
      //                         Text(
      //                           "Samitee Transaction",
      //                           style: TextStyle(
      //                             fontSize: 12,
      //                           ),
      //                         ),
      //                         SizedBox(width: 10,),
      //                         Icon(Icons.arrow_forward_ios, size: 12,)
      //                       ],
      //                     )
      //                 ),
      //               ],
      //             ),
      //           )
      //               : SizedBox(),
      //
      //           arr[2]
      //               ? Container(
      //             margin: EdgeInsets.only(left: 340),
      //             color: Colors.blue,
      //             // height: 800,
      //             width: 200,
      //             child: Column(
      //               children: [
      //                 Container(
      //                   padding: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
      //                   height: 40,
      //                   width: 200,
      //                   // color: Colors.grey,
      //                   child: Row(
      //                     children: [
      //                       Text(
      //                         "Loan Saction",
      //                         style: TextStyle(
      //                           fontSize: 12,
      //                         ),
      //                       ),
      //                       SizedBox(width: 75,),
      //                       Icon(Icons.arrow_forward_ios, size: 12,),
      //                     ],
      //                   ),
      //                 ),
      //                 Container(
      //                     padding: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
      //                     height: 40,
      //                     width: 200,
      //                     child: Text(
      //                       "Loan Disbursement",
      //                       style: TextStyle(
      //                         fontSize: 12,
      //                       ),
      //                     )
      //                 ),
      //                 Container(
      //                     padding: EdgeInsets.only(top: 10, left: 20, bottom: 10),
      //                     height: 40,
      //                     width: 200,
      //                     child: Row(
      //                       children: [
      //                         Text(
      //                           "Loan Repayment",
      //                           style: TextStyle(
      //                             fontSize: 12,
      //                           ),
      //                         ),
      //                         SizedBox(width: 55,),
      //                         Icon(Icons.arrow_forward_ios, size: 12,)
      //                       ],
      //                     )
      //                 ),
      //                 Container(
      //                   padding: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
      //                   height: 40,
      //                   width: 200,
      //                   child: Row(
      //                     children: [
      //                       Text(
      //                         "Reschedule",
      //                         style: TextStyle(
      //                           fontSize: 12,
      //                         ),
      //                       ),
      //
      //                     ],
      //                   ),
      //                 ),
      //
      //               ],
      //             ),
      //           )
      //               : SizedBox(),
      //         ],
      //       ),
      //     ),
      //   ],
      // )
    );
  }
}
