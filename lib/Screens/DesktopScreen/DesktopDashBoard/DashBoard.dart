import 'package:flutter/material.dart';
import 'package:prottashasomit/Widget/Appbar.dart';
import 'package:prottashasomit/Widget/Appbool.dart';
import 'package:prottashasomit/Widget/NavBool.dart';
import '../../../Widget/NavbarScreen.dart';

class DesktopDashBoard extends StatefulWidget {
  Navbool navbool;
  Appbool appbool;

  DesktopDashBoard(this.appbool, this.navbool);

  @override
  State<DesktopDashBoard> createState() => _DesktopDashBoardState();
}

class _DesktopDashBoardState extends State<DesktopDashBoard> {
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
        body: NavbarScreen(appbool: widget.appbool, navbool: widget.navbool,),
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
