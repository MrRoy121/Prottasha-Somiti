import 'package:flutter/material.dart';
import 'package:prottashasomit/Widget/Appbar.dart';
import 'package:prottashasomit/Widget/Appbool.dart';
import 'package:prottashasomit/Widget/NavBool.dart';
import '../../../../Constants/Constants.dart';
import '../../../../Widget/NavbarScreen.dart';


class SamiteeRegistration extends StatefulWidget {
  Navbool navbool;
  Appbool appbool;

  SamiteeRegistration({required this.appbool, required this.navbool});

  @override
  State<SamiteeRegistration> createState() => _SamiteeRegistrationState();
}

class _SamiteeRegistrationState extends State<SamiteeRegistration> {
  var arr = [false, false, false, false, false, false, false, false, false];


  @override
  Widget build(BuildContext context) {
    _toglechnage(int index){
      setState(() {
        for(int i =0;i<arr.length;i++){
          arr[i] = false;
        }
        arr[index] = true;
      });
    }
    return Scaffold(
      appBar: Appbar(
        navbool: widget.appbool,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            NavbarScreen(appbool: widget.appbool, navbool: widget.navbool,),
        
            SizedBox(
              height: 50,
            ),
        
            Container(
              width: 1400,
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
                              "Samitee Registration",
                            style: TextStyle(
                              color: AppColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
        
                        Spacer(),
        
                        Container(
                          height: 40,
                          width: 80,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10.0, left: 15),
                            child: Text("✓ Save", style: TextStyle(color: Colors.white, fontSize: 14),),
                          ),
                          color: Colors.green,
                        ),
        
                        SizedBox(width: 10,),
        
                        Container(
                          height: 40,
                          width: 130,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 3.0, left: 15),
                            child: Row(
                              children: [
                                Icon(Icons.list, color: Colors.white, size: 18,),
                                Text("Somitee List", style: TextStyle(color: Colors.white, fontSize: 14),),
                              ],
                            ),
                          ),
                          color: AppColor,
                        ),
        
                        SizedBox(width: 10,),
        
                        Container(
                          height: 40,
                          width: 50,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10.0, left: 20),
                            child: Text("X", style: TextStyle(color: Colors.white, fontSize: 14),),
                          ),
                          color: Colors.red,
                        ),
        
                        SizedBox(width: 10,),
        
                      ],
                    ),
                  ),
        
                  Padding(
                    padding: const EdgeInsets.only(top: 50, left: 150),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                RichText(
                                    text: TextSpan(
                                      text: 'Somitee Name',
                                      style: TextStyle(color: Colors.black, fontSize: 14),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: ' *', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red, fontSize: 14)),
                                        TextSpan(
                                            text: ' :',
                                            style: TextStyle(color: Colors.black, fontSize: 14)),
        
                                      ],
                                    ),
                                ),
        
                                SizedBox(width: 10,),
        
        
                                SizedBox(
                                  width: 300,
                                  child: TextField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
        
        
                              ],
                            ),
        
        
                            SizedBox(
                              height: 40,
                            ),
        
                            Row(
                              children: [
                                RichText(
                                  text: TextSpan(
                                    text: 'Branch Name',
                                    style: TextStyle(color: Colors.black, fontSize: 14),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: ' *', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red, fontSize: 14)),
                                      TextSpan(
                                          text: ' :',
                                          style: TextStyle(color: Colors.black, fontSize: 14)),
        
                                    ],
                                  ),
                                ),
        
                                SizedBox(width: 15,),
        
                                SizedBox(
                                  width: 300,
                                  child: TextField(
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
                          width: 150,
                        ),
        
                        Column(
                          children: [
                            Row(
                              children: [
                                RichText(
                                  text: TextSpan(
                                    text: 'Phone',
                                    style: TextStyle(color: Colors.black, fontSize: 14),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: ' *', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red, fontSize: 14)),
                                      TextSpan(
                                          text: ' :',
                                          style: TextStyle(color: Colors.black, fontSize: 14)),
        
                                    ],
                                  ),
                                ),
        
                                SizedBox(width: 80,),
        
                                SizedBox(
                                  width: 300,
                                  child: TextField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
        
        
                              ],
                            ),
        
                            SizedBox(
                              height: 40,
                            ),
        
                            Row(
                              children: [
                                RichText(
                                  text: TextSpan(
                                    text: 'Samitee Address',
                                    style: TextStyle(color: Colors.black, fontSize: 14),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: ' *', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red, fontSize: 14)),
                                      TextSpan(
                                          text: ' :',
                                          style: TextStyle(color: Colors.black, fontSize: 14)),
        
                                    ],
                                  ),
                                ),
        
                                SizedBox(width: 12,),
        
                                SizedBox(
                                  width: 300,
                                  child: TextField(
                                    decoration: InputDecoration(
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
            )
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
