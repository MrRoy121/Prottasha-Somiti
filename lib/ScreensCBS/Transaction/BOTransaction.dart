import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:flutter/services.dart';
import '../../../../Constants/Constants.dart';
import '../../../../Constants/values.dart';
import '../../../../route.dart';
import '../../Model/balanceaccount.dart';
import '../../helpers/auth_service.dart';
import '../Widgets/BasicInfoWidget.dart';
import '../Widgets/NavBoolCBS.dart';
import '../Widgets/NavbarScreenCBS.dart';
import '../../ScreensMFS/Widget/Appbar.dart';
import '../../ScreensMFS/Widget/Appbool.dart';

class BOTransaction extends StatefulWidget {
  NavboolCBS navbool;
  Appbool appbool;
  BOTransaction({required this.appbool, required this.navbool});

  @override
  State<BOTransaction> createState() => _BOTransactionState();
}

class _BOTransactionState extends State<BOTransaction> {
  var selectedtype = 'Transfer';
  var selectednature;
  var selectedentrytype;
  var selectedbranch;
  List<BalanceAccount> memberss = [];
  var selectedaccountdebit;
  var selectedaccountcredit;
  var amount = TextEditingController();
  var remarksdebit = TextEditingController();
  var remarkscredit = TextEditingController();
  bool mmemsdr = false;
  bool mmemscr = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetch();
  }

  Future<void> fetch() async {

    await FirebaseFirestore.instance
        .collection('BalanceAccount')
        .get()
        .then((que) {
      for (var ele in que.docs) {
        memberss.add(BalanceAccount(accountnum: ele['Account No'], accounttile: ele['Account Title'], balance: ele['Balance']));
      }
    });
  }

  void _onclear() {
    setState(() {
    });
  }

  void _save() async {
    if (selectedtype == null ||
        selectedaccountcredit == null ||
        selectedaccountdebit == '' ||
        selectedbranch == null ||
        selectednature == null ||
        selectedentrytype == null ||
        amount.text.isEmpty) {
      Get.snackbar(
          "BO Transaction Request Failed.", "Some Required  Fields are Empty",
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          backgroundColor: Colors.red,
          margin: EdgeInsets.zero,
          duration: const Duration(milliseconds: 2000),
          boxShadows: [
            BoxShadow(
                color: Colors.grey, offset: Offset(-100, 0), blurRadius: 20),
          ],
          borderRadius: 0);
    } else {
      if(selectedaccountdebit.balance<double.parse(amount.text)){
        Get.snackbar(
            "BO Transaction Request Failed.", "Insufficient Balance in Debit Account!",
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
      }else{
        FirebaseFirestore.instance.collection('BO Transaction').add({
          "Requested By":
          "${AuthService.to.user!.id}-(*)-${AuthService.to.user!.name}",
          "Approved By": '',
          'Request Date': DateTime.now(),
          'Approve Date': DateTime.now(),
          'Type': selectedtype,
          'Credit Account ID': selectedaccountcredit.accountnum=='N/A'?'0':selectedaccountcredit.accountnum,
          'Debit Account ID': selectedaccountdebit.accountnum=='N/A'?'0':selectedaccountdebit.accountnum,
          'Credit Account': selectedaccountcredit.accounttile,
          'Debit Account': selectedaccountdebit.accounttile,
          'Branch': selectedbranch,
          'Nature': selectednature,
          'Entry Type': selectedentrytype,
          'Amount': double.parse(amount.text),
          'Credit Remarks': remarkscredit.text,
          'Debit Remarks': remarksdebit.text,
          "Approve": false,
          'Status': false,
        }).then((value) async {
          Get.offNamed(botransfertransactionlistPageRoute);
          Get.snackbar("BO Transaction Request Added Successfully.",
              "Redirecting to BO Transaction List Page.",
              snackPosition: SnackPosition.BOTTOM,
              colorText: Colors.white,
              backgroundColor: Colors.green,
              margin: EdgeInsets.zero,
              duration: const Duration(milliseconds: 2000),
              boxShadows: [
                const BoxShadow(
                    color: Colors.grey, offset: Offset(-100, 0), blurRadius: 20),
              ],
              borderRadius: 0);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var ScreenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: Appbar(
        navbool: widget.appbool,
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: 120, left: 50),
              child: Column(
                children: [
                  BasicInfoWidget(
                    title: 'BO Transfer Transaction',
                    onsubmit: _save,
                    onduplecate: () {},
                    onclear: _onclear,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    width: ScreenWidth / 1.097,
                    height: 200,
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
                          width: ScreenWidth / 1.097,
                          color: navbarColor,
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: ScreenWidth / 38.4, top: 10, bottom: 10),
                            child: Text(
                              "Cash Withdraw",
                              style: TextStyle(
                                color: AppColor,
                                fontWeight: FontWeight.bold,
                                fontSize: ScreenWidth / 96,
                              ),
                            ),
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
                                        SizedBox(width: 200),
                                        Row(
                                          children: [
                                            Radio(
                                              value: 'Transfer',
                                              groupValue: selectedtype,
                                              onChanged: (value) {
                                                setState(() {
                                                  selectedtype =
                                                      value.toString();
                                                });
                                              },
                                            ),
                                            Text(
                                              'Transfer',
                                              style: TextStyle(
                                                  fontSize:
                                                      ScreenWidth / 109.71),
                                            ),
                                            SizedBox(
                                                width: ScreenWidth / 153.6),
                                            Radio(
                                              value: 'Cash',
                                              groupValue: selectedtype,
                                              onChanged: (value) {
                                                setState(() {
                                                  selectedtype =
                                                      value.toString();
                                                });
                                              },
                                            ),
                                            Text(
                                              'Cash',
                                              style: TextStyle(
                                                  fontSize:
                                                      ScreenWidth / 109.71),
                                            ),
                                          ],
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
                                            text: 'Transaction Nature',
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
                                            child: DropdownSearch<String>(
                                              popupProps: PopupProps.menu(
                                                showSearchBox: true,
                                                itemBuilder:
                                                    (BuildContext context,
                                                        String item,
                                                        bool isSelected) {
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
                                                    "Enter Transaction Nature",
                                                  );
                                                } else {
                                                  return Text(
                                                    item,
                                                  );
                                                }
                                              },
                                              onChanged: (newValue) async {
                                                setState(() {
                                                  selectednature = newValue;
                                                });
                                              },
                                              items: TransactionNatureList,
                                              selectedItem: selectednature,
                                            )),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
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
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        RichText(
                                          text: const TextSpan(
                                            text: 'Transaction Entry Type',
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
                                            child: DropdownSearch<String>(
                                              popupProps: PopupProps.menu(
                                                showSearchBox: true,
                                                itemBuilder:
                                                    (BuildContext context,
                                                        String item,
                                                        bool isSelected) {
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
                                                    "Enter Transaction Nature",
                                                  );
                                                } else {
                                                  return Text(
                                                    item,
                                                  );
                                                }
                                              },
                                              onChanged: (newValue) async {
                                                selectedentrytype = newValue;
                                                setState(() {

                                                });
                                              },
                                              items: TransactionentrytypeList,
                                              selectedItem: selectedentrytype,
                                            )),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
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
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    width: ScreenWidth / 1.097,
                    height: 300,
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
                          width: ScreenWidth / 1.097,
                          color: navbarColor,
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: ScreenWidth / 38.4, top: 10, bottom: 10),
                            child: Text(
                              "Debit AC Information",
                              style: TextStyle(
                                color: AppColor,
                                fontWeight: FontWeight.bold,
                                fontSize: ScreenWidth / 96,
                              ),
                            ),
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
                                            text: 'Branch Name',
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
                                          width: 70,
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
                                            child: DropdownSearch<String>(
                                              popupProps: PopupProps.menu(
                                                showSearchBox: true,
                                                itemBuilder:
                                                    (BuildContext context,
                                                        String item,
                                                        bool isSelected) {
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
                                                    "Enter Branch",
                                                  );
                                                } else {
                                                  return Text(
                                                    item,
                                                  );
                                                }
                                              },
                                              onChanged: (newValue) async {
                                                selectedbranch = newValue;
                                                setState(() {

                                                });
                                              },
                                              items: [
                                                "5200 - Sunamgonj Sadar."
                                              ],
                                              selectedItem: selectedbranch,
                                            )),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        const Text(
                                          "Account Title: ",
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
                                            mmemsdr
                                                ? selectedaccountdebit.
                                            accounttile
                                                : "",
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        const Text(
                                          "Amount :",
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
                                            style:
                                                const TextStyle(fontSize: 16),
                                            controller: amount,
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
                                    SizedBox(
                                      height: 20,
                                    ),
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
                                          width: 20,
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
                                            child: DropdownSearch<BalanceAccount>(
                                              popupProps: PopupProps.menu(
                                                showSearchBox: true,
                                                itemBuilder:
                                                    (BuildContext context,
                                                        BalanceAccount item,
                                                        bool isSelected) {
                                                  return Container(
                                                    padding: EdgeInsets.all(15),
                                                    child: Text(
                                                      item.accountnum+'-'+ item.accounttile,
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
                                                    item.accountnum+'-'+ item.accounttile,
                                                  );
                                                }
                                              },
                                              onChanged: (newValue) async {
                                                selectedaccountdebit =
                                                    newValue;
                                                mmemsdr = true;
                                                setState(() {
                                                });
                                              },
                                              items: memberss,
                                              selectedItem:
                                                  selectedaccountdebit,
                                            )),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        const Text(
                                          "Balance: ",
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
                                            mmemsdr
                                                ? selectedaccountdebit.
                                            balance.toString()
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
                                          "Remarks :",
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.black,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 90,
                                        ),
                                        SizedBox(
                                          width: 300,
                                          child: TextField(
                                            controller: remarksdebit,
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
                                      height: 20,
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
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    width: ScreenWidth / 1.097,
                    height: 300,
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
                          width: ScreenWidth / 1.097,
                          color: navbarColor,
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: ScreenWidth / 38.4, top: 10, bottom: 10),
                            child: Text(
                              "Credit AC Information",
                              style: TextStyle(
                                color: AppColor,
                                fontWeight: FontWeight.bold,
                                fontSize: ScreenWidth / 96,
                              ),
                            ),
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
                                            text: 'Branch Name',
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
                                          width: 70,
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
                                            child: DropdownSearch<String>(
                                              popupProps: PopupProps.menu(
                                                showSearchBox: true,
                                                itemBuilder:
                                                    (BuildContext context,
                                                        String item,
                                                        bool isSelected) {
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
                                                    "Enter Branch",
                                                  );
                                                } else {
                                                  return Text(
                                                    item,
                                                  );
                                                }
                                              },
                                              onChanged: (newValue) async {
                                                selectedbranch = newValue;
                                                setState(() {

                                                });
                                              },
                                              items: [
                                                "5200 - Sunamgonj Sadar."
                                              ],
                                              selectedItem: selectedbranch,
                                            )),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        const Text(
                                          "Account Title: ",
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
                                            mmemscr
                                                ? selectedaccountcredit
                                                        .accounttile
                                                : "",
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
                                          "Amount :",
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
                                            style:
                                                const TextStyle(fontSize: 16),
                                            controller: amount,
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
                                    SizedBox(
                                      height: 20,
                                    ),
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
                                          width: 20,
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
                                            child: DropdownSearch<BalanceAccount>(
                                              popupProps: PopupProps.menu(
                                                showSearchBox: true,
                                                itemBuilder:
                                                    (BuildContext context,
                                                        BalanceAccount item,
                                                        bool isSelected) {
                                                  return Container(
                                                    padding: EdgeInsets.all(15),
                                                    child: Text(
                                                      item.accountnum+'-'+ item.accounttile,
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
                                                    item.accountnum+'-'+ item.accounttile,
                                                  );
                                                }
                                              },
                                              onChanged: (newValue) async {
                                                setState(() {
                                                  selectedaccountcredit =
                                                      newValue;
                                                  mmemscr = true;
                                                });
                                              },
                                              items: memberss,
                                              selectedItem:
                                                  selectedaccountcredit,
                                            )),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        const Text(
                                          "Balance: ",
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
                                            mmemscr
                                                ? selectedaccountcredit.
                                            balance.toString()
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
                                          "Remarks :",
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.black,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 90,
                                        ),
                                        SizedBox(
                                          width: 300,
                                          child: TextField(
                                            controller: remarkscredit,
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
                                      height: 20,
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
