import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../Constants/Constants.dart';
import '../../ScreensMFS/Widget/Appbool.dart';
import '../../route.dart';
import 'NavBoolCBS.dart';
import 'NavbarCBS.dart';


class NavbarScreenCBS extends StatefulWidget {
  NavboolCBS navbool;
  Appbool appbool;

  NavbarScreenCBS({required this.appbool, required this.navbool});

  @override
  State<NavbarScreenCBS> createState() => _NavbarScreenCBSState();
}

class _NavbarScreenCBSState extends State<NavbarScreenCBS> {
  var arr = [false, false, false, false, false];
  var withdrawArr = [false, false];
  var trasctionArr = [false, false];
  var closedArr = [false, false];
  var loanSectionArr = [false, false];
  var loanRePayArr = [false, false];

  Color itemColor1 = AppColor_Blue;
  Color textColor1 = Colors.black;
  Color itemColor2 = AppColor_Blue;
  Color textColor2 = Colors.black;
  Color itemColor3 = AppColor_Blue;
  Color textColor3 = Colors.black;
  Color itemColor4 = AppColor_Blue;
  Color textColor4 = Colors.black;
  Color itemColor5 = AppColor_Blue;
  Color textColor5 = Colors.black;
  Color itemColor6 = AppColor_Blue;
  Color textColor6 = Colors.black;
  Color itemColor7 = AppColor_Blue;
  Color textColor7 = Colors.black;

  Color itemColor8 = AppColor_Blue;
  Color textColor8 = Colors.black;
  Color itemColor9 = AppColor_Blue;
  Color textColor9 = Colors.black;
  Color itemColor10 = AppColor_Blue;
  Color textColor10 = Colors.black;
  Color itemColor11 = AppColor_Blue;
  Color textColor11 = Colors.black;
  Color itemColor12 = AppColor_Blue;
  Color textColor12 = Colors.black;
  Color itemColor13 = AppColor_Blue;
  Color textColor13 = Colors.black;
  Color itemColor14 = AppColor_Blue;
  Color textColor14 = Colors.black;
  Color itemColor15 = AppColor_Blue;
  Color textColor15 = Colors.black;
  Color itemColor16 = AppColor_Blue;
  Color textColor16 = Colors.black;
  Color itemColor17 = AppColor_Blue;
  Color textColor17 = Colors.black;
  Color itemColor18 = AppColor_Blue;
  Color textColor18 = Colors.black;
  Color itemColor19 = AppColor_Blue;
  Color textColor19 = Colors.black;

  _toglechnage(int index) {
    setState(() {
      if (!arr[index]) {
        for (int i = 0; i < arr.length; i++) {
          arr[i] = false;

        }
        arr[index] = true;
        for (int i=0; i<withdrawArr.length;i++){
          withdrawArr[i] = false;
        }
        for (int i=0; i<trasctionArr.length;i++){
          trasctionArr[i] = false;
        }
        for (int i=0; i<closedArr.length;i++){
          closedArr[i] = false;
        }
        for (int i=0; i<loanSectionArr.length;i++){
          loanSectionArr[i] = false;
        }
        for (int i=0; i<loanRePayArr.length;i++){
          loanRePayArr[i] = false;
        }

      } else {
        for (int i = 0; i < arr.length; i++) {
          arr[i] = false;

        }
      }
    });
  }

  _transctionTogle_loan(int index) {
    setState(() {
      for (int i = 0; i < trasctionArr.length; i++) {
        trasctionArr[i] = false;
      }
      trasctionArr[index] = true;
      withdrawArr[index] = false;
      loanSectionArr[index] = false;
      loanRePayArr[index] = false;
      closedArr[index] = false;
    });
  }

  _transctionTogle_withdraw(int index) {
    setState(() {
      for (int i = 0; i < withdrawArr.length; i++) {
        withdrawArr[i] = false;
      }
      withdrawArr[index] = true;
      trasctionArr[index] = false;
      loanSectionArr[index] = false;
      loanRePayArr[index] = false;
      closedArr[index] = false;
    });
  }

