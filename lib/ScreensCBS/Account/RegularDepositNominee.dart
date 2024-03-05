import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:firebase_storage/firebase_storage.dart';
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

class RegularDepositNominee extends StatefulWidget {
  var nomineename;
  var fathername;
  var mothername;
  DateTime selectedDate;
  var documentno;
  var nomineepercentage;
  var selectedrelation;
  var selecteddocumenttype;
  var pickedImage;
  var pickeddfImage;
  var pickeddbImage;
  Function(int) save;
  bool img, dfimg, dbimg;
  Function(int) setuprelation;
  Function(BuildContext) selectDate;
  Function(int) setupdocumenttype;
  Function() selectdocumentbackImage;
  Function() selectNomineeImage;
  Function() selectdocumentfrontimage;
  RegularDepositNominee(
      {required this.nomineepercentage,
      required this.save,
      required this.img,
      required this.selectNomineeImage,
      required this.selectdocumentfrontimage,
      required this.dfimg,
      required this.selectdocumentbackImage,
      required this.dbimg,
      required this.selectedDate,
      required this.selectDate,
      required this.setuprelation,
      required this.setupdocumenttype,
      required this.pickedImage,
      required this.pickeddbImage,
      required this.pickeddfImage,
      required this.documentno,
      required this.fathername,
      required this.nomineename,
      required this.selectedrelation,
      required this.selecteddocumenttype,
      required this.mothername});

  @override
  State<RegularDepositNominee> createState() => _RegularDepositNomineeState();
}

