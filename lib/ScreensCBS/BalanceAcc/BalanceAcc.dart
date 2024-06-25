import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:prottashasomit/route.dart';
import '../../../../Constants/Constants.dart';
import '../../Constants/values.dart';
import '../../ScreensMFS/Widget/Appbar.dart';
import '../../ScreensMFS/Widget/Appbool.dart';
import '../Widgets/NavBoolCBS.dart';
import '../Widgets/NavbarScreenCBS.dart';

class AccountScreen extends StatefulWidget {
  NavboolCBS navbool;
  Appbool appbool;

  AccountScreen({required this.appbool, required this.navbool});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  var accountno = TextEditingController();
  var accounttitle = TextEditingController();
  var amount = TextEditingController();
  List<Map> _account = [];
  Future<void> fetch() async {
    _account = [];
    int i = 0;
    await FirebaseFirestore.instance.collection('BalanceAccount').get().then((que) {
      for (var ele in que.docs) {
        i++;
        _account.add({
          'Account Title': ele['Account Title'],
          'Balance': ele['Balance'],
          'Account No': ele['Account No'],
          'sl': i,
        });
      }
      setState(() {});
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetch();
  }

  @override
  Widget build(BuildContext context) {
    _clear() {
      accountno.text = '';
      accounttitle.text = '';
      amount.text = '';
      setState(() {});
    }

    return Scaffold(
      appBar: Appbar(
        navbool: widget.appbool,
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: 100, right: 30, left: 30),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 10,
                    child: Container(
                      height: 400,
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
                            height: 40,
                            color: navbarColor,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(left: 40.0),
                                  child: Text(
                                    "Add New Account",
                                    style: TextStyle(
                                      color: AppColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                Spacer(),
                                InkWell(
                                  onTap: () async {
                                    if (accountno.text.isEmpty || accounttitle.text.isEmpty || amount.text.isEmpty) {
                                      Get.snackbar("Account Adding Failed.", "Some Required Fields are Empty",
                                          snackPosition: SnackPosition.BOTTOM,
                                          colorText: Colors.white,
                                          backgroundColor: Colors.red,
                                          margin: EdgeInsets.zero,
                                          duration: const Duration(milliseconds: 2000),
                                          boxShadows: [
                                            BoxShadow(color: Colors.grey, offset: Offset(-100, 0), blurRadius: 20),
                                          ],
                                          borderRadius: 0);
                                    } else {
                                      DocumentSnapshot querySnapshot = await FirebaseFirestore.instance.collection('BalanceAccount').doc(accountno.text).get();
                                      if (!querySnapshot.exists) {
                                        FirebaseFirestore.instance.collection('BalanceAccount').doc(accountno.text).set({
                                          'Account Title': accounttitle.text,
                                          'Balance': double.parse(amount.text.toString()),
                                          'Account No': accountno.text,
                                        }).then((value) async {
                                          fetch();
                                          _clear();
                                          Get.snackbar("Open Close Updated Successfully.", "Refreshing the Page.",
                                              snackPosition: SnackPosition.BOTTOM,
                                              colorText: Colors.white,
                                              backgroundColor: Colors.green,
                                              margin: EdgeInsets.zero,
                                              duration: const Duration(milliseconds: 2000),
                                              boxShadows: [
                                                const BoxShadow(color: Colors.grey, offset: Offset(-100, 0), blurRadius: 20),
                                              ],
                                              borderRadius: 0);
                                        });
                                      } else {
                                        Get.snackbar("Account Adding Failed.", "Account Number already exists",
                                            snackPosition: SnackPosition.BOTTOM,
                                            colorText: Colors.white,
                                            backgroundColor: Colors.red,
                                            margin: EdgeInsets.zero,
                                            duration: const Duration(milliseconds: 2000),
                                            boxShadows: [
                                              BoxShadow(color: Colors.grey, offset: Offset(-100, 0), blurRadius: 20),
                                            ],
                                            borderRadius: 0);
                                      }
                                    }
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 90,
                                    color: Colors.green,
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 10.0, left: 15),
                                      child: Text(
                                        "✓ Submit",
                                        style: TextStyle(color: Colors.white, fontSize: 14),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                InkWell(
                                  onTap: () {
                                    _clear();
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 90,
                                    color: AppColor_yellow,
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 3.0, left: 15),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.clear_all_sharp,
                                            color: Colors.white,
                                            size: 18,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            "Clear",
                                            style: TextStyle(color: Colors.white, fontSize: 14),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                              ],
                            ),
                          ),
                          Container(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 25,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      RichText(
                                        text: const TextSpan(
                                          text: 'Account Title',
                                          style: TextStyle(color: Colors.black, fontSize: 14),
                                          children: <TextSpan>[
                                            TextSpan(text: ' *', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red, fontSize: 14)),
                                            TextSpan(text: ' :', style: TextStyle(color: Colors.black, fontSize: 14)),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 100,
                                      ),
                                      SizedBox(
                                        width: 300,
                                        child: TextField(
                                          controller: accounttitle,
                                          decoration: const InputDecoration(
                                            border: OutlineInputBorder(),
                                            contentPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      RichText(
                                        text: const TextSpan(
                                          text: 'Account No',
                                          style: TextStyle(color: Colors.black, fontSize: 14),
                                          children: <TextSpan>[
                                            TextSpan(text: ' *', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red, fontSize: 14)),
                                            TextSpan(text: ' :', style: TextStyle(color: Colors.black, fontSize: 14)),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 110,
                                      ),
                                      SizedBox(
                                        width: 300,
                                        child: TextField(
                                          controller: accountno,
                                          keyboardType: TextInputType.number,
                                          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                          decoration: const InputDecoration(
                                            border: OutlineInputBorder(),
                                            contentPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      RichText(
                                        text: const TextSpan(
                                          text: 'Balance',
                                          style: TextStyle(color: Colors.black, fontSize: 14),
                                          children: <TextSpan>[
                                            TextSpan(text: ' *', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red, fontSize: 14)),
                                            TextSpan(text: ' :', style: TextStyle(color: Colors.black, fontSize: 14)),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 130,
                                      ),
                                      SizedBox(
                                        width: 300,
                                        child: TextField(
                                          controller: amount,
                                          keyboardType: TextInputType.number,
                                          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                          decoration: const InputDecoration(
                                            border: OutlineInputBorder(),
                                            contentPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Expanded(
                    flex: 8,
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
                            height: 40,
                            color: navbarColor,
                            child: const Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 40.0),
                                  child: Text(
                                    "All Account List",
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
                          const SizedBox(
                            height: 25,
                          ),
                          MediaQuery.removePadding(
                            context: context,
                            removeTop: true,
                            child: DataTable(
                              showCheckboxColumn: false,
                              border: TableBorder.all(color: Colors.black26, width: 1),
                              headingRowColor: MaterialStateProperty.all<Color>(AppColor_Blue),
                              columns: const [
                                DataColumn(
                                  label: Text(
                                    'SL',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    'Account No',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    'Account Title',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                DataColumn(
                                  label: Text('Balance',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      )),
                                ),
                              ],
                              rows: [
                                for (var ele in _account)
                                  DataRow(
                                    cells: [
                                      DataCell(Text(ele["sl"].toString(),
                                          style: const TextStyle(
                                            fontSize: 12,
                                          ))),
                                      DataCell(Text(ele["Account No"],
                                          style: const TextStyle(
                                            fontSize: 12,
                                          ))),
                                      DataCell(
                                        Text(ele["Account Title"],
                                            style: const TextStyle(
                                              fontSize: 12,
                                            )),
                                      ),
                                      DataCell(Text(ele["Balance"].toStringAsFixed(1),
                                          textAlign: TextAlign.end,
                                          style: const TextStyle(
                                            fontSize: 12,
                                          ))),
                                    ],
                                  )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                        ],
                      ),
                    ),
                  )
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