  _closeTogle_saction(int index) {
    setState(() {
      for (int i = 0; i < closedArr.length; i++) {
        closedArr[i] = false;
      }
      closedArr[index] = true;
      loanSectionArr[index] = false;
      withdrawArr[index] = false;
      trasctionArr[index] = false;
      loanRePayArr[index] = false;
    });
  }

  _loanTogle_saction(int index) {
    setState(() {
      for (int i = 0; i < loanSectionArr.length; i++) {
        loanSectionArr[i] = false;
      }
      loanSectionArr[index] = true;
      withdrawArr[index] = false;
      trasctionArr[index] = false;
      loanRePayArr[index] = false;
      closedArr[index] = false;
    });
  }

  _loanTogle_Repay(int index) {
    setState(() {
      for (int i = 0; i < loanRePayArr.length; i++) {
        loanRePayArr[i] = false;
      }
      loanRePayArr[index] = true;
      withdrawArr[index] = false;
      trasctionArr[index] = false;
      loanSectionArr[index] = false;
      closedArr[index] = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          NavbarCBS(
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
                                  if (val) {
                                    itemColor1 = AppColor_hover1;
                                    textColor1 = Colors.white;
                                  } else {
                                    itemColor1 = AppColor_Blue;
                                    textColor1 = Colors.black;
                                  }
                                });
                              },
                              onTap: () {
                                Get.toNamed(somiteeregistrationPageRoute);
                              },
                              child: Container(
                                padding: EdgeInsets.only(
                                    top: 10, left: 20, right: 20, bottom: 10),
                                height: 40,
                                width: 200,
                                color: itemColor1,
                                child: Text(
                                  "Samitee Registration",
                                  style: TextStyle(
                                    color: textColor1,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onHover: (val) {
                                setState(() {
                                  if (val) {
                                    itemColor2 = AppColor_hover1;
                                    textColor2 = Colors.white;
                                  } else {
                                    itemColor2 = AppColor_Blue;
                                    textColor2 = Colors.black;
                                  }
                                });
                              },
                              onTap: () {
                                Get.toNamed(memberegistrationPageRoute);
                              },
                              child: Container(
                                  padding: EdgeInsets.only(
                                      top: 10, left: 20, right: 20, bottom: 10),
                                  height: 40,
                                  width: 200,
                                  color: itemColor2,
                                  child: Text(
                                    "Member Registration",
                                    style: TextStyle(
                                      color: textColor2,
                                      fontSize: 12,
                                    ),
                                  )),
                            ),
                            InkWell(
                              onHover: (val) {
                                setState(() {
                                  if (val) {
                                    itemColor3 = AppColor_hover1;
                                    textColor3 = Colors.white;
                                  } else {
                                    itemColor3 = AppColor_Blue;
                                    textColor3 = Colors.black;
                                  }
                                });
                              },
                              onTap: () {
                                Get.toNamed(memberlistPageRoute);
                              },
                              child: Container(
                                  padding: EdgeInsets.only(
                                      top: 10, left: 20, bottom: 10),
                                  height: 40,
                                  width: 200,
                                  color: itemColor3,
                                  child: Text(
                                    "Edit Member",
                                    style: TextStyle(
                                      color: textColor3,
                                      fontSize: 12,
                                    ),
                                  )),
                            ),
                            InkWell(
                              onHover: (val) {
                                setState(() {
                                  if (val) {
                                    itemColor4 = AppColor_hover1;
                                    textColor4 = Colors.white;
                                  } else {
                                    itemColor4 = AppColor_Blue;
                                    textColor4 = Colors.black;
                                  }
                                });
                              },
                              onTap: () {
                                _closeTogle_saction(0);
                              },
                              child: Container(
                                padding: EdgeInsets.only(
                                    top: 10, left: 20, right: 20, bottom: 10),
                                height: 40,
                                width: 200,
                                color: itemColor4,
                                child: Row(
                                  children: [
                                    Text(
                                      "Member Closing",
                                      style: TextStyle(
                                        color: textColor4,
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
                              onHover: (val) {
                                setState(() {
                                  if (val) {
                                    itemColor5 = AppColor_hover1;
                                    textColor5 = Colors.white;
                                  } else {
                                    itemColor5 = AppColor_Blue;
                                    textColor5 = Colors.black;
                                  }
                                });
                              },
                              onTap: () {

                              },
                              child: Container(
                                  padding: EdgeInsets.only(
                                      top: 10, left: 20, right: 20, bottom: 10),
                                  height: 40,
                                  width: 200,
                                  color: itemColor5,
                                  child: Row(
                                    children: [
                                      Text(
                                        "Dead Member Information",
                                        style: TextStyle(
                                          color: textColor5,
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
                closedArr[0]
                    ? Container(
                        margin: EdgeInsets.only(left: 0),
                        color: AppColor_Blue,
                        // height: 800,
                        width: 250,
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Get.toNamed(memberclosingPageRoute);
                              },
                              onHover: (val) {
                                setState(() {
                                  if (val) {
                                    itemColor6 = AppColor_hover2;
                                    textColor6 = Colors.white;
                                  } else {
                                    itemColor6 = AppColor_Blue;
                                    textColor6 = Colors.black;
                                  }
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.only(
                                    top: 10, left: 20, right: 20, bottom: 10),
                                height: 40,
                                width: 250,
                                color: itemColor6,
                                child: Row(
                                  children: [
                                    Text(
                                      "Add Closed Member",
                                      style: TextStyle(
                                        color: textColor6,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Get.toNamed(closingmemberrequestPageRoute);
                              },
                              onHover: (val) {
                                setState(() {
                                  if (val) {
                                    itemColor7 = AppColor_hover2;
                                    textColor7 = Colors.white;
                                  } else {
                                    itemColor7 = AppColor_Blue;
                                    textColor7 = Colors.black;
                                  }
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.only(
                                    top: 10, left: 20, right: 20, bottom: 10),
                                height: 40,
                                width: 250,
                                color: itemColor7,
                                child: Row(
                                  children: [
                                    Text(
                                      "Closed Member List",
                                      style: TextStyle(
                                        color: textColor7,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
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
                              onHover: (val) {
                                setState(() {
                                  if (val) {
                                    itemColor1 = AppColor_hover1;
                                    textColor1 = Colors.white;
                                  } else {
                                    itemColor1 = AppColor_Blue;
                                    textColor1 = Colors.black;
                                  }
                                });
                              },
                              onTap: () {
                                _transctionTogle_loan(0);
                              },
                              child: Container(
                                  padding: EdgeInsets.only(
                                      top: 10, left: 20, bottom: 10),
                                  height: 40,
                                  width: 180,
                                  color: itemColor1,
                                  child: Row(
                                    children: [
                                      Text(
                                        "Deposit",
                                        style: TextStyle(
                                          color: textColor1,
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
                              onHover: (val) {
                                setState(() {
                                  if (val) {
                                    itemColor2 = AppColor_hover1;
                                    textColor2 = Colors.white;
                                  } else {
                                    itemColor2 = AppColor_Blue;
                                    textColor2 = Colors.black;
                                  }
                                });
                              },
                              onTap: () {
                                _transctionTogle_withdraw(0);
                              },
                              child: Container(
                                padding: EdgeInsets.only(
                                    top: 10, left: 20, right: 20, bottom: 10),
                                height: 40,
                                width: 200,
                                color: itemColor2,
                                child: Row(
                                  children: [
                                    Text(
                                      "Withdraw",
                                      style: TextStyle(
                                        color: textColor2,
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
                              onHover: (val) {
                                setState(() {
                                  if (val) {
                                    itemColor3 = AppColor_hover1;
                                    textColor3 = Colors.white;
                                  } else {
                                    itemColor3 = AppColor_Blue;
                                    textColor3 = Colors.black;
                                  }
                                });
                              },
                              onTap: () {

                              },
                              child: Container(
                                  padding: EdgeInsets.only(
                                      top: 10, left: 20, right: 20, bottom: 10),
                                  height: 40,
                                  width: 200,
                                  color: itemColor3,
                                  child: Row(
                                    children: [
                                      Text(
                                        "Samitee Transaction",
                                        style: TextStyle(
                                          color: textColor3,
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
                arr[3]
                    ? Container(
                        margin: EdgeInsets.only(left: 480),
                        color: AppColor_Blue,
                        // height: 800,
                        width: 350,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              InkWell(
                                onHover: (val) {
                                  setState(() {
                                    if (val) {
                                      itemColor1 = AppColor_hover1;
                                      textColor1 = Colors.white;
                                    } else {
                                      itemColor1 = AppColor_Blue;
                                      textColor1 = Colors.black;
                                    }
                                  });
                                },
                                onTap: () {
                                  // Get.to(MemberLedger(
                                  //   appbool: widget.appbool,
                                  //   navbool: widget.navbool,
                                  // ));
                                  Get.toNamed(memberledgerPageRoute);
                                },
                                child: Container(
                                  padding: EdgeInsets.only(
                                      top: 10, left: 20, right: 20, bottom: 10),
                                  height: 40,
                                  width: 350,
                                  color: itemColor1,
                                  child: Text(
                                    "Member Ledger",
                                    style: TextStyle(
                                      color: textColor1,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {},
                                onHover: (val) {
                                  setState(() {
                                    if (val) {
                                      itemColor2 = AppColor_hover1;
                                      textColor2 = Colors.white;
                                    } else {
                                      itemColor2 = AppColor_Blue;
                                      textColor2 = Colors.black;
                                    }
                                  });
                                },
                                child: Container(
                                    padding: EdgeInsets.only(
                                        top: 10,
                                        left: 20,
                                        right: 20,
                                        bottom: 10),
                                    height: 40,
                                    width: 350,
                                    color: itemColor2,
                                    child: Text(
                                      "Ledger Balance",
                                      style: TextStyle(
                                        color: textColor2,
                                        fontSize: 12,
                                      ),
                                    )),
                              ),
                              InkWell(
                                onHover: (val) {
                                  setState(() {
                                    if (val) {
                                      itemColor3 = AppColor_hover1;
                                      textColor3 = Colors.white;
                                    } else {
                                      itemColor3 = AppColor_Blue;
                                      textColor3 = Colors.black;
                                    }
                                  });
                                },
                                onTap: () {
                                  // Get.to(DailyTransactionList(
                                  //   appbool: widget.appbool,
                                  //   navbool: widget.navbool,
                                  // ));
                                  Get.toNamed(dailytransactionPageRoute);
                                },
                                child: Container(
                                    padding: EdgeInsets.only(
                                        top: 10, left: 20, bottom: 10),
                                    height: 40,
                                    width: 350,
                                    color: itemColor3,
                                    child: Text(
                                      "Daily Transaction List",
                                      style: TextStyle(
                                        color: textColor3,
                                        fontSize: 12,
                                      ),
                                    )),
                              ),
                              InkWell(
                                onHover: (val) {
                                  setState(() {
                                    if (val) {
                                      itemColor4 = AppColor_hover1;
                                      textColor4 = Colors.white;
                                    } else {
                                      itemColor4 = AppColor_Blue;
                                      textColor4 = Colors.black;
                                    }
                                  });
                                },
                                onTap: () {
                                  // Get.to(DailyGLSummary(
                                  //   appbool: widget.appbool,
                                  //   navbool: widget.navbool,
                                  // ));
                                  Get.toNamed(dailyglsummaryPageRoute);
                                },
                                child: Container(
                                  padding: EdgeInsets.only(
                                      top: 10, left: 20, right: 20, bottom: 10),
                                  height: 40,
                                  width: 350,
                                  color: itemColor4,
                                  child: Row(
                                    children: [
                                      Text(
                                        "Daily GL Summary",
                                        style: TextStyle(
                                          color: textColor4,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {},
                                onHover: (val) {
                                  setState(() {
                                    if (val) {
                                      itemColor5 = AppColor_hover1;
                                      textColor5 = Colors.white;
                                    } else {
                                      itemColor5 = AppColor_Blue;
                                      textColor5 = Colors.black;
                                    }
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.only(
                                      top: 10, left: 20, right: 20, bottom: 10),
                                  height: 40,
                                  width: 350,
                                  color: itemColor5,
                                  child: Row(
                                    children: [
                                      Text(
                                        "Loan Basic Information",
                                        style: TextStyle(
                                          color: textColor5,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {},
                                onHover: (val) {
                                  setState(() {
                                    if (val) {
                                      itemColor6 = AppColor_hover1;
                                      textColor6 = Colors.white;
                                    } else {
                                      itemColor6 = AppColor_Blue;
                                      textColor6 = Colors.black;
                                    }
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.only(
                                      top: 10, left: 20, right: 20, bottom: 10),
                                  height: 40,
                                  width: 350,
                                  color: itemColor6,
                                  child: Row(
                                    children: [
                                      Text(
                                        "Loan Schedule",
                                        style: TextStyle(
                                          color: textColor6,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {},
                                onHover: (val) {
                                  setState(() {
                                    if (val) {
                                      itemColor7 = AppColor_hover1;
                                      textColor7 = Colors.white;
                                    } else {
                                      itemColor7 = AppColor_Blue;
                                      textColor7 = Colors.black;
                                    }
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.only(
                                      top: 10, left: 20, right: 20, bottom: 10),
                                  height: 40,
                                  width: 350,
                                  color: itemColor7,
                                  child: Row(
                                    children: [
                                      Text(
                                        "Member Deposit Withdrawal",
                                        style: TextStyle(
                                          color: textColor7,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {},
                                onHover: (val) {
                                  setState(() {
                                    if (val) {
                                      itemColor8 = AppColor_hover1;
                                      textColor8 = Colors.white;
                                    } else {
                                      itemColor8 = AppColor_Blue;
                                      textColor8 = Colors.black;
                                    }
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.only(
                                      top: 10, left: 20, right: 20, bottom: 10),
                                  height: 40,
                                  width: 350,
                                  color: itemColor8,
                                  child: Row(
                                    children: [
                                      Text(
                                        "Total Ledger & Balance",
                                        style: TextStyle(
                                          color: textColor8,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                onHover: (val) {
                                  setState(() {
                                    if (val) {
                                      itemColor9 = AppColor_hover1;
                                      textColor9 = Colors.white;
                                    } else {
                                      itemColor9 = AppColor_Blue;
                                      textColor9 = Colors.black;
                                    }
                                  });
                                },
                                onTap: () {
                                  // Get.to(SamiteeWiseMemberDepositeLoan(
                                  //   appbool: widget.appbool,
                                  //   navbool: widget.navbool,
                                  // ));
                                  Get.toNamed(samiteewisememberdepositPageRoute);
                                },
                                child: Container(
                                  padding: EdgeInsets.only(
                                      top: 10, left: 20, right: 20, bottom: 10),
                                  height: 40,
                                  width: 350,
                                  color: itemColor9,
                                  child: Row(
                                    children: [
                                      Text(
                                        "Samitee Wise Member Deposit & Loan",
                                        style: TextStyle(
                                          color: textColor9,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                onHover: (val) {
                                  setState(() {
                                    if (val) {
                                      itemColor10 = AppColor_hover1;
                                      textColor10 = Colors.white;
                                    } else {
                                      itemColor10 = AppColor_Blue;
                                      textColor10 = Colors.black;
                                    }
                                  });
                                },
                                onTap: () {
                                  // Get.to(SanctionDetailInformation(
                                  //   appbool: widget.appbool,
                                  //   navbool: widget.navbool,
                                  // ));
                                  Get.toNamed(sanctiondetailsinformationPageRoute);
                                },
                                child: Container(
                                  padding: EdgeInsets.only(
                                      top: 10, left: 20, right: 20, bottom: 10),
                                  height: 40,
                                  width: 350,
                                  color: itemColor10,
                                  child: Row(
                                    children: [
                                      Text(
                                        "Sanction Detail Information",
                                        style: TextStyle(
                                          color: textColor10,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {},
                                onHover: (val) {
                                  setState(() {
                                    if (val) {
                                      itemColor11 = AppColor_hover1;
                                      textColor11 = Colors.white;
                                    } else {
                                      itemColor11 = AppColor_Blue;
                                      textColor11 = Colors.black;
                                    }
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.only(
                                      top: 10, left: 20, right: 20, bottom: 10),
                                  height: 40,
                                  width: 350,
                                  color: itemColor11,
                                  child: Row(
                                    children: [
                                      Text(
                                        "Loan Detail Information",
                                        style: TextStyle(
                                          color: textColor11,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                onHover: (val) {
                                  setState(() {
                                    if (val) {
                                      itemColor12 = AppColor_hover1;
                                      textColor12 = Colors.white;
                                    } else {
                                      itemColor12 = AppColor_Blue;
                                      textColor12 = Colors.black;
                                    }
                                  });
                                },
                                onTap: () {
                                  // Get.to(GenerallLedgerStatement(
                                  //   appbool: widget.appbool,
                                  //   navbool: widget.navbool,
                                  // ));
                                  Get.toNamed(glstatementPageRoute);
                                },
                                child: Container(
                                  padding: EdgeInsets.only(
                                      top: 10, left: 20, right: 20, bottom: 10),
                                  height: 40,
                                  width: 350,
                                  color: itemColor12,
                                  child: Row(
                                    children: [
                                      Text(
                                        "GL Statement",
                                        style: TextStyle(
                                          color: textColor12,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {},
                                onHover: (val) {
                                  setState(() {
                                    if (val) {
                                      itemColor13 = AppColor_hover1;
                                      textColor13 = Colors.white;
                                    } else {
                                      itemColor13 = AppColor_Blue;
                                      textColor13 = Colors.black;
                                    }
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.only(
                                      top: 10, left: 20, right: 20, bottom: 10),
                                  height: 40,
                                  width: 350,
                                  color: itemColor13,
                                  child: Row(
                                    children: [
                                      Text(
                                        "Loan Outstanding & Overdue",
                                        style: TextStyle(
                                          color: textColor13,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                onHover: (val) {
                                  setState(() {
                                    if (val) {
                                      itemColor14 = AppColor_hover1;
                                      textColor14 = Colors.white;
                                    } else {
                                      itemColor14 = AppColor_Blue;
                                      textColor14 = Colors.black;
                                    }
                                  });
                                },
                                onTap: () {
                                  // Get.to(SamiteeWiseDisburse(
                                  //   appbool: widget.appbool,
                                  //   navbool: widget.navbool,
                                  // ));
                                  Get.toNamed(samiteewisedisbursePageRoute);
                                },
                                child: Container(
                                  padding: EdgeInsets.only(
                                      top: 10, left: 20, right: 20, bottom: 10),
                                  height: 40,
                                  width: 350,
                                  color: itemColor14,
                                  child: Row(
                                    children: [
                                      Text(
                                        "Samitee Wise Disburse, Over Due & Outstanding",
                                        style: TextStyle(
                                          color: textColor14,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                onHover: (val) {
                                  setState(() {
                                    if (val) {
                                      itemColor15 = AppColor_hover1;
                                      textColor15 = Colors.white;
                                    } else {
                                      itemColor15 = AppColor_Blue;
                                      textColor15 = Colors.black;
                                    }
                                  });
                                },
                                onTap: () {
                                  // Get.to(MemberWiseDisburse(
                                  //   appbool: widget.appbool,
                                  //   navbool: widget.navbool,
                                  // ));
                                  Get.toNamed(memberwishdisbursePageRoute);
                                },
                                child: Container(
                                  padding: EdgeInsets.only(
                                      top: 10, left: 20, right: 20, bottom: 10),
                                  height: 40,
                                  width: 350,
                                  color: itemColor15,
                                  child: Row(
                                    children: [
                                      Text(
                                        "Member Wise Disburse, Over Due & Outstanding",
                                        style: TextStyle(
                                          color: textColor15,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                onHover: (val) {
                                  setState(() {
                                    if (val) {
                                      itemColor16 = AppColor_hover1;
                                      textColor16 = Colors.white;
                                    } else {
                                      itemColor16 = AppColor_Blue;
                                      textColor16 = Colors.black;
                                    }
                                  });
                                },
                                onTap: () {
                                  // Get.to(SlipReprint(
                                  //   appbool: widget.appbool,
                                  //   navbool: widget.navbool,
                                  // ));
                                  Get.toNamed(slipreprintPageRoute);
                                },
                                child: Container(
                                  padding: EdgeInsets.only(
                                      top: 10, left: 20, right: 20, bottom: 10),
                                  height: 40,
                                  width: 350,
                                  color: itemColor16,
                                  child: Row(
                                    children: [
                                      Text(
                                        "Slip Reprint",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: textColor16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {},
                                onHover: (val) {
                                  setState(() {
                                    if (val) {
                                      itemColor17 = AppColor_hover1;
                                      textColor17 = Colors.white;
                                    } else {
                                      itemColor17 = AppColor_Blue;
                                      textColor17 = Colors.black;
                                    }
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.only(
                                      top: 10, left: 20, right: 20, bottom: 10),
                                  height: 40,
                                  width: 350,
                                  color: itemColor17,
                                  child: Row(
                                    children: [
                                      Text(
                                        "Member Service Charge Waiver",
                                        style: TextStyle(
                                            fontSize: 12, color: textColor17),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {},
                                onHover: (val) {
                                  setState(() {
                                    if (val) {
                                      itemColor18 = AppColor_hover1;
                                      textColor18 = Colors.white;
                                    } else {
                                      itemColor18 = AppColor_Blue;
                                      textColor18 = Colors.black;
                                    }
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.only(
                                      top: 10, left: 20, right: 20, bottom: 10),
                                  height: 40,
                                  width: 350,
                                  color: itemColor18,
                                  child: Row(
                                    children: [
                                      Text(
                                        "Dead Member List",
                                        style: TextStyle(
                                          color: textColor18,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {},
                                onHover: (val) {
                                  setState(() {
                                    if (val) {
                                      itemColor19 = AppColor_hover1;
                                      textColor19 = Colors.white;
                                    } else {
                                      itemColor19 = AppColor_Blue;
                                      textColor19 = Colors.black;
                                    }
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.only(
                                      top: 10, left: 20, right: 20, bottom: 10),
                                  height: 40,
                                  width: 350,
                                  color: itemColor19,
                                  child: Row(
                                    children: [
                                      Text(
                                        "Loan Reschedule Info",
                                        style: TextStyle(
                                          color: textColor19,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    : SizedBox(),
                loanSectionArr[0]
                    ? Container(
                        margin: EdgeInsets.only(left: 0),
                        color: AppColor_Blue,
                        // height: 800,
                        width: 250,
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Get.toNamed(sanctionloanrequestPageRoute);
                              },
                              onHover: (val) {
                                setState(() {
                                  if (val) {
                                    itemColor6 = AppColor_hover2;
                                    textColor6 = Colors.white;
                                  } else {
                                    itemColor6 = AppColor_Blue;
                                    textColor6 = Colors.black;
                                  }
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.only(
                                    top: 10, left: 20, right: 20, bottom: 10),
                                height: 40,
                                width: 250,
                                color: itemColor6,
                                child: Row(
                                  children: [
                                    Text(
                                      "Sanction Limit Request",
                                      style: TextStyle(
                                        color: textColor6,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Get.toNamed(loanrequestlistPageRoute);
                              },
                              onHover: (val) {
                                setState(() {
                                  if (val) {
                                    itemColor7 = AppColor_hover2;
                                    textColor7 = Colors.white;
                                  } else {
                                    itemColor7 = AppColor_Blue;
                                    textColor7 = Colors.black;
                                  }
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.only(
                                    top: 10, left: 20, right: 20, bottom: 10),
                                height: 40,
                                width: 250,
                                color: itemColor7,
                                child: Row(
                                  children: [
                                    Text(
                                      "Sanction Request List",
                                      style: TextStyle(
                                        color: textColor7,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            InkWell(
                              onHover: (val) {
                                setState(() {
                                  if (val) {
                                    itemColor5 = AppColor_hover2;
                                    textColor5 = Colors.white;
                                  } else {
                                    itemColor5 = AppColor_Blue;
                                    textColor5 = Colors.black;
                                  }
                                });
                              },
                              onTap: () {
                                Get.toNamed(sanctionloanapprovelistPageRoute);
                              },
                              child: Container(
                                  padding: EdgeInsets.only(
                                      top: 10, left: 20, right: 20, bottom: 10),
                                  height: 40,
                                  width: 250,
                                  color: itemColor5,
                                  child: Text(
                                    "Approved Sanction Reject",
                                    style: TextStyle(
                                      color: textColor5,
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
