import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../Constants/Constants.dart';
import '../../../Constants/values.dart';
import '../../../Model/scheme.dart';

class LoanOtherInfo extends StatefulWidget {
  var selectedsanction;

  var condisburse;
  String deathrisk;
  bool bsanction;
  var scheme;

  LoanOtherInfo(
      {required this.bsanction,required this.condisburse,required this.deathrisk,
      required this.scheme,
      required this.selectedsanction});

  @override
  State<LoanOtherInfo> createState() => _LoanOtherInfoState();
}

class _LoanOtherInfoState extends State<LoanOtherInfo> {
  @override
  Widget build(BuildContext context) {
    var ScreenWidth = MediaQuery.of(context).size.width;

    double ResponsiveWidth = MediaQuery.of(context as BuildContext).size.width;
    double ResponsiveHeight =
        MediaQuery.of(context as BuildContext).size.height;

    bool desktop = false;
    bool tablet = false;
    bool mobile = false;

    if (ResponsiveWidth > 1400) {
      desktop = true;
      tablet = false;
      mobile = false;
    } else if (ResponsiveWidth > 540) {
      tablet = true;
      desktop = false;
      mobile = false;
    } else {
      mobile = true;
      desktop = false;
      tablet = false;
    }

    return desktop
        ? Container(
            width: 1400,
            //height: 350,
            height: 540,
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
                          "Loan Other Information",
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
                Padding(
                  padding: const EdgeInsets.only(top: 50, left: 150),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "Samitee Code :",
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              SizedBox(
                                width: 300,
                                child: Text(
                                  widget.bsanction
                                      ? widget.selectedsanction.somiteeid
                                      : "",
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: [
                              Text(
                                "Service Charge (%) :",
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(
                                width: 40,
                              ),
                              SizedBox(
                                width: 300,
                                child: Text(
                                  widget.bsanction
                                      ? widget.selectedsanction.servicecharge
                                          .toString()
                                      : "",
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Row(
                            children: [
                              Text(
                                "Installment Amount :",
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(
                                width: 45,
                              ),
                              SizedBox(
                                width: 300,
                                child: Text(
                                  widget.bsanction
                                      ? widget
                                          .selectedsanction.installmentamount
                                          .toString()
                                      : "",
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              const Text(
                                "No of Installment :",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(
                                width: 40,
                              ),
                              SizedBox(
                                width: 300,
                                child: Text(
                                  widget.bsanction
                                      ? widget.selectedsanction.installmentno
                                          .toString()
                                      : "",
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 100,
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 50,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  "Granted Amount :",
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                                SizedBox(
                                  width: 120,
                                ),
                                SizedBox(
                                  width: 300,
                                  child: Text(
                                    widget.condisburse.text,
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Row(
                            children: [
                              const Text(
                                "Loan Duration :",
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(
                                width: 40,
                              ),
                              SizedBox(
                                width: 300,
                                child: Text(
                                  widget.bsanction
                                      ? widget.scheme.duration.toString()
                                      : "",
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Row(
                            children: [
                              Text(
                                "Death Risk (%) :",
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(
                                width: 40,
                              ),
                              SizedBox(
                                width: 300,
                                child: Text(
                                   widget.deathrisk,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Row(
                            children: [
                              Text(
                                "Approved Date :",
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(
                                width: 25,
                              ),
                              SizedBox(
                                width: 300,
                                child:  Text(
                                  widget.bsanction
                                      ? DateFormat.yMMMMd().format( widget.selectedsanction.approvedate):'',
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
        : tablet
            ? Container(
                width: 1400,
                //height: 350,
                height: 1040,
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
                              "Loan Other Information",
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
                    Padding(
                      padding:
                          EdgeInsets.only(top: 50, left: ScreenWidth / 10.24),
                      child: Column(
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Samitee Code :",
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  SizedBox(
                                    width: 300,
                                    child: TextField(
                                      readOnly: true,
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white,
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Service Charge (%) :",
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 40,
                                  ),
                                  SizedBox(
                                    width: 300,
                                    child: TextField(
                                      readOnly: true,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                        ),
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
                                  Text(
                                    "Installment Amount :",
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 45,
                                  ),
                                  SizedBox(
                                    width: 300,
                                    child: TextField(
                                      readOnly: true,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                        ),
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
                                  Text(
                                    "Manager Name :",
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 25,
                                  ),
                                  SizedBox(
                                    width: 300,
                                    child: TextField(
                                      readOnly: true,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "No of Installment :",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 40,
                                  ),
                                  SizedBox(
                                    width: 300,
                                    child: TextField(
                                      readOnly: true,
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white,
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Granted Amount :",
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 70,
                                  ),
                                  SizedBox(
                                    width: 300,
                                    child: TextField(
                                      readOnly: true,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                        ),
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
                                  Text(
                                    "Loan Period :",
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 40,
                                  ),
                                  SizedBox(
                                    width: 300,
                                    child: TextField(
                                      readOnly: true,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                        ),
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
                                  Text(
                                    "Death Risk (%) :",
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 40,
                                  ),
                                  SizedBox(
                                    width: 300,
                                    child: TextField(
                                      readOnly: true,
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white,
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                        ),
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
                                  Text(
                                    "Approved Date :",
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 25,
                                  ),
                                  SizedBox(
                                    width: 300,
                                    child: TextField(
                                      readOnly: true,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                        ),
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
            : Container(
                width: 1400,
                //height: 350,
                height: 1040,
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
                      height: 30,
                      color: navbarColor,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 40.0),
                            child: Text(
                              "Loan Other Information",
                              style: TextStyle(
                                color: AppColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(top: 50, left: ScreenWidth / 10.24),
                      child: Column(
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Samitee Code :",
                                    style: TextStyle(
                                      fontSize: 8,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  SizedBox(
                                    width: 200,
                                    child: TextField(
                                      readOnly: true,
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white,
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Service Charge (%) :",
                                    style: TextStyle(
                                      fontSize: 8,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 40,
                                  ),
                                  SizedBox(
                                    width: 200,
                                    child: TextField(
                                      readOnly: true,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                        ),
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
                                  Text(
                                    "Installment Amount :",
                                    style: TextStyle(
                                      fontSize: 8,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 45,
                                  ),
                                  SizedBox(
                                    width: 200,
                                    child: TextField(
                                      readOnly: true,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                        ),
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
                                  Text(
                                    "Manager Name :",
                                    style: TextStyle(
                                      fontSize: 8,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 25,
                                  ),
                                  SizedBox(
                                    width: 200,
                                    child: TextField(
                                      readOnly: true,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "No of Installment :",
                                    style: TextStyle(
                                      fontSize: 8,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 40,
                                  ),
                                  SizedBox(
                                    width: 200,
                                    child: TextField(
                                      readOnly: true,
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white,
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Granted Amount :",
                                    style: TextStyle(
                                      fontSize: 8,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 55,
                                  ),
                                  SizedBox(
                                    width: 200,
                                    child: TextField(
                                      readOnly: true,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                        ),
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
                                  Text(
                                    "Loan Period :",
                                    style: TextStyle(
                                      fontSize: 8,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 40,
                                  ),
                                  SizedBox(
                                    width: 200,
                                    child: TextField(
                                      readOnly: true,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                        ),
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
                                  Text(
                                    "Death Risk (%) :",
                                    style: TextStyle(
                                      fontSize: 8,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 40,
                                  ),
                                  SizedBox(
                                    width: 200,
                                    child: TextField(
                                      readOnly: true,
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white,
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                        ),
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
                                  Text(
                                    "Approved Date :",
                                    style: TextStyle(
                                      fontSize: 8,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 25,
                                  ),
                                  SizedBox(
                                    width: 200,
                                    child: TextField(
                                      readOnly: true,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                        ),
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
              );
  }
}
