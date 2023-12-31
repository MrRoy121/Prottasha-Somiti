import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:prottashasomit/Widget/Appbool.dart';
import 'package:prottashasomit/Widget/NavBool.dart';
import 'package:prottashasomit/Widget/Navbar.dart';

import '../Screens/DesktopScreen/DesktopDashBoard/MemberManagement/EditMembers.dart';
import '../Screens/DesktopScreen/DesktopDashBoard/MemberManagement/MemberRegistration.dart';
import '../Screens/DesktopScreen/DesktopDashBoard/MemberManagement/SamiteeRegistration.dart';
import '../Screens/DesktopScreen/DesktopDashBoard/Reports/DailyGLSummary.dart';
import '../Screens/DesktopScreen/DesktopDashBoard/Reports/DailyTransactionList.dart';
import '../Screens/DesktopScreen/DesktopDashBoard/Reports/GeneralLedgerStatement.dart';
import '../Screens/DesktopScreen/DesktopDashBoard/Reports/MemberLedger.dart';
import '../Screens/DesktopScreen/DesktopDashBoard/Reports/MemberWiseDisburse.dart';
import '../Screens/DesktopScreen/DesktopDashBoard/Reports/SlipReprint.dart';
import '../Screens/DesktopScreen/DesktopDashBoard/Reports/SamiteeWiseDisburse.dart';
import '../Screens/DesktopScreen/DesktopDashBoard/Reports/SamiteeWiseMemberDepositLoan.dart';
import '../Screens/DesktopScreen/DesktopDashBoard/Reports/SanctionDetailInformation.dart';
import '../Screens/DesktopScreen/DesktopDashBoard/Transaction/DepositCollectionReport.dart';
import '../Screens/DesktopScreen/DesktopDashBoard/Transaction/DepositCollectionReportScreen2.dart';
import '../Screens/DesktopScreen/DesktopDashBoard/Transaction/SamiteeTransaction.dart';

class NavbarScreen extends StatefulWidget {
  Navbool navbool;
  Appbool appbool;

  NavbarScreen({required this.appbool, required this.navbool});

  @override
  State<NavbarScreen> createState() => _NavbarScreenState();
}

class _NavbarScreenState extends State<NavbarScreen> {
  var arr = [false, false, false, false, false, false, false, false, false];
  var trasctionArr = [false, false];

  _toglechnage(int index) {
    setState(() {
      for (int i = 0; i < arr.length; i++) {
        arr[i] = false;
      }
      arr[index] = true;
    });
  }

  _transctionTogle_loan(int index){
    setState(() {
      for (int i = 0; i < trasctionArr.length; i++) {
        trasctionArr[i] = false;
      }
      trasctionArr[index] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Navbar(
            navbool: widget.navbool,
            toglechnage: _toglechnage,
          ),
          SizedBox(
            width: double.infinity,
            child: Row(
              children: [
                arr[0]
                    ? Container(
                        color: Colors.blue,
                        // height: 800,
                        width: 200,
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.to(SamiteeRegistration(
                                  appbool: widget.appbool,
                                  navbool: widget.navbool,
                                ));
                              },
                              child: Container(
                                padding: EdgeInsets.only(
                                    top: 10, left: 20, right: 20, bottom: 10),
                                height: 40,
                                width: 200,
                                // color: Colors.grey,
                                child: Text(
                                  "Samitee Registration",
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.to(MemberRegistration(
                                  appbool: widget.appbool,
                                  navbool: widget.navbool,
                                ));
                              },
                              child: Container(
                                  padding: EdgeInsets.only(
                                      top: 10, left: 20, right: 20, bottom: 10),
                                  height: 40,
                                  width: 200,
                                  child: Text(
                                    "Member Registration",
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  )),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.to(EditMembers(
                                  appbool: widget.appbool,
                                  navbool: widget.navbool,
                                ));
                              },
                              child: Container(
                                  padding: EdgeInsets.only(
                                      top: 10, left: 20, bottom: 10),
                                  height: 40,
                                  width: 200,
                                  child: Text(
                                    "Edit Member",
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  )),
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                  top: 10, left: 20, right: 20, bottom: 10),
                              height: 40,
                              width: 200,
                              child: Row(
                                children: [
                                  Text(
                                    "Member Closing",
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 55,
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    size: 12,
                                  )
                                ],
                              ),
                            ),
                            Container(
                                padding: EdgeInsets.only(
                                    top: 10, left: 20, right: 20, bottom: 10),
                                height: 40,
                                width: 200,
                                child: Row(
                                  children: [
                                    Text(
                                      "Dead Member Information",
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 0,
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      size: 12,
                                    )
                                  ],
                                )),
                          ],
                        ),
                      )
                    : SizedBox(),
                arr[1]
                    ? Container(
                        margin: EdgeInsets.only(left: 180),
                        color: Colors.blue,
                        // height: 800,
                        width: 180,
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                _transctionTogle_loan(0);
                              },
                              child: Container(
                                  padding: EdgeInsets.only(
                                      top: 10, left: 20, bottom: 10),
                                  height: 40,
                                  width: 180,
                                  child: Row(
                                    children: [
                                      Text(
                                        "Deposit",
                                        style: TextStyle(
                                          fontSize: 12,
                                        ),
                                      ),

                                      SizedBox(width: 83),

                                      Icon(
                                        Icons.arrow_forward_ios,
                                        size: 12,
                                      ),
                                    ],
                                  )),
                            ),

