import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import '../../../Constants/Constants.dart';
import '../../Model/member.dart';
class MemberRequestClosing extends StatefulWidget {
  List<Memberss> memberss = [];
  var selectedmemberss;
  var selectedmemberssid;
  bool mem;
  bool memberssselected;
  void Function(int) setupmemberss;
  MemberRequestClosing(
      {required this.setupmemberss,
      required this.memberssselected,
      required this.memberss,
        required this.mem,
      required this.selectedmemberss,
      required this.selectedmemberssid});
  @override
  State<MemberRequestClosing> createState() => _MemberRequestClosingState();
}

class _MemberRequestClosingState extends State<MemberRequestClosing> {
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
            height: 530,
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
                          "Member Information for Closing Request",
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
                              RichText(
                                text: TextSpan(
                                  text: 'Select Member',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 14),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: ' *',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.red,
                                            fontSize: 14)),
                                    TextSpan(
                                        text: ' :',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 14)),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Container(
                                  width: 300,
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  decoration: BoxDecoration(
                                    color: AppColor_greyBorder,
                                    border: Border.all(color: AppColor_Black),
                                  ),
                                  child: DropdownSearch<Memberss>(
                                    enabled: widget.memberssselected,
                                    popupProps: PopupProps.menu(
                                      showSearchBox: true,
                                      itemBuilder: (BuildContext context,
                                          Memberss item, bool isSelected) {
                                        return Container(
                                          padding: EdgeInsets.all(15),
                                          child: Text(
                                            item.firstname +
                                                " " +
                                                item.lastname +
                                                " - " +
                                                item.id,
                                          ),
                                        );
                                      },
                                      fit: FlexFit.loose,
                                      showSelectedItems: false,
                                      menuProps: const MenuProps(
                                        backgroundColor: Colors.white,
                                        elevation: 100,
                                      ),
                                      searchFieldProps: const TextFieldProps(
                                        style: TextStyle(fontSize: 12),
                                        decoration: InputDecoration(
                                          isDense: true,
                                          hintText: "Search...",
                                        ),
                                      ),
                                    ),
                                    dropdownDecoratorProps:
                                        const DropDownDecoratorProps(
                                      dropdownSearchDecoration: InputDecoration(
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.transparent),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.transparent),
                                        ),
                                      ),
                                    ),
                                    dropdownBuilder: (context, item) {
                                      if (item == null) {
                                        return const Text(
                                          "Enter Member Name/Code",
                                        );
                                      } else {
                                        return Text(
                                          item.firstname +
                                              " " +
                                              item.lastname +
                                              " - " +
                                              item.id,
                                        );
                                      }
                                    },
                                    onChanged: (newValue) {
                                      setState(() {
                                        widget.selectedmemberss = newValue;
                                        widget.selectedmemberssid = widget
                                                .memberss[
                                            widget.memberss.indexOf(newValue!)];
                                        widget.setupmemberss(
                                            widget.memberss.indexOf(newValue));
                                        widget.memberssselected = true;
                                        widget.mem = true;
                                      });
                                    },
                                    items: widget.memberss,
                                    selectedItem: widget.selectedmemberss,
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: [
                              Text(
                                "Loan Pending Amount: ",
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              SizedBox(
                                width: 300,
                                child: Text(
                                  widget.mem
                                      ? widget.selectedmemberss.loanpendingamount
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
                                "Father Name :",
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              SizedBox(
                                width: 300,
                                child: Text(
                                  widget.mem
                                      ? widget.selectedmemberss.fathername
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
                              Text(
                                "Present Address :",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              SizedBox(
                                width: 300,
                                child: Text(
                                  widget.mem
                                      ? widget.selectedmemberss.presentadd
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
                                "Mobile No :",
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              SizedBox(
                                width: 300,
                                child: Text(
                                  widget.mem
                                      ? widget.selectedmemberss.mobilenno
                                          .toString()
                                      : "",
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
                          Padding(
                            padding: const EdgeInsets.only(left: 50),
                            child: Row(
                              children: [
                                Text(
                                  "Member Own Deposit :",
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                                SizedBox(
                                  width: 80,
                                ),
                                SizedBox(
                                  width: 300,
                                  child: Text(
                                    widget.mem
                                        ? widget.selectedmemberss.owndepositamount
                                        .toString()
                                        : "",
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
                              Text(
                                "Mother Name :",
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(
                                width: 12,
                              ),
                              SizedBox(
                                width: 300,
                                child: Text(
                                  widget.mem
                                      ? widget.selectedmemberss.mothername
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
                                "Permanent Address :",
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(
                                width: 12,
                              ),
                              SizedBox(
                                width: 300,
                                child: Text(
                                  widget.mem
                                      ? widget.selectedmemberss.parmaadd
                                          .toString()
                                      : "",
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
                height: 1030,
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
                              "Member Information for Closing Request",
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
                                  RichText(
                                    text: TextSpan(
                                      text: 'Select Member',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 14),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: ' *',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.red,
                                                fontSize: 14)),
                                        TextSpan(
                                            text: ' :',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14)),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  SizedBox(
                                    width: 300,
                                    child: TextField(
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: AppColor_greyBorder,
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: AppColor_greyBorder),
                                        ),
                                        hintText: "Enter Somitee/ Code",
                                        hintStyle: TextStyle(
                                          color: AppColor_greyText,
                                        ),
                                        suffixIcon: Icon(Icons.search,
                                            color: AppColor_greyText),
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
                                    "Loan Pending Amount: ",
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
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
                                    "Father Name :",
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15,
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
                                    "Present Address :",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  SizedBox(
                                    width: 300,
                                    child: TextField(
                                      readOnly: true,
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white,
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide.none),
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
                                    "Mobile No :",
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15,
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
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Member Own Deposit :",
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
                                            borderSide: BorderSide.none),
                                        hintText: "33",
                                        hintStyle: TextStyle(
                                          color: Colors.black,
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
                                    "Mother Name :",
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 12,
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
                                    "Permanent Address :",
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 12,
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
                height: 1030,
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
                              "Member Information for Closing Request",
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
                                  RichText(
                                    text: TextSpan(
                                      text: 'Select Member',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 8),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: ' *',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.red,
                                                fontSize: 8)),
                                        TextSpan(
                                            text: ' :',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 8)),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  SizedBox(
                                    width: 200,
                                    child: TextField(
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: AppColor_greyBorder,
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: AppColor_greyBorder),
                                        ),
                                        hintText: "Enter Somitee/ Code",
                                        hintStyle: TextStyle(
                                          color: AppColor_greyText,
                                          fontSize: 8,
                                        ),
                                        suffixIcon: Icon(Icons.search,
                                            color: AppColor_greyText),
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
                                    "Loan Pending Amount: ",
                                    style: TextStyle(
                                      fontSize: 8,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
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
                                    "Father Name :",
                                    style: TextStyle(
                                      fontSize: 8,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15,
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
                                    "Present Address :",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 8,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  SizedBox(
                                    width: 200,
                                    child: TextField(
                                      readOnly: true,
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white,
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide.none),
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
                                    "Mobile No :",
                                    style: TextStyle(
                                      fontSize: 8,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15,
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
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Member Own Deposit :",
                                    style: TextStyle(
                                      fontSize: 8,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 35,
                                  ),
                                  SizedBox(
                                    width: 200,
                                    child: TextField(
                                      readOnly: true,
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white,
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide.none),
                                        hintText: "33",
                                        hintStyle: TextStyle(
                                          color: Colors.black,
                                          fontSize: 8,
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
                                    "Mother Name :",
                                    style: TextStyle(
                                      fontSize: 8,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 12,
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
                                    "Permanent Address :",
                                    style: TextStyle(
                                      fontSize: 8,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 12,
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
