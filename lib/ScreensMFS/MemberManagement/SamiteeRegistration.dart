import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../../Constants/Constants.dart';
import '../../../../route.dart';
import '../Widget/Appbar.dart';
import '../Widget/Appbool.dart';
import '../Widget/NavBoolMFS.dart';
import '../Widget/NavbarScreenMFS.dart';

class SamiteeRegistration extends StatefulWidget {
  Navbool navbool;
  Appbool appbool;

  SamiteeRegistration({required this.appbool, required this.navbool});

  @override
  State<SamiteeRegistration> createState() => _SamiteeRegistrationState();
}

class _SamiteeRegistrationState extends State<SamiteeRegistration> {
  final _consomitiname = TextEditingController();
  final _conphone = TextEditingController();
  final _conbranchname = TextEditingController();
  final _conaddress = TextEditingController();

  Future<void> _save() async {
    String name = _consomitiname.text;
    String phone = _conphone.text;
    String branch = _conbranchname.text;
    String address = _conaddress.text;

    if (name.isEmpty || phone.isEmpty || branch.isEmpty || address.isEmpty) {
      Get.snackbar("Somitee Registration Failed.", "All Fields are Required",
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          backgroundColor: Colors.red,
          margin: EdgeInsets.zero,
          duration: const Duration(milliseconds: 2000),
          boxShadows: [
            BoxShadow(
                color: Colors.grey, offset: Offset(-100, 0), blurRadius: 20),
          ],
          borderRadius: 0);
    } else {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('Somitee').get();
      int somiteeCount = querySnapshot.docs.length;
      String documentId = (somiteeCount + 90890001).toString();
      FirebaseFirestore.instance.collection('Somitee').doc(documentId).set({
        'Name': name,
        'Phone': phone,
        'Branch': branch,
        'Address': address,
        'Active': 0,
        'Closed': 0,
        'Formation Date': DateTime.now(),
        'Last Edited': DateTime.now(),
      }).then((value) {
        Get.offNamed(somiteelistPageRoute);
        Get.snackbar(
            "Somitee Added Successfully.", "Redirecting to Somitee List Page.",
            snackPosition: SnackPosition.BOTTOM,
            colorText: Colors.white,
            backgroundColor: Colors.green,
            margin: EdgeInsets.zero,
            duration: const Duration(milliseconds: 2000),
            boxShadows: [
              const BoxShadow(
                  color: Colors.grey, offset: Offset(-100, 0), blurRadius: 20),
            ],
            borderRadius: 0);
      }).catchError((error) => print("Failed to add user: $error"));
    }
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
              margin: EdgeInsets.only(top: 100, left: 50),
              // margin: EdgeInsets.only(top: 100, left: 50),
              width: ScreenWidth / 1.097,
              height: 300,
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
                          padding: EdgeInsets.only(left: ScreenWidth / 38.4),
                          child: Text(
                            "Samitee Registration",
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
                            _save();
                          },
                          child: Container(
                            height: ScreenWidth / 38.4,
                            width: ScreenWidth / 19.2,
                            color: Colors.green,
                            alignment: Alignment.center,
                            child: Padding(
                              padding:
                                  EdgeInsets.only(top: ScreenWidth / 153.6),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.check,
                                    color: Colors.white,
                                    size: ScreenWidth / 109.71,
                                  ),
                                  SizedBox(
                                    width: ScreenWidth / 512,
                                  ),
                                  Text(
                                    "Save",
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
                        ),
                        SizedBox(
                          width: ScreenWidth / 153.6,
                        ),
                        InkWell(
                          onTap: () {
                            Get.offNamed(somiteelistPageRoute);
                          },
                          child: Container(
                            height: ScreenWidth / 38.4,
                            width: ScreenWidth / 11.81,
                            color: AppColor,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: ScreenWidth / 512,
                                  left: ScreenWidth / 102.4),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.list,
                                    color: Colors.white,
                                    size: ScreenWidth / 85.33,
                                  ),
                                  Text(
                                    "Somitee List",
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
                  Padding(
                    padding: EdgeInsets.only(
                        top: ScreenWidth / 30.72, left: ScreenWidth / 10.24),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                RichText(
                                  text: TextSpan(
                                    text: 'Somitee Name',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: ScreenWidth / 109.71),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: ' *',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.red,
                                              fontSize: ScreenWidth / 109.71)),
                                      TextSpan(
                                          text: ' :',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: ScreenWidth / 109.71)),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: ScreenWidth / 153.6,
                                ),
                                SizedBox(
                                  width: ScreenWidth / 5.12,
                                  height: ScreenWidth / 30.72,
                                  child: TextField(
                                    controller: _consomitiname,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: ScreenWidth / 38.4,
                            ),
                            Row(
                              children: [
                                RichText(
                                  text: TextSpan(
                                    text: 'Branch Name',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: ScreenWidth / 109.71),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: ' *',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.red,
                                              fontSize: ScreenWidth / 109.71)),
                                      TextSpan(
                                          text: ' :',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: ScreenWidth / 109.71)),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: ScreenWidth / 102.4,
                                ),
                                SizedBox(
                                  width: ScreenWidth / 5.12,
                                  height: ScreenWidth / 30.72,
                                  child: TextField(
                                    controller: _conbranchname,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          width: ScreenWidth / 10.24,
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                RichText(
                                  text: TextSpan(
                                    text: 'Phone',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: ScreenWidth / 109.71),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: ' *',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.red,
                                              fontSize: ScreenWidth / 109.71)),
                                      TextSpan(
                                          text: ' :',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: ScreenWidth / 109.71)),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: ScreenWidth / 19.2,
                                ),
                                SizedBox(
                                  width: ScreenWidth / 5.12,
                                  height: ScreenWidth / 30.72,
                                  child: TextField(
                                    controller: _conphone,
                                    keyboardType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.allow(
                                          RegExp(r'[0-9]')),
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: ScreenWidth / 38.4,
                            ),
                            Row(
                              children: [
                                RichText(
                                  text: TextSpan(
                                    text: 'Samitee Address',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: ScreenWidth / 109.71),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: ' *',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.red,
                                              fontSize: ScreenWidth / 109.71)),
                                      TextSpan(
                                          text: ' :',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: ScreenWidth / 109.71)),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: ScreenWidth / 128,
                                ),
                                SizedBox(
                                  width: ScreenWidth / 5.12,
                                  height: ScreenWidth / 30.72,
                                  child: TextField(
                                    controller: _conaddress,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            NavbarScreenMFS(
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
