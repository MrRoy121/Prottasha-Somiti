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

class CashWithdraw extends StatefulWidget {
  NavboolCBS navbool;
  Appbool appbool;

  CashWithdraw({required this.appbool, required this.navbool});

  @override
  State<CashWithdraw> createState() => _CashWithdrawState();
}

class _CashWithdrawState extends State<CashWithdraw> {
  List<Accountss> memberss = [];
  var selectedaccount;
  var sselectedmemberss;
  DateTime selectedDate = DateTime.now();
  var selectedsamitee;
  double disburse = 0;
  var chequeseries = TextEditingController();
  var withdrawamount = TextEditingController();
  var chequeno = TextEditingController();
  var amountinwords = TextEditingController();
  var remarks = TextEditingController(text: "Cash Withdraw");
  var selectedcustomertype;

  bool mmems = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetch();
  }

  Future<void> fetch() async {
    int s = 0;
    await FirebaseFirestore.instance
        .collection('Account')
        .get()
        .then((querySnapshot) {
      for (var element in querySnapshot.docs) {
        memberss.add(Accountss(
            introducertype: element["Introducer Type"],
            member: element["Member"],
            introducerno: element["Introducer No"],
            nomineename: element["Nominee Name"],
            nomineepercentage: element["Nominee Percentage"],
            accounttype: element["Account Type"],
            nomineeimage: element["Nominee Image"],
            relation: element["Relation"],
            introducername: element["Introducer Name"],
            requestdate: element["Request Date"].toDate(),
            requestedby: element["Requested By"],
            approvedby: element["Approve By"],
            sector: element["Sector"],
            documenttype: element["Document Type"],
            fathername: element["Father Name"],
            documentno: element["Document No"],
            docmentfront: element["Document Front"],
            documentback: element["Document Back"],
            dateofbirth: element["Date Of Birth"].toDate(),
            mothername: element["Mother Name"],
            id: element.id,
            approvedate: element["Approve Date"].toDate(),
            status: element["Status"],
            approve: element["Approve"],
            sl: s));
        s++;
      }
    });
  }

  void _onclear() {
    setState(() {
      var ss;
      selectedaccount = ss;
      mmems = false;
      selectedsamitee = ss;
    });
  }

  void _save() async {
    if (selectedaccount == null ||
        chequeno.text == "" ||
        chequeseries.text == "" ||
        withdrawamount.text == "" ||
        amountinwords.text == "") {
      Get.snackbar(
          "Balance Withdraw Request Failed.", "Some Required Fields are Empty",
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          backgroundColor: Colors.red,
          margin: EdgeInsets.zero,
          duration: const Duration(milliseconds: 2000),
          boxShadows: [
            const BoxShadow(
                color: Colors.grey, offset: Offset(-100, 0), blurRadius: 20),
          ],
          borderRadius: 0);
    } else {
      FirebaseFirestore.instance.collection('Cash Withdraw').add({
        'Member Name': selectedaccount.member['First Name'] +
            ' ' +
            selectedaccount.member['Last Name'],
        'Member ID': selectedaccount.member['ID'],
        "Requested By":
            "${AuthService.to.user!.id}-(*)-${AuthService.to.user!.name}",
        "Approved By": '',
        "Approve": false,
        "Cheque No": chequeno.text,
        'Cheque Series': chequeseries.text,
        'Withdraw Amount': double.parse(withdrawamount.text),
        'Amount In Words': amountinwords.text,
        'Disbursed Amount': disburse,
        'Requested Date': DateTime.now(),
        'Cheque Date': selectedDate,
        'Approve Date': DateTime.now(),
        'Status': false,
        'Remarks': remarks.text,
      }).then((value) async {
        await FirebaseFirestore.instance
            .collection('Member')
            .doc(selectedaccount.member['ID'])
            .update({
          'Loan Pending Amount':
              FieldValue.increment(-double.parse(withdrawamount.text)),
        }).then((value) {
       //   Get.offNamed(loandisbursementlistPageRoute);
          Get.snackbar("Cash Withdraw Successful.",
              "Redirecting to Cash Withdraw List Page.",
              snackPosition: SnackPosition.BOTTOM,
              colorText: Colors.white,
              backgroundColor: Colors.green,
              margin: EdgeInsets.zero,
              duration: const Duration(milliseconds: 2000),
              boxShadows: [
                const BoxShadow(
                    color: Colors.grey,
                    offset: Offset(-100, 0),
                    blurRadius: 20),
              ],
              borderRadius: 0);
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var ScreenWidth = MediaQuery.of(context).size.width;
    var ScreenHeight = MediaQuery.of(context).size.height;

    double ResponsiveWidth = MediaQuery.of(context as BuildContext).size.width;
    double ResponsiveHeight =
        MediaQuery.of(context as BuildContext).size.height;

    Future<void> _selectDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate ?? DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2101),
      );

      if (picked != null && picked != selectedDate) {
        setState(() {
          selectedDate = picked;
        });
      }
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
                    height: ScreenHeight / 1.5,
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
                                  "Cash Withdraw",
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
                                top: 20.0, left: 80, right: 50),
                            child: Row(
                              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Row(
                                      children: [
                                        RichText(
                                          text: const TextSpan(
                                            text: 'Select Account No',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14),
                                            children: <TextSpan>[
                                              TextSpan(
                                                  text: ' *',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
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
                                        const SizedBox(
                                          width: 40,
                                        ),
                                        Container(
                                            width: 300,
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20),
                                            decoration: BoxDecoration(
                                              color: AppColor_greyBorder,
                                              border: Border.all(
                                                  color: AppColor_Black),
                                            ),
                                            child: DropdownSearch<Accountss>(
                                              popupProps: PopupProps.menu(
                                                showSearchBox: true,
                                                itemBuilder:
                                                    (BuildContext context,
                                                        Accountss item,
                                                        bool isSelected) {
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
                                                searchFieldProps:
                                                    const TextFieldProps(
                                                  style:
                                                      TextStyle(fontSize: 12),
                                                  decoration: InputDecoration(
                                                    isDense: true,
                                                    hintText: "Search...",
                                                  ),
                                                ),
                                              ),
                                              dropdownDecoratorProps:
                                                  const DropDownDecoratorProps(
                                                dropdownSearchDecoration:
                                                    InputDecoration(
                                                  enabledBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent),
                                                  ),
                                                  focusedBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent),
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
                                                selectedaccount = newValue;
                                                mmems = true;
                                                await FirebaseFirestore.instance
                                                    .collection('Member')
                                                    .doc(selectedaccount
                                                        .member['ID'])
                                                    .get()
                                                    .then((firstDocument) {
                                                  setState(() {
                                                    disburse = firstDocument[
                                                        "Loan Pending Amount"];
                                                  });
                                                });
                                              },
                                              items: memberss,
                                              selectedItem: selectedaccount,
                                            )),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Account Type: ",
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
                                            mmems
                                                ? selectedaccount.accounttype
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
                                          "Customer Name: ",
                                          style: TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 60,
                                        ),
                                        SizedBox(
                                          width: 300,
                                          child: Text(
                                            mmems
                                                ? selectedaccount
                                                        .member['First Name'] +
                                                    ' ' +
                                                    selectedaccount
                                                        .member['Last Name']
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
                                          "Cheque Series :",
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
                                            controller: chequeseries,
                                            style:
                                                const TextStyle(fontSize: 16),
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
                                        const Text(
                                          "Cheque Date :",
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.black,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 80,
                                        ),
                                        SizedBox(
                                          width: 300,
                                          child: InkWell(
                                            onTap: () => _selectDate(context),
                                            child: AbsorbPointer(
                                              child: TextField(
                                                decoration: InputDecoration(
                                                  filled: true,
                                                  fillColor: Colors.white,
                                                  border:
                                                      const OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.grey),
                                                  ),
                                                  hintText: selectedDate != null
                                                      ? "${selectedDate.day}-${selectedDate.month}-${selectedDate.year}"
                                                      : "Select a date",
                                                  hintStyle: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize:
                                                        ScreenWidth / 109.71,
                                                  ),
                                                  suffixIcon: Icon(
                                                      Icons
                                                          .calendar_month_sharp,
                                                      size:
                                                          ScreenWidth / 109.71,
                                                      color: Colors.grey),
                                                ),
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
                                          "Current Balance :",
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.black,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 60,
                                        ),
                                        SizedBox(
                                          width: 300,
                                          child: Text(
                                            mmems
                                                ? disburse.toStringAsFixed(2)
                                                : '',
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
                                          "Withdraw Amount :",
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.black,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 45,
                                        ),
                                        SizedBox(
                                          width: 300,
                                          child: TextField(
                                            style:
                                                const TextStyle(fontSize: 16),
                                            controller: withdrawamount,
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
                                  ],
                                ),
                                SizedBox(
                                  width: 250,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "Customer ID: ",
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
                                                ? selectedaccount.member['ID']
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
                                        Text(
                                          "Mobile No: ",
                                          style: TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 43,
                                        ),
                                        SizedBox(
                                          width: 300,
                                          child: Text(
                                            mmems
                                                ? selectedaccount
                                                    .member['Mobile No']
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
                                        Text(
                                          "Cheque No :",
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.black,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 35,
                                        ),
                                        SizedBox(
                                          width: 300,
                                          child: TextField(
                                            controller: chequeno,
                                            style:
                                                const TextStyle(fontSize: 16),
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
                                          "Remarks :",
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.black,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 50,
                                        ),
                                        SizedBox(
                                          width: 300,
                                          child: TextField(
                                            controller: remarks,
                                            textAlign: TextAlign.center,
                                            style:
                                                const TextStyle(fontSize: 16),
                                            decoration: InputDecoration(
                                              filled: true,
                                              fillColor: Colors.grey[400],
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
                                      height: 120,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Amount In Words :",
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.black,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        SizedBox(
                                          width: 300,
                                          child: TextField(
                                            controller: amountinwords,
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
