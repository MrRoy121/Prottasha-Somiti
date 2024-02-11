import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Constants/Constants.dart';

class MemberDepositWithdwar extends StatefulWidget {
  var selectedtype;
  bool submit = true;
  void Function(int) changetype;
  bool selectmember = false;
  void Function() onsubmit;
  MemberDepositWithdwar(
      {required this.submit,
      required this.selectedtype,
      required this.changetype,
      required this.onsubmit,
      required this.selectmember});

  @override
  State<MemberDepositWithdwar> createState() => _MemberDepositWithdwarState();
}

class _MemberDepositWithdwarState extends State<MemberDepositWithdwar> {
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
                          "Member Deposit Withdraw Request",
                          style: TextStyle(
                            color: AppColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Spacer(),
                      widget.submit
                          ? InkWell(
                              onTap: () {
                                widget.onsubmit();
                              },
                              child: Container(
                                height: 40,
                                width: 90,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10.0, left: 15),
                                  child: Text(
                                    "✓ Submit",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 14),
                                  ),
                                ),
                                color: Colors.green,
                              ),
                            )
                          : Container(),
                      SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          height: 40,
                          width: 50,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10.0, left: 20),
                            child: Text(
                              "X",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
                          ),
                          color: Colors.red,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50, left: 150),
                  child: Row(
                    children: [
                      const Text(
                        "Withdraw Type",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(width: 180),
                      Row(
                        children: [
                          Radio(
                            value: 0,
                            groupValue: widget.selectedtype,
                            onChanged: (value) {
                              widget.changetype(int.parse(value.toString()));
                            },
                          ),
                          Text('Normal Withdraw'),
                          SizedBox(width: 10),
                          Radio(
                            value: 1,
                            groupValue: widget.selectedtype,
                            onChanged: (value) {
                              widget.changetype(int.parse(value.toString()));
                            },
                          ),
                          Text('Closed Withdraw'),
                        ],
                      ),
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
                              "Member Deposit Withdraw Request",
                              style: TextStyle(
                                color: AppColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          Spacer(),
                          widget.submit
                              ? InkWell(
                                  onTap: () {
                                    widget.onsubmit();
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 90,
                                    color: Colors.green,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10.0, left: 15),
                                      child: Text(
                                        "✓ Submit",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 14),
                                      ),
                                    ),
                                  ),
                                )
                              : Container(),
                          SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: Container(
                              height: 40,
                              width: 50,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 10.0, left: 20),
                                child: Text(
                                  "X",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14),
                                ),
                              ),
                              color: Colors.red,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(top: 50, left: ScreenWidth / 10.24),
                      child: Row(
                        children: [
                          Text(
                            "Withdraw Type",
                            style: TextStyle(
                              fontSize: 8,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(width: ScreenWidth / 10.24),
                          Row(
                            children: [
                              Radio(
                                value: 0,
                                groupValue: widget.selectedtype,
                                onChanged: (value) {
                                  widget.changetype(int.parse(value.toString()));
                                },
                              ),
                              Text('Normal Withdraw'),
                              SizedBox(width: 10),
                              Radio(
                                value: 1,
                                groupValue: widget.selectedtype,
                                onChanged: (value) {
                                  widget.changetype(int.parse(value.toString()));
                                },
                              ),
                              Text('Closed Withdraw'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            : Container(
                width: 1400,
                //height: 350,
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
                              "Member Deposit Withdraw Request",
                              style: TextStyle(
                                color: AppColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 8,
                              ),
                            ),
                          ),
                          Spacer(),
                          widget.submit
                              ? InkWell(
                                  onTap: () {
                                    widget.onsubmit();
                                  },
                                  child: Container(
                                    height: 30,
                                    width: 50,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          top: 10.0, left: ScreenWidth / 102.4),
                                      child: Text(
                                        "✓ Submit",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 8),
                                      ),
                                    ),
                                    color: Colors.green,
                                  ),
                                )
                              : Container(),
                          SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: Container(
                              height: 30,
                              width: 20,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: 10.0, left: ScreenWidth / 74.8),
                                child: Text(
                                  "X",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 8),
                                ),
                              ),
                              color: Colors.red,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(top: 50, left: ScreenWidth / 10.24),
                      child: Row(
                        children: [
                          const Text(
                            "Withdraw Type",
                            style: TextStyle(
                              fontSize: 8,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(width: ScreenWidth / 10.24),
                          Row(
                            children: [
                              Radio(
                                value: 0,
                                groupValue: widget.selectedtype,
                                onChanged: (value) {
                                  widget.changetype(int.parse(value.toString()));
                                },
                              ),
                              Text('Normal Withdraw'),
                              SizedBox(width: 10),
                              Radio(
                                value: 1,
                                groupValue: widget.selectedtype,
                                onChanged: (value) {
                                  widget.changetype(int.parse(value.toString()));
                                },
                              ),
                              Text('Closed Withdraw'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
  }
}
