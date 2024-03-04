import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:intl/intl.dart';
import 'package:prottashasomit/ScreensCBS/Widgets/ContactInfo.dart';
import '../../../../Constants/Constants.dart';
import '../../../../Constants/values.dart';
import '../../../../Model/somitee.dart';
import '../../../../route.dart';
import '../../Model/member.dart';
import '../../ScreensMFS/Transaction/widget/Image.dart';
import '../../ScreensMFS/Widget/Appbool.dart';
import '../../ScreensMFS/Widget/OtherInfo.dart';
import '../../ScreensMFS/Widget/PersonalInfoForm.dart';
import '../../ScreensMFS/Widget/SingleRow.dart';
import '../Widgets/CustomProgressBar.dart';
import '../Widgets/NavBoolCBS.dart';
import '../Widgets/NavbarScreenCBS.dart';
import '../../ScreensMFS/Widget/Appbar.dart';
import '../../ScreensMFS/Widget/Appbool.dart';
import '../Widgets/OtherInformation.dart';
import '../Widgets/PersonalExistinginfo.dart';
import '../Widgets/customerSelection.dart';
import '../Widgets/memberSelection.dart';

class RegularDepositIntroducer extends StatefulWidget {
  var selectedintroducertype;
  var selectedaccountno;
  Function(int) save;
  RegularDepositIntroducer({
    required this.selectedintroducertype,
    required this.save,
    required this.selectedaccountno,
  });

  @override
  State<RegularDepositIntroducer> createState() =>
      _RegularDepositIntroducerState();
}

class _RegularDepositIntroducerState extends State<RegularDepositIntroducer> {
  @override
  Widget build(BuildContext context) {
    int _selectedValue = 1;
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
    return Container(
      margin: EdgeInsets.only(top: 100),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 120, left: 50),
            width: 1400,
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
                        padding: EdgeInsets.only(left: ScreenWidth / 38.4),
                        child: Text(
                          "Nominee Information",
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
                          widget.save(2);
                        },
                        child: Container(
                          height: ScreenWidth / 38.4,
                          width: ScreenWidth / 15.2,
                          color: Colors.blueAccent,
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.fast_rewind,
                                color: Colors.white,
                                size: ScreenWidth / 109.71,
                              ),
                              SizedBox(
                                width: ScreenWidth / 212,
                              ),
                              Text(
                                "Previous",
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
                      SizedBox(
                        width: ScreenWidth / 153.6,
                      ),
                      InkWell(
                        onTap: () {
                          // if(widget.selectedsector == null && widget.selectedsamitee==null){
                          //   Get.snackbar(
                          //       "Next Page Error","Some Required Field is empty.",
                          //       snackPosition: SnackPosition.BOTTOM,
                          //       colorText: Colors.white,
                          //       backgroundColor: Colors.red,
                          //       margin: EdgeInsets.zero,
                          //       duration: const Duration(milliseconds: 2000),
                          //       boxShadows: [
                          //         const BoxShadow(
                          //             color: Colors.grey, offset: Offset(-100, 0), blurRadius: 20),
                          //       ],
                          //       borderRadius: 0);
                          // }else{
                             widget.save(5);
                          // }
                        },
                        child: Container(
                          height: ScreenWidth / 38.4,
                          width: ScreenWidth / 19.2,
                          color: Colors.green,
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.fast_forward,
                                color: Colors.white,
                                size: ScreenWidth / 109.71,
                              ),
                              SizedBox(
                                width: ScreenWidth / 212,
                              ),
                              Text(
                                "Next",
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
                      SizedBox(
                        width: ScreenWidth / 153.6,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50, left: 150),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              RichText(
                                text: const TextSpan(
                                  text: 'Introducer Type',
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
                                width: 50,
                              ),
                              Container(
                                  width: 300,
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  decoration: BoxDecoration(
                                    color: AppColor_greyBorder,
                                    border: Border.all(color: AppColor_Black),
                                  ),
                                  child: DropdownSearch<String>(
                                    popupProps: PopupProps.menu(
                                      showSearchBox: true,
                                      itemBuilder: (BuildContext context,
                                          String item, bool isSelected) {
                                        return Container(
                                          padding: EdgeInsets.all(15),
                                          child: Text(
                                            item,
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
                                          "Enter Type",
                                        );
                                      } else {
                                        return Text(
                                          item,
                                        );
                                      }
                                    },
                                    onChanged: (newValue) {
                                      setState(() {
                                        widget.selectedintroducertype =
                                            newValue;
                                      });
                                    },
                                    items: IntroducerTypeList,
                                    selectedItem: widget.selectedintroducertype,
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Row(
                            children: [
                              RichText(
                                text: const TextSpan(
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
                                width: 70,
                              ),
                              Container(
                                  width: 300,
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  decoration: BoxDecoration(
                                    color: AppColor_greyBorder,
                                    border: Border.all(color: AppColor_Black),
                                  ),
                                  child: DropdownSearch<Map<String, String>>(
                                    popupProps: PopupProps.menu(
                                      showSearchBox: true,
                                      itemBuilder: (BuildContext context,
                                          Map<String, String> item,
                                          bool isSelected) {
                                        return Container(
                                          padding: EdgeInsets.all(15),
                                          child: Text(
                                            item['ID']!,
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
                                          item['ID']!,
                                        );
                                      }
                                    },
                                    onChanged: (newValue) {
                                      setState(() {
                                        widget.selectedaccountno = newValue;
                                      });
                                    },
                                    items: IntroducerList,
                                    selectedItem: widget.selectedaccountno,
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Row(
                            children: [
                              RichText(
                                text: TextSpan(
                                  text: 'Account Name',
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
                                width: 50,
                              ),
                              Container(
                                width: ScreenWidth / 5.12,
                                height: ScreenWidth / 30.72,
                                margin: EdgeInsets.only(top: 25),
                                child: Text(widget.selectedaccountno==null?"":
                                    widget.selectedaccountno['Name'],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 40,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 550,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
