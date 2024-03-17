import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../Constants/Constants.dart';
import '../../../Model/account.dart';

class LinkACinfo extends StatefulWidget {
  List<Accountss> accounts = [];
  var selectedaccount;
  var scheme;
  var selectedsanction;
  bool mmems = false;
  bool bsanction;
  var memberss;
  LinkACinfo({
    required this.memberss,
    required this.scheme,
    required this.selectedaccount,
    required this.accounts,
    required this.bsanction,
    required this.selectedsanction,
  });
  @override
  State<LinkACinfo> createState() => _LinkACinfoState();
}

class _LinkACinfoState extends State<LinkACinfo> {
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
            width: 900,
            //height: 350,
            height: 450,
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
                  width: 900,
                  height: 40,
                  color: navbarColor,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 40.0),
                        child: Text(
                          "Link A/c Information",
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
                  padding: const EdgeInsets.only(top: 20.0, left: 30),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              RichText(
                                text: TextSpan(
                                  text: 'Account No',
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
                                width: 10,
                              ),
                              Container(
                                  width: 300,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  decoration: BoxDecoration(
                                    color: AppColor_greyBorder,
                                    border: Border.all(color: AppColor_Black),
                                  ),
                                  child: DropdownSearch<Accountss>(
                                    popupProps: PopupProps.menu(
                                      showSearchBox: true,
                                      itemBuilder: (BuildContext context,
                                          Accountss item, bool isSelected) {
                                        return Container(
                                          padding: EdgeInsets.all(15),
                                          child: Text(
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
                                          "Enter Account No",
                                        );
                                      } else {
                                        return Text(
                                          item.id,
                                        );
                                      }
                                    },
                                    onChanged: (newValue) async {
                                      setState(() {
                                        widget.selectedaccount = newValue;
                                        widget.mmems = true;
                                      });
                                    },
                                    items: widget.accounts,
                                    selectedItem: widget.selectedaccount,
                                  )),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: [
                              Text(
                                "Account Title: ",
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              SizedBox(
                                width: 250,
                                child: Text(
                                 widget. mmems
                                      ? widget.  selectedaccount
                                      .member['First Name'] +
                                      ' ' +
                                     widget. selectedaccount
                                          .member['Last Name']
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
                                width: 250,
                                child: Text(
                                  widget.bsanction
                                      ? widget.memberss.fathername
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
                                "Gender :",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              SizedBox(
                                width: 250,
                                child: Text(
                                  widget.bsanction
                                      ? widget.memberss.gender
                                      : '',
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 50, top: 20),
                            child: Row(
                              children: [
                                RichText(
                                  text: TextSpan(
                                    text: 'NID No',
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
                                  width: 80,
                                ),
                                Container(
                                  width: 250,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 7, vertical: 15),
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      border: Border.all(
                                          width: 1, color: Colors.black)),
                                  child: Text(
                                    widget.bsanction
                                        ? "${widget.memberss.nationalid}"
                                        : "",
                                    style: TextStyle(
                                      color: Colors.black,
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
                              Text(
                                "Date Of Birth :",
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(
                                width: 12,
                              ),
                              SizedBox(
                                width: 250,
                                child: Text(
                                  widget.bsanction
                                      ? DateFormat.yMMMMd()
                                          .format(widget.memberss.birthdate)
                                      : '',
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
                                width: 250,
                                child: Text(
                                  widget.bsanction
                                      ? widget.memberss.mothername
                                      : '',
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
                                "Mobile Number :",
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(
                                width: 12,
                              ),
                              SizedBox(
                                width: 250,
                                child: Text(
                                  widget.bsanction
                                      ? widget.memberss.mobilenno
                                      : '',
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
                width: 900,
                //height: 350,
                height: 850,
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
                      width: 900,
                      height: 40,
                      color: navbarColor,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 40.0),
                            child: Text(
                              "Link A/c Information",
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
                          EdgeInsets.only(top: 20.0, left: ScreenWidth / 51.2),
                      child: Column(
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      text: 'Account No',
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
                                    width: 40,
                                  ),
                                  SizedBox(
                                    width: 250,
                                    child: TextField(
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: AppColor_greyBorder,
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: AppColor_greyBorder),
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
                                    "Account Title: ",
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  SizedBox(
                                    width: 250,
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
                                    width: 250,
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
                                    "Gender :",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  SizedBox(
                                    width: 250,
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
                              Padding(
                                padding: EdgeInsets.only(
                                    left: ScreenWidth / 30.72, top: 20),
                                child: Row(
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        text: 'NID No',
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
                                      width: 80,
                                    ),
                                    SizedBox(
                                      width: 250,
                                      child: TextField(
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: AppColor_greyBorder,
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: AppColor_greyBorder),
                                          ),
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
                                  Text(
                                    "Date Of Birth :",
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 12,
                                  ),
                                  SizedBox(
                                    width: 250,
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
                                    "Mother Name :",
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 12,
                                  ),
                                  SizedBox(
                                    width: 250,
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
                                    "Mobile Number :",
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 12,
                                  ),
                                  SizedBox(
                                    width: 250,
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
                width: 900,
                //height: 350,
                height: 850,
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
                      width: 900,
                      height: 30,
                      color: navbarColor,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 40.0),
                            child: Text(
                              "Link A/c Information",
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
                          EdgeInsets.only(top: 20.0, left: ScreenWidth / 51.2),
                      child: Column(
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      text: 'Account No',
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
                                    width: 40,
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
                                    "Account Title: ",
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
                                    "Gender :",
                                    style: TextStyle(
                                      fontSize: 8,
                                      color: Colors.black,
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
                              Padding(
                                padding: EdgeInsets.only(
                                    left: ScreenWidth / 30.72, top: 20),
                                child: Row(
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        text: 'NID No',
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
                                      width: 80,
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
                                  Text(
                                    "Date Of Birth :",
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
                                    "Mobile Number :",
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
