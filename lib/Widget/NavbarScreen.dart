import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:prottashasomit/Widget/Appbool.dart';
import 'package:prottashasomit/Widget/NavBool.dart';
import 'package:prottashasomit/Widget/Navbar.dart';

import '../Constants/Constants.dart';
import '../Screens/DesktopScreen/DesktopDashBoard/Loan/LoanSaction.dart';
import '../Screens/DesktopScreen/DesktopDashBoard/MemberManagement/CloseMember.dart';
import '../Screens/DesktopScreen/DesktopDashBoard/MemberManagement/DeadMemberInfo.dart';
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
import '../Screens/DesktopScreen/DesktopDashBoard/Transaction/DepositWithDwarClosed.dart';
import '../Screens/DesktopScreen/DesktopDashBoard/Transaction/DepositWithDwarNormal.dart';
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
  var withdrawArr = [false, false];
  var trasctionArr = [false, false];
  var loanSectionArr = [false, false];

  Color itemColor = AppColor_Blue;
  Color textColor = Colors.black;

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
      withdrawArr[index] = false;
      loanSectionArr[index] = false;
    });
  }

  _transctionTogle_withdraw(int index){
    setState(() {
      for (int i = 0; i < withdrawArr.length; i++) {
        withdrawArr[i] = false;
      }
      withdrawArr[index] = true;
      trasctionArr[index] = false;
      loanSectionArr[index] = false;
    });
  }

  _loanTogle_saction(int index){
    setState(() {
      for (int i = 0; i < loanSectionArr.length; i++) {
        loanSectionArr[i] = false;
      }
      loanSectionArr[index] = true;
      withdrawArr[index] = false;
      trasctionArr[index] = false;
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
                        color: AppColor_Blue,
                        // height: 800,
                        width: 200,
                        child: Column(
                          children: [
                            InkWell(
                              onHover: (val) {
                                setState(() {
                                  if(val){
                                    itemColor = AppColor_hover1;
                                    textColor = Colors.white;
                                  } else {
                                    itemColor = AppColor_Blue;
                                    textColor = Colors.black;
                                  }
                                });

                              },
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
                                color: itemColor,
                                child: Text(
                                  "Samitee Registration",
                                  style: TextStyle(
                                    color: textColor,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onHover: (val) {
                                setState(() {
                                  if(val){
                                    itemColor = AppColor_hover1;
                                    textColor = Colors.white;
                                  } else {
                                    itemColor = AppColor_Blue;
                                    textColor = Colors.black;
                                  }
                                });

                              },
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
                                  color: itemColor,
                                  child: Text(
                                    "Member Registration",
                                    style: TextStyle(
                                      color: textColor,
                                      fontSize: 12,
                                    ),
                                  )),
                            ),
                            InkWell(
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
                            InkWell(
                              onTap: (){
                                Get.to(CloseMember(
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
                            ),
                            InkWell(
                              onTap: () {
                                Get.to(DeadMemberInfo(
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
                            ),
                          ],
                        ),
                      )
                    : SizedBox(),
                arr[1]
                    ? Container(
                        margin: EdgeInsets.only(left: 180),
                        color: AppColor_Blue,
                        // height: 800,
                        width: 180,
                        child: Column(
                          children: [
                            InkWell(
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

                            InkWell(
                              onTap: (){
                                _transctionTogle_withdraw(0);
                              },
                              child: Container(
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
                            ),
                            InkWell(
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
                        color: AppColor_Blue,
                        // height: 800,
                        width: 200,
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {
                                _loanTogle_saction(0);
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
                        color: AppColor_Blue,
                        // height: 800,
                        width: 350,
                        child: Column(
                          children: [
                            InkWell(
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
                            InkWell(
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
                            InkWell(
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
                            InkWell(
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
                            InkWell(
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
                            InkWell(
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
                            InkWell(
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
                            InkWell(
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
                            InkWell(
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
                  color: AppColor_Blue,
                  // height: 800,
                  width: 200,
                  child: Column(
                    children: [
                      InkWell(
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
                      InkWell(
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

                withdrawArr[0] ?
                Container(
                  margin: EdgeInsets.only(left: 0),
                  color: AppColor_Blue,
                  // height: 800,
                  width: 250,
                  child: Column(
                    children: [
                      InkWell(

                        onTap: (){
                          Get.to(DepositWithDwarNormal(
                            appbool: widget.appbool,
                            navbool: widget.navbool,
                          ));
                        },
                        onHover: (val) {
                          setState(() {
                            if(val){
                              itemColor = Colors.black;
                              textColor = Colors.white;
                            } else {
                              itemColor = AppColor_Blue;
                              textColor = Colors.black;
                            }
                          });

                        },
                        child: Container(
                          padding: EdgeInsets.only(
                              top: 10, left: 20, right: 20, bottom: 10),
                          height: 40,
                          width: 250,
                          color: itemColor,
                          child: Row(
                            children: [
                              Text(
                                "Deposit Withdwar Request (normal)",
                                style: TextStyle(
                                  color: textColor,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          Get.to(DepositWithDwarClosed(
                            appbool: widget.appbool,
                            navbool: widget.navbool,
                          ));
                        },
                        child: Container(
                            padding: EdgeInsets.only(
                                top: 10, left: 20, right: 20, bottom: 10),
                            height: 40,
                            width: 250,
                            child: Text(
                              "Deposit Withdwar Request (closed)",
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            )),
                      ),

                    ],
                  ),
                )
                    : SizedBox(),
                loanSectionArr[0] ?
                Container(
                  margin: EdgeInsets.only(left: 0),
                  color: AppColor_Blue,
                  // height: 800,
                  width: 250,
                  child: Column(
                    children: [
                      InkWell(

                        onTap: (){
                          Get.to(LoanSanction(
                            appbool: widget.appbool,
                            navbool: widget.navbool,
                          ));
                        },
                        onHover: (val) {
                          setState(() {
                            if(val){
                              itemColor = Colors.black;
                              textColor = Colors.white;
                            } else {
                              itemColor = AppColor_Blue;
                              textColor = Colors.black;
                            }
                          });

                        },
                        child: Container(
                          padding: EdgeInsets.only(
                              top: 10, left: 20, right: 20, bottom: 10),
                          height: 40,
                          width: 250,
                          color: itemColor,
                          child: Row(
                            children: [
                              Text(
                                "Sanction Limit Request",
                                style: TextStyle(
                                  color: textColor,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (){

                        },
                        child: Container(
                            padding: EdgeInsets.only(
                                top: 10, left: 20, right: 20, bottom: 10),
                            height: 40,
                            width: 250,
                            child: Text(
                              "Approved Sanction Reject",
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