class _RegularDepositNomineeState extends State<RegularDepositNominee> {
  @override
  Widget build(BuildContext context) {
    int _selectedValue = 1;
    var ScreenWidth = MediaQuery.of(context).size.width;

    double ResponsiveWidth = MediaQuery.of(context as BuildContext).size.width;
    double ResponsiveHeight =
        MediaQuery.of(context as BuildContext).size.height;

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
                          widget.save(1);
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
                          if (widget.selectedrelation == null ||
                              widget.selecteddocumenttype == null ||
                              widget.pickedImage == null ||
                              widget.pickeddbImage == null ||
                              widget.pickeddfImage == null ||
                              widget.fathername.text == '' ||
                              widget.nomineename.text == '' ||
                              widget.nomineepercentage.text == '' ||
                              widget.mothername.text == '' ||
                              widget.documentno.text == '') {
                            Get.snackbar("Next Page Error",
                                "Some Required Field is empty.",
                                snackPosition: SnackPosition.BOTTOM,
                                colorText: Colors.white,
                                backgroundColor: Colors.red,
                                margin: EdgeInsets.zero,
                                duration: const Duration(milliseconds: 2000),
                                boxShadows: [
                                  const BoxShadow(
                                      color: Colors.grey,
                                      offset: Offset(-100, 0),
                                      blurRadius: 20),
                                ],
                                borderRadius: 0);
                          } else {
                            widget.save(4);
                          }
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
                                  text: 'Relation',
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
                                width: 110,
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
                                          "Enter Relation",
                                        );
                                      } else {
                                        return Text(
                                          item,
                                        );
                                      }
                                    },
                                    onChanged: (newValue) {
                                      setState(() {
                                        widget.selectedrelation = newValue;
                                        widget.setuprelation(
                                            RelationList.indexOf(newValue!));
                                      });
                                    },
                                    items: RelationList,
                                    selectedItem: widget.selectedrelation,
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
                                  text: 'Father Name',
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
                                width: ScreenWidth / 19.2,
                              ),
                              SizedBox(
                                width: ScreenWidth / 5.12,
                                height: ScreenWidth / 30.72,
                                child: TextField(
                                  controller: widget.fathername,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 2, horizontal: 5),
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
                                  text: 'Date of Birth',
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
                                width: ScreenWidth / 18.07,
                              ),
                              SizedBox(
                                width: ScreenWidth / 5.12,
                                height: ScreenWidth / 30.72,
                                child: InkWell(
                                  onTap: () => widget.selectDate(context),
                                  child: AbsorbPointer(
                                    child: TextField(
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white,
                                        border: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.grey),
                                        ),
                                        hintText: widget.selectedDate != null
                                            ? "${widget.selectedDate!.day}-${widget.selectedDate!.month}-${widget.selectedDate!.year}"
                                            : "Select a date",
                                        hintStyle: TextStyle(
                                          color: Colors.grey,
                                          fontSize: ScreenWidth / 109.71,
                                        ),
                                        suffixIcon: Icon(
                                            Icons.calendar_month_sharp,
                                            size: ScreenWidth / 109.71,
                                            color: Colors.grey),
                                      ),
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
                              RichText(
                                text: const TextSpan(
                                  text: 'Document Type',
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
                                          "Enter Member Name/Code",
                                        );
                                      } else {
                                        return Text(
                                          item,
                                        );
                                      }
                                    },
                                    onChanged: (newValue) {
                                      setState(() {
                                        widget.selecteddocumenttype = newValue;
                                        widget.setupdocumenttype(
                                            DocumentList.indexOf(newValue!));
                                      });
                                    },
                                    items: DocumentList,
                                    selectedItem: widget.selecteddocumenttype,
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: 40,
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
                                  text: 'Nominee Name',
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
                                width: ScreenWidth / 19.2,
                              ),
                              SizedBox(
                                width: ScreenWidth / 5.12,
                                height: ScreenWidth / 30.72,
                                child: TextField(
                                  controller: widget.nomineename,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 2, horizontal: 5),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Row(
                            children: [
                              RichText(
                                text: TextSpan(
                                  text: 'Mother Name',
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
                                width: ScreenWidth / 19.2,
                              ),
                              SizedBox(
                                width: ScreenWidth / 5.12,
                                height: ScreenWidth / 30.72,
                                child: TextField(
                                  controller: widget.mothername,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 2, horizontal: 5),
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
                                  text: 'Nominee Percentage',
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
                                width: ScreenWidth / 19.2,
                              ),
                              SizedBox(
                                width: ScreenWidth / 5.12,
                                height: ScreenWidth / 30.72,
                                child: TextField(
                                  controller: widget.nomineepercentage,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 2, horizontal: 5),
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
                                  text: 'Document No',
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
                                width: ScreenWidth / 19.2,
                              ),
                              SizedBox(
                                width: ScreenWidth / 5.12,
                                height: ScreenWidth / 30.72,
                                child: TextField(
                                  controller: widget.documentno,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 2, horizontal: 5),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 40,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Divider(),
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 50, left: 300, bottom: 50),
                        child: Container(
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
                                width: 295,
                                height: 30,
                                color: navbarColor,
                                child: const Center(
                                  child: Text(
                                    "Choose Nominee Image",
                                    style: TextStyle(
                                      color: AppColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 15),
                                height: 120,
                                width: 295,
                                child: Row(
                                  children: [
                                    Container(
                                      height: 80,
                                      width: 265,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.grey,
                                          width: 0.5,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              top: 20,
                                              left: 10,
                                              right: 10,
                                            ),
                                            child: Row(
                                              children: [
                                                const Text(
                                                  "Select an Image File",
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                  ),
                                                ),
                                                SizedBox(width: 10),
                                                SizedBox(
                                                  height: 30,
                                                  width: 96,
                                                  child: ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      backgroundColor:
                                                          Colors.white,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        side: const BorderSide(
                                                            color: Colors.blue),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5.0),
                                                      ),
                                                    ),
                                                    onPressed: widget
                                                        .selectNomineeImage,
                                                    child: const Text(
                                                      "Select",
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 250,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Spacer(),
                      Container(
                        margin: EdgeInsets.only(top: 10, right: 250),
                        height: 200,
                        width: 200,
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
                              width: 200,
                              height: 30,
                              color: navbarColor,
                              child: Center(
                                child: Text(
                                  "Preview Image",
                                  style: TextStyle(
                                    color: AppColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 25),
                              padding: EdgeInsets.only(top: 25),
                              height: 120,
                              width: 120,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: widget.img
                                  ? Image.memory(
                                      widget.pickedImage,
                                      fit: BoxFit.cover,
                                    )
                                  : Center(
                                      child: Icon(Icons.person_2_outlined,
                                          size: 58),
                                    ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Divider(),
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 100, left: 300, bottom: 50),
                        child: Container(
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
                                width: 295,
                                height: 30,
                                color: navbarColor,
                                child: const Center(
                                  child: Text(
                                    "Choose Document Front Image",
                                    style: TextStyle(
                                      color: AppColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 15),
                                height: 120,
                                width: 295,
                                child: Row(
                                  children: [
                                    Container(
                                      height: 80,
                                      width: 265,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.grey,
                                          width: 0.5,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              top: 20,
                                              left: 10,
                                              right: 10,
                                            ),
                                            child: Row(
                                              children: [
                                                const Text(
                                                  "Select an Image File",
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                  ),
                                                ),
                                                SizedBox(width: 10),
                                                SizedBox(
                                                  height: 30,
                                                  width: 96,
                                                  child: ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      backgroundColor:
                                                          Colors.white,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        side: const BorderSide(
                                                            color: Colors.blue),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5.0),
                                                      ),
                                                    ),
                                                    onPressed: widget
                                                        .selectdocumentfrontimage,
                                                    child: const Text(
                                                      "Select",
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 250,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Spacer(),
                      Container(
                        margin: EdgeInsets.only(top: 50, right: 250),
                        height: 200,
                        width: 200,
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
                              width: 200,
                              height: 30,
                              color: navbarColor,
                              child: Center(
                                child: Text(
                                  "Preview Image",
                                  style: TextStyle(
                                    color: AppColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 25),
                              padding: EdgeInsets.only(top: 25),
                              height: 120,
                              width: 120,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: widget.dfimg
                                  ? Image.memory(
                                      widget.pickeddfImage,
                                      fit: BoxFit.cover,
                                    )
                                  : Center(
                                      child: Icon(
                                          Icons.document_scanner_outlined,
                                          size: 58),
                                    ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Divider(),
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 100, left: 300, bottom: 50),
                        child: Container(
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
                                width: 295,
                                height: 30,
                                color: navbarColor,
                                child: const Center(
                                  child: Text(
                                    "Choose Document Back Image",
                                    style: TextStyle(
                                      color: AppColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 15),
                                height: 120,
                                width: 295,
                                child: Row(
                                  children: [
                                    Container(
                                      height: 80,
                                      width: 265,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.grey,
                                          width: 0.5,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              top: 20,
                                              left: 10,
                                              right: 10,
                                            ),
                                            child: Row(
                                              children: [
                                                const Text(
                                                  "Select an Image File",
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                  ),
                                                ),
                                                SizedBox(width: 10),
                                                SizedBox(
                                                  height: 30,
                                                  width: 96,
                                                  child: ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      backgroundColor:
                                                          Colors.white,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        side: const BorderSide(
                                                            color: Colors.blue),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5.0),
                                                      ),
                                                    ),
                                                    onPressed: widget
                                                        .selectdocumentbackImage,
                                                    child: const Text(
                                                      "Select",
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 250,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Spacer(),
                      Container(
                        margin: EdgeInsets.only(top: 50, right: 250),
                        height: 200,
                        width: 200,
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
                              width: 200,
                              height: 30,
                              color: navbarColor,
                              child: Center(
                                child: Text(
                                  "Preview Image",
                                  style: TextStyle(
                                    color: AppColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 25),
                              padding: EdgeInsets.only(top: 25),
                              height: 120,
                              width: 120,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: widget.dbimg
                                  ? Image.memory(
                                      widget.pickeddbImage,
                                      fit: BoxFit.cover,
                                    )
                                  : Center(
                                      child: Icon(
                                          Icons.document_scanner_outlined,
                                          size: 58),
                                    ),
                            )
                          ],
                        ),
                      )
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
