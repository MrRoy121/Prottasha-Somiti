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
import '../../Model/account.dart';
import '../../Model/member.dart';
import '../../ScreensMFS/Transaction/widget/Image.dart';
import '../../ScreensMFS/Widget/Appbool.dart';
import '../../helpers/auth_service.dart';
import '../Widgets/NavBoolCBS.dart';
import '../Widgets/NavbarScreenCBS.dart';
import '../../ScreensMFS/Widget/Appbar.dart';
import '../../ScreensMFS/Widget/Appbool.dart';
import '../Widgets/OtherInformation.dart';
import '../Widgets/PersonalExistinginfo.dart';
import '../Widgets/memberSelection.dart';

class CreditLimitDefine extends StatefulWidget {
  NavboolCBS navbool;
  Appbool appbool;

  CreditLimitDefine({required this.appbool, required this.navbool});

  @override
  State<CreditLimitDefine> createState() => _CreditLimitDefineState();
}

class _CreditLimitDefineState extends State<CreditLimitDefine> {
  List<Memberss> memberss = [];
  var selectedmemberss;
  var sselectedmemberss;
  var selectedsamitee;
  double disburse = 0;
  var selectedpeoductclass;
  var installmentfreequency;
  var selectedpeoductccode;
  var sanctionlimit = TextEditingController();
  var sanctionref = TextEditingController();
  var securityvalue = TextEditingController();
  var remarks = TextEditingController();
  var selectedcustomertype;
  String memberid = '';
  DateTime _selectedDate = DateTime.now();
  DateTime _starteDate = DateTime.now();
  DateTime _expireeDate = DateTime.now();