                            Container(
                              padding: EdgeInsets.only(
                                  top: 10, left: 20, right: 20, bottom: 10),
                              height: 40,
                              width: 200,
                              child: Row(
                                children: [
                                  Text(
                                    "Withdraw",
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 73,
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    size: 12,
                                  )
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: (){
                                Get.to(SamiteeTransaction(
                                  appbool: widget.appbool,
                                  navbool: widget.navbool,
                                ));
                              },
                              child: Container(
                                  padding: EdgeInsets.only(
                                      top: 10, left: 20, right: 20, bottom: 10),
                                  height: 40,
                                  width: 200,
                                  child: Row(
                                    children: [
                                      Text(
                                        "Samitee Transaction",
                                        style: TextStyle(
                                          fontSize: 12,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        size: 12,
                                      )
                                    ],
                                  )),
                            ),
                          ],
                        ),
                      )
                    : SizedBox(),
                arr[2]
                    ? Container(
                        margin: EdgeInsets.only(left: 340),
                        color: Colors.blue,
                        // height: 800,
                        width: 200,
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.only(
                                  top: 10, left: 20, right: 20, bottom: 10),
                              height: 40,
                              width: 200,
                              // color: Colors.grey,
                              child: Row(
                                children: [
                                  Text(
                                    "Loan Saction",
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 75,
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    size: 12,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                                padding: EdgeInsets.only(
                                    top: 10, left: 20, right: 20, bottom: 10),
                                height: 40,
                                width: 200,
                                child: Text(
                                  "Loan Disbursement",
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                )),
                            Container(
                                padding: EdgeInsets.only(
                                    top: 10, left: 20, bottom: 10),
                                height: 40,
                                width: 200,
                                child: Row(
                                  children: [
                                    Text(
                                      "Loan Repayment",
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 55,
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      size: 12,
                                    )
                                  ],
                                )),
                            Container(
                              padding: EdgeInsets.only(
                                  top: 10, left: 20, right: 20, bottom: 10),
                              height: 40,
                              width: 200,
                              child: Row(
                                children: [
                                  Text(
                                    "Reschedule",
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    : SizedBox(),
                arr[3]
                    ? Container(
                        margin: EdgeInsets.only(left: 480),
                        color: Colors.blue,
                        // height: 800,
                        width: 350,
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.to(MemberLedger(
                                  appbool: widget.appbool,
                                  navbool: widget.navbool,
                                ));
                              },
                              child: Container(
                                padding: EdgeInsets.only(
                                    top: 10, left: 20, right: 20, bottom: 10),
                                height: 40,
                                width: 350,
                                // color: Colors.grey,
                                child: Text(
                                  "Member Ledger",
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                                padding: EdgeInsets.only(
                                    top: 10, left: 20, right: 20, bottom: 10),
                                height: 40,
                                width: 350,
                                child: Text(
                                  "Ledger Balance",
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                )),
                            GestureDetector(
                              onTap: () {
                                Get.to(DailyTransactionList(
                                  appbool: widget.appbool,
                                  navbool: widget.navbool,
                                ));
                              },
                              child: Container(
                                  padding: EdgeInsets.only(
                                      top: 10, left: 20, bottom: 10),
                                  height: 40,
                                  width: 350,
                                  child: Text(
                                    "Daily Transaction List",
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  )),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.to(DailyGLSummary(
                                  appbool: widget.appbool,
                                  navbool: widget.navbool,
                                ));
                              },
                              child: Container(
                                padding: EdgeInsets.only(
                                    top: 10, left: 20, right: 20, bottom: 10),
                                height: 40,
                                width: 350,
                                child: Row(
                                  children: [
                                    Text(
                                      "Daily GL Summary",
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                  top: 10, left: 20, right: 20, bottom: 10),
                              height: 40,
                              width: 350,
                              child: Row(
                                children: [
                                  Text(
                                    "Loan Basic Information",
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                  top: 10, left: 20, right: 20, bottom: 10),
                              height: 40,
                              width: 350,
                              child: Row(
                                children: [
                                  Text(
                                    "Loan Schedule",
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                  top: 10, left: 20, right: 20, bottom: 10),
                              height: 40,
                              width: 350,
                              child: Row(
                                children: [
                                  Text(
                                    "Member Deposit Withdrawal",
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                  top: 10, left: 20, right: 20, bottom: 10),
                              height: 40,
                              width: 350,
                              child: Row(
                                children: [
                                  Text(
                                    "Total Ledger & Balance",
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: (){
                                Get.to(SamiteeWiseMemberDepositeLoan(
                                  appbool: widget.appbool,
                                  navbool: widget.navbool,
                                ));
                              },
                              child: Container(
                                padding: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
                                height: 40,
                                width: 350,
                                child: Row(
                                  children: [
                                    Text(
                                      "Samitee Wise Member Deposit & Loan",
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.to(SanctionDetailInformation(
                                  appbool: widget.appbool,
                                  navbool: widget.navbool,
                                ));
                              },
                              child: Container(
                                padding: EdgeInsets.only(
                                    top: 10, left: 20, right: 20, bottom: 10),
                                height: 40,
                                width: 350,
                                child: Row(
                                  children: [
                                    Text(
                                      "Sanction Detail Information",
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                  top: 10, left: 20, right: 20, bottom: 10),
                              height: 40,
                              width: 350,
                              child: Row(
                                children: [
                                  Text(
                                    "Loan Detail Information",
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: (){
                                Get.to(GenerallLedgerStatement(
                                  appbool: widget.appbool,
                                  navbool: widget.navbool,
                                ));
                              },
                              child: Container(
                                padding: EdgeInsets.only(
                                    top: 10, left: 20, right: 20, bottom: 10),
                                height: 40,
                                width: 350,
                                child: Row(
                                  children: [
                                    Text(
                                      "GL Statement",
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                  top: 10, left: 20, right: 20, bottom: 10),
                              height: 40,
                              width: 350,
                              child: Row(
                                children: [
                                  Text(
                                    "Loan Outstanding & Overdue",
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.to(SamiteeWiseDisburse(
                                  appbool: widget.appbool,
                                  navbool: widget.navbool,
                                ));
                              },
                              child: Container(
                                padding: EdgeInsets.only(
                                    top: 10, left: 20, right: 20, bottom: 10),
                                height: 40,
                                width: 350,
                                child: Row(
                                  children: [
                                    Text(
                                      "Samitee Wise Disburse, Over Due & Outstanding",
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.to(MemberWiseDisburse(
                                  appbool: widget.appbool,
                                  navbool: widget.navbool,
                                ));
                              },
                              child: Container(
                                padding: EdgeInsets.only(
                                    top: 10, left: 20, right: 20, bottom: 10),
                                height: 40,
                                width: 350,
                                child: Row(
                                  children: [
                                    Text(
                                      "Member Wise Disburse, Over Due & Outstanding",
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.to(SlipReprint(
                                  appbool: widget.appbool,
                                  navbool: widget.navbool,
                                ));
                              },
                              child: Container(
                                padding: EdgeInsets.only(
                                    top: 10, left: 20, right: 20, bottom: 10),
                                height: 40,
                                width: 350,
                                child: Row(
                                  children: [
                                    Text(
                                      "Slip Reprint",
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                  top: 10, left: 20, right: 20, bottom: 10),
                              height: 40,
                              width: 350,
                              child: Row(
                                children: [
                                  Text(
                                    "Member Service Charge Waiver",
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                  top: 10, left: 20, right: 20, bottom: 10),
                              height: 40,
                              width: 350,
                              child: Row(
                                children: [
                                  Text(
                                    "Dead Member List",
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                  top: 10, left: 20, right: 20, bottom: 10),
                              height: 40,
                              width: 350,
                              child: Row(
                                children: [
                                  Text(
                                    "Loan Reschedule Info",
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    : SizedBox(),

                trasctionArr[0] ?
                Container(
                  margin: EdgeInsets.only(left: 0),
                  color: Colors.blue,
                  // height: 800,
                  width: 200,
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: (){
                          Get.to(DepositCollectionReport(
                            appbool: widget.appbool,
                            navbool: widget.navbool,
                          ));
                        },
                        child: Container(
                          padding: EdgeInsets.only(
                              top: 10, left: 20, right: 20, bottom: 10),
                          height: 40,
                          width: 200,
                          // color: Colors.grey,
                          child: Row(
                            children: [
                              Text(
                                "Deposit Collection Request",
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          Get.to(DepositCollectionReportScreen2(
                            appbool: widget.appbool,
                            navbool: widget.navbool,
                          ));
                        },
                        child: Container(
                            padding: EdgeInsets.only(
                                top: 10, left: 20, right: 20, bottom: 10),
                            height: 40,
                            width: 200,
                            child: Text(
                              "Deposit Collection Request",
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            )),
                      ),

                    ],
                  ),
                )
                    : SizedBox(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