  bool mmems = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetch();
  }

  Future<void> fetch() async {
    memberss = [];
    await FirebaseFirestore.instance
        .collection('Customer')
        .get()
        .then((querySnapshot) {
      for (var element in querySnapshot.docs) {
        memberss.add(Memberss(
            somiteename: element['Member']["Somitee Name"],
            somiteeid: element['Member']["Somitee ID"],
            membertype: element['Member']["Member Type"],
            occupation: element['Member']["Occupation"],
            firstname: element['Member']["First Name"],
            lastname: element['Member']["Last Name"],
            dead: element['Member']['Dead'],
            fathername: element['Member']["Father Name"],
            mothername: element['Member']["Mother Name"],
            loanpendingamount: element['Member']["Loan Pending Amount"],
            owndepositamount: element['Member']["Own deposit Amount"],
            gender: element['Member']["Gender"],
            religion: element['Member']["Religion"],
            sts: element['Member']["Status"],
            nationalid: element['Member']["National ID"],
            birthregi: element['Member']["Birth Registration"],
            annualincome: element['Member']["Annual Income"],
            age: element['Member']["Age"],
            education: element['Member']["Education"],
            maritalstatus: element['Member']["Marital Status"],
            mobilenotype: element['Member']["Mobile No Type"],
            mobilenno: element['Member']["Mobile No"],
            presentadd: element['Member']["Present Address"],
            parmaadd: element['Member']["Permanent Address"],
            livingperiod: element['Member']["Living Period"],
            nomaleearner: element['Member']["No Female Earner"],
            nofemaleearner: element['Member']["No Male Earner"],
            id: element.id,
            headfamily: element['Member']["Head Family"],
            ownhomestead: element['Member']["Own HomeStead"],
            relationwithhead: element['Member']["Relation With Head"],
            landdesc: element['Member']["Land Desc"],
            remarks: element['Member']["Remarks"],
            imageurl: element['Member']["ImageURL"],
            img: element['Member']["Image"],
            birthdate: element['Member']["Date Of Birth"].toDate(),
            sl: 0));
      }
    });
  }

  void _onclear() {
    setState(() {
      var ss;
      selectedmemberss = ss;
      mmems = false;
      selectedsamitee = ss;
    });
  }

  void _save() async {
    // if (selectedmemberss == null ||
    //     sanctionlimit.text == "" ||
    //     remarks.text == "") {
    //   Get.snackbar(
    //       "Balance Withdraw Request Failed.", "Some Required Fields are Empty",
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
    // } else {
    //   DocumentSnapshot ds = await FirebaseFirestore.instance
    //       .collection('BalanceAccount')
    //       .doc('0')
    //       .get();
    //   if (ds['Balance'] < double.parse(sanctionlimit.text)) {
    //     Get.snackbar(
    //         "Balance Withdraw Request Failed.", "Insufficient Balance in Cash!",
    //         snackPosition: SnackPosition.BOTTOM,
    //         colorText: Colors.white,
    //         backgroundColor: Colors.red,
    //         margin: EdgeInsets.zero,
    //         duration: const Duration(milliseconds: 2000),
    //         boxShadows: [
    //           const BoxShadow(
    //               color: Colors.grey, offset: Offset(-100, 0), blurRadius: 20),
    //         ],
    //         borderRadius: 0);
    //   } else {
    //     QuerySnapshot querySnapshot =
    //         await FirebaseFirestore.instance.collection('Cash Withdraw').get();
    //     FirebaseFirestore.instance.collection('Cash Withdraw').add({
    //       'Member Name': selectedmemberss.member['First Name'] +
    //           ' ' +
    //           selectedmemberss.member['Last Name'],
    //       'Member ID': memberid,
    //       "Requested By":
    //           "${AuthService.to.user!.id}-(*)-${AuthService.to.user!.name}",
    //       "Approved By": '',
    //       "SL": querySnapshot.docs.length + 1,
    //       "Approve": false,
    //       'Account No': selectedmemberss.id,
    //       'Withdraw Amount': double.parse(sanctionlimit.text),
    //       'Amount In Words': remarks.text,
    //       'Disbursed Amount': disburse,
    //       'Requested Date': DateTime.now(),
    //       'Approve Date': DateTime.now(),
    //       'Status': false,
    //       'Remarks': remarks.text,
    //     }).then((value) async {
    //       await FirebaseFirestore.instance
    //           .collection('BalanceAccount')
    //           .doc('0')
    //           .update({
    //         'Balance': FieldValue.increment(-double.parse(sanctionlimit.text)),
    //       });
    //       await FirebaseFirestore.instance
    //           .collection('Member')
    //           .doc(memberid)
    //           .update({
    //         'Loan Pending Amount':
    //             FieldValue.increment(-double.parse(sanctionlimit.text)),
    //       }).then((value) {
    //         Get.offNamed(cashwithdrawlistPageRoute);
    //         Get.snackbar("Cash Withdraw Successful.",
    //             "Redirecting to Cash Withdraw List Page.",
    //             snackPosition: SnackPosition.BOTTOM,
    //             colorText: Colors.white,
    //             backgroundColor: Colors.green,
    //             margin: EdgeInsets.zero,
    //             duration: const Duration(milliseconds: 2000),
    //             boxShadows: [
    //               const BoxShadow(
    //                   color: Colors.grey,
    //                   offset: Offset(-100, 0),
    //                   blurRadius: 20),
    //             ],
    //             borderRadius: 0);
    //       });
    //     });
    //   }
    // }
  }

  @override
  Widget build(BuildContext context) {
    var ScreenWidth = MediaQuery.of(context).size.width;
    var ScreenHeight = MediaQuery.of(context).size.height;

    Future<void> _selectDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _selectedDate ?? DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2101),
      );

      if (picked != null && picked != _selectedDate) {
        setState(() {
          _selectedDate = picked;
        });
      }
    }

    void _setuppeoductclass(int ins) {
      selectedpeoductclass = ProductClassList[ins];
    }
    Future<void> _startDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _starteDate ?? DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2101),
      );

      if (picked != null && picked != _starteDate) {
        setState(() {
          _starteDate = picked;
        });
      }
    }
    Future<void> _expireDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _expireeDate ?? DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2101),
      );

      if (picked != null && picked != _expireeDate) {
        setState(() {
          _expireeDate = picked;
        });
      }
    }


    Future<void> _setupmemberss(int ins) async {
      selectedmemberss = memberss[ins];
      await FirebaseFirestore.instance
          .collection('Somitee')
          .doc(selectedmemberss.somiteeid)
          .get()
          .then((element) {
        selectedsamitee = Somitee(
            address: element["Address"],
            id: element.id,
            lastupdated: element["Last Edited"].toDate(),
            name: element["Name"],
            active: element["Active"],
            closed: element["Closed"],
            formation: element["Formation Date"].toDate(),
            phone: element["Phone"],
            branch: element["Branch"],
            sl: 0);
        mmems = true;
        setState(() {});
      });
    }
    return Scaffold(
      appBar: Appbar(
        navbool: widget.appbool,
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: 100, left: 70),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    width: ScreenWidth / 1.097,
                    height:700,
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
                      // mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: ScreenWidth / 1.097,
                          color: navbarColor,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsets.only(left: ScreenWidth / 38.4),
                                child: Text(
                                  "Credit Limit Define",
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
                                  _save();
                                },
                                child: Container(
                                  height: ScreenWidth / 38.4,
                                  width: ScreenWidth / 17.07,
                                  color: Colors.green,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        top: ScreenWidth / 153.6,
                                        left: ScreenWidth / 102.4),
                                    child: Text(
                                      "✓ Submit",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: ScreenWidth / 109.71),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: ScreenWidth / 153.6,
                              ),
                              InkWell(
                                onTap: () {
                                  _onclear();
                                },
                                child: Container(
                                  height: ScreenWidth / 38.4,
                                  width: ScreenWidth / 17.07,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        top: ScreenWidth / 512,
                                        left: ScreenWidth / 102.4),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.clear_all_sharp,
                                          color: Colors.white,
                                          size: ScreenWidth / 85.33,
                                        ),
                                        SizedBox(
                                          width: ScreenWidth / 307.2,
                                        ),
                                        Text(
                                          "Clear",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: ScreenWidth / 109.71),
                                        ),
                                      ],
                                    ),
                                  ),
                                  color: AppColor_yellow,
                                ),
                              ),
                              SizedBox(
                                width: ScreenWidth / 153.6,
                              ),
                              InkWell(
                                onTap: () {
                                  Get.back();
                                },
                                child: Container(
                                  height: ScreenWidth / 38.4,
                                  width: ScreenWidth / 30.72,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        top: ScreenWidth / 153.6,
                                        left: ScreenWidth / 76.8),
                                    child: Text(
                                      "X",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: ScreenWidth / 109.71),
                                    ),
                                  ),
                                  color: Colors.red,
                                ),
                              ),
                              SizedBox(
                                width: ScreenWidth / 153.6,
                              ),
                            ],
                          ),
                        ),
                        Expanded(child: SizedBox()),
                        Container(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 10.0, left: 80, right: 50),
                            child: Row(
                              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.start,
                                  children: [

                                    Container(
                                      child: Row(
                                        children: [
                                          RichText(
                                            text: TextSpan(
                                              text: 'Agreement Date',
                                              style: TextStyle(
                                                  color: Colors.black, fontSize: ScreenWidth/109.71),
                                              children: <TextSpan>[
                                                TextSpan(
                                                    text: ' *',
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.bold,
                                                        color: Colors.red,
                                                        fontSize: ScreenWidth/109.71)),
                                                TextSpan(
                                                    text: ' :',
                                                    style: TextStyle(
                                                        color: Colors.black, fontSize: ScreenWidth/109.71)),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: 50,
                                          ),
                                          SizedBox(
                                            width: ScreenWidth/5.12,
                                            height: ScreenWidth/30.72,
                                            child: InkWell(
                                              onTap: () => _selectDate(context),
                                              child: AbsorbPointer(
                                                child: TextField(
                                                  decoration: InputDecoration(
                                                    filled: true,
                                                    fillColor: Colors.white,
                                                    border: OutlineInputBorder(
                                                      borderSide:
                                                      BorderSide(color: Colors.grey),
                                                    ),
                                                    hintText: _selectedDate != null
                                                        ? "${_selectedDate!.day}-${_selectedDate!.month}-${_selectedDate!.year}"
                                                        : "Select a date",
                                                    hintStyle: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: ScreenWidth/109.71,
                                                    ),
                                                    suffixIcon: Icon(
                                                        Icons.calendar_month_sharp, size: ScreenWidth/109.71,
                                                        color: Colors.grey),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        RichText(
                                          text: TextSpan(
                                            text: 'Start Date',
                                            style: TextStyle(
                                                color: Colors.black, fontSize: ScreenWidth/109.71),
                                            children: <TextSpan>[
                                              TextSpan(
                                                  text: ' *',
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.red,
                                                      fontSize: ScreenWidth/109.71)),
                                              TextSpan(
                                                  text: ' :',
                                                  style: TextStyle(
                                                      color: Colors.black, fontSize: ScreenWidth/109.71)),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: ScreenWidth/18.07,
                                        ),
                                        SizedBox(
                                          width: ScreenWidth/5.12,
                                          height: ScreenWidth/30.72,
                                          child: InkWell(
                                            onTap: () => _startDate(context),
                                            child: AbsorbPointer(
                                              child: TextField(
                                                decoration: InputDecoration(
                                                  filled: true,
                                                  fillColor: Colors.white,
                                                  border: OutlineInputBorder(
                                                    borderSide:
                                                    BorderSide(color: Colors.grey),
                                                  ),
                                                  hintText: _starteDate != null
                                                      ? "${_starteDate!.day}-${_starteDate!.month}-${_starteDate!.year}"
                                                      : "Select a date",
                                                  hintStyle: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: ScreenWidth/109.71,
                                                  ),
                                                  suffixIcon: Icon(
                                                      Icons.calendar_month_sharp, size: ScreenWidth/109.71,
                                                      color: Colors.grey),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),

                                    Row(
                                      children: [
                                        RichText(
                                          text: const TextSpan(
                                            text: 'Select Customer',
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
                                          width: 45,
                                        ),
                                        Container(
                                            width: 300,
                                            padding: EdgeInsets.symmetric(horizontal: 20),
                                            decoration: BoxDecoration(
                                              color: AppColor_greyBorder,
                                              border: Border.all(color: AppColor_Black),
                                            ),
                                            child: DropdownSearch<Memberss>(
                                              filterFn: (Memberss item, String query) {
                                                return item.filterFn(query);
                                              },
                                              popupProps: PopupProps.menu(
                                                showSearchBox: true,
                                                itemBuilder: (BuildContext context,
                                                    Memberss item, bool isSelected) {
                                                  return Container(
                                                    padding: EdgeInsets.all(15),
                                                    child: Text(
                                                      "${item.firstname} ${item.lastname} - ${item.id}",
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
                                                    "${item.firstname} ${item.lastname} - ${item.id}",
                                                  );
                                                }
                                              },
                                              onChanged: (newValue) {
                                                setState(() {
                                                  selectedmemberss = newValue;
                                                  _setupmemberss(
                                                      memberss.indexOf(newValue!));
                                                });
                                              },
                                              items: memberss,
                                              selectedItem: selectedmemberss,
                                            )),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),

                                    Row(
                                      children: [
                                        RichText(
                                          text: const TextSpan(
                                            text: 'Select Product Class',
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
                                          width: 18,
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
                                                    "Enter Product Class",
                                                  );
                                                } else {
                                                  return Text(
                                                    item,
                                                  );
                                                }
                                              },
                                              onChanged: (newValue) {
                                                setState(() {
                                                  selectedpeoductclass = newValue;
                                                  _setuppeoductclass(
                                                      ProductClassList.indexOf(newValue!));
                                                });
                                              },
                                              items: ProductClassList,
                                              selectedItem: selectedpeoductclass,
                                            )),
                                      ],
                                    ),

                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Sanctin Limit :",
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.black,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 70,
                                        ),
                                        SizedBox(
                                          width: 300,
                                          child: TextField(
                                            style:
                                            const TextStyle(fontSize: 16),
                                            controller: sanctionlimit,
                                            keyboardType: TextInputType.number,
                                            inputFormatters: [
                                              FilteringTextInputFormatter
                                                  .digitsOnly
                                            ],
                                            decoration: const InputDecoration(
                                              border: OutlineInputBorder(),
                                              contentPadding:
                                              EdgeInsets.symmetric(
                                                  vertical: 2,
                                                  horizontal: 5),
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
                                          "Remarks :",
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.black,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 100,
                                        ),
                                        SizedBox(
                                          width: 300,
                                          child: TextField(
                                            controller: remarks,
                                            style: TextStyle(fontSize: 16),
                                            decoration: const InputDecoration(
                                              border: OutlineInputBorder(),
                                              contentPadding:
                                              EdgeInsets.symmetric(
                                                  vertical: 2,
                                                  horizontal: 5),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 25,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Minimum Limit: ",
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
                                            "",
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
                                          "Term Period: ",
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
                                            "",
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Interest Rate: ",
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
                                            "",
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "IDGP: ",
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
                                            "",
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
                                          "Employee ID: ",
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
                                            "",
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 20,),
                                    Row(
                                      children: [
                                        RichText(
                                          text: TextSpan(
                                            text: 'Expire Date',
                                            style: TextStyle(
                                                color: Colors.black, fontSize: ScreenWidth/109.71),
                                            children: <TextSpan>[
                                              TextSpan(
                                                  text: ' *',
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.red,
                                                      fontSize: ScreenWidth/109.71)),
                                              TextSpan(
                                                  text: ' :',
                                                  style: TextStyle(
                                                      color: Colors.black, fontSize: ScreenWidth/109.71)),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 110,
                                        ),
                                        SizedBox(
                                          width: ScreenWidth/5.12,
                                          height: ScreenWidth/30.72,
                                          child: InkWell(
                                            onTap: () => _expireDate(context),
                                            child: AbsorbPointer(
                                              child: TextField(
                                                decoration: InputDecoration(
                                                  filled: true,
                                                  fillColor: Colors.white,
                                                  border: OutlineInputBorder(
                                                    borderSide:
                                                    BorderSide(color: Colors.grey),
                                                  ),
                                                  hintText: _expireeDate != null
                                                      ? "${_expireeDate!.day}-${_expireeDate!.month}-${_expireeDate!.year}"
                                                      : "Select a date",
                                                  hintStyle: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: ScreenWidth/109.71,
                                                  ),
                                                  suffixIcon: Icon(
                                                      Icons.calendar_month_sharp, size: ScreenWidth/109.71,
                                                      color: Colors.grey),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 50,
                                    ),
                                    Row(
                                      children: [
                                        const Text(
                                          "Customer Name: ",
                                          style: TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 30,
                                        ),
                                        SizedBox(
                                          width: 300,
                                          child: Text(
                                            mmems
                                                ? selectedmemberss.member['First Name'] + ' '+ selectedmemberss.member['Last Name']
                                                : "",
                                          ),
                                        ),
                                        SizedBox(
                                          width: 25,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        RichText(
                                          text: const TextSpan(
                                            text: 'Select Product Code',
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
                                          width: 60,
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
                                                    "Enter Product Code",
                                                  );
                                                } else {
                                                  return Text(
                                                    item,
                                                  );
                                                }
                                              },
                                              onChanged: (newValue) {
                                                setState(() {
                                                  selectedpeoductccode = newValue;
                                                });
                                              },
                                              items: ["L09-SME-3"],
                                              selectedItem: selectedpeoductccode,
                                            )),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        const Text(
                                          "Sanction Ref :",
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.black,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 110,
                                        ),
                                        SizedBox(
                                          width: 300,
                                          child: TextField(
                                            controller: sanctionref,
                                            style:
                                                const TextStyle(fontSize: 16),
                                            decoration: InputDecoration(
                                              border:
                                                  const OutlineInputBorder(),
                                              contentPadding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 2,
                                                      horizontal: 5),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 25,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Security Value :",
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.black,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 100,
                                        ),
                                        SizedBox(
                                          width: 300,
                                          child: TextField(
                                            style:
                                            const TextStyle(fontSize: 16),
                                            controller: securityvalue,
                                            keyboardType: TextInputType.number,
                                            inputFormatters: [
                                              FilteringTextInputFormatter
                                                  .digitsOnly
                                            ],
                                            decoration: const InputDecoration(
                                              border: OutlineInputBorder(),
                                              contentPadding:
                                              EdgeInsets.symmetric(
                                                  vertical: 2,
                                                  horizontal: 5),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Maximum Limit: ",
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
                                            "",
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        RichText(
                                          text: const TextSpan(
                                            text: 'Select Installment Frequency',
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
                                                    "Enter Installment Frequency",
                                                  );
                                                } else {
                                                  return Text(
                                                    item,
                                                  );
                                                }
                                              },
                                              onChanged: (newValue) {
                                                setState(() {
                                                  installmentfreequency = newValue;
                                                });
                                              },
                                              items: InstallmentFrequencyList,
                                              selectedItem: installmentfreequency,
                                            )),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Grace Period: ",
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
                                            "",
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(child: SizedBox()),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
            NavbarScreenCBS(
              appbool: widget.appbool,
              navbool: widget.navbool,
            ),
          ],
        ),
      ),
    );
  }
}
