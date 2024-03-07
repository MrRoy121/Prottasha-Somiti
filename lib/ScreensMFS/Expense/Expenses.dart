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
import '../Widget/NavBoolMFS.dart';
import '../Widget/NavbarScreenMFS.dart';

class ExpenseScreen extends StatefulWidget {
  Navbool navbool;
  Appbool appbool;

  ExpenseScreen({required this.appbool, required this.navbool});

  @override
  State<ExpenseScreen> createState() => _ExpenseScreenState();
}

class _ExpenseScreenState extends State<ExpenseScreen> {
  var selectedString;
  DateTime selectedDate = DateTime.now();
  var amounttxt = TextEditingController();
  String electeddate = '';
  bool click = false;
  List<Map> _expenses = [];

  Future<void> fetch() async {
    _expenses = [];
    int i = 0;
    await FirebaseFirestore.instance
        .collection('ExpenseItem')
        .get()
        .then((que) {
      for (var ele in que.docs) {
        i++;
        _expenses.add({
          'ctgry': ele['Expense Category'],
          'amount': ele['Amount'],
          'Date': ele['Date'].toDate(),
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
                                    "Add New Expense",
                                    style: TextStyle(
                                      color: AppColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                Spacer(),
                                InkWell(
                                  onTap: () {
                                    if (selectedString == null ||
                                        amounttxt.text.isEmpty) {
                                      Get.snackbar("Expense Adding Failed.",
                                          "Some Required Fields are Empty",
                                          snackPosition: SnackPosition.BOTTOM,
                                          colorText: Colors.white,
                                          backgroundColor: Colors.red,
                                          margin: EdgeInsets.zero,
                                          duration: const Duration(
                                              milliseconds: 2000),
                                          boxShadows: [
                                            BoxShadow(
                                                color: Colors.grey,
                                                offset: Offset(-100, 0),
                                                blurRadius: 20),
                                          ],
                                          borderRadius: 0);
                                    } else {
                                      FirebaseFirestore.instance
                                          .collection('ExpenseItem')
                                          .add({
                                        'Expense Category': selectedString,
                                        'Amount': double.parse(
                                            amounttxt.text.toString()),
                                        'Date': selectedDate,
                                      }).then((value) async {
                                        fetch();
                                        Get.snackbar(
                                            "Open Close Updated Successfully.",
                                            "Refreshing the Page.",
                                            snackPosition: SnackPosition.BOTTOM,
                                            colorText: Colors.white,
                                            backgroundColor: Colors.green,
                                            margin: EdgeInsets.zero,
                                            duration: const Duration(
                                                milliseconds: 2000),
                                            boxShadows: [
                                              const BoxShadow(
                                                  color: Colors.grey,
                                                  offset: Offset(-100, 0),
                                                  blurRadius: 20),
                                            ],
                                            borderRadius: 0);
                                      });
                                    }
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
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                InkWell(
                                  onTap: () {
                                    var ss;
                                    selectedDate = DateTime.now();
                                    selectedString = ss;
                                    amounttxt.text = '';
                                    setState(() {});
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 90,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 3.0, left: 15),
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
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14),
                                          ),
                                        ],
                                      ),
                                    ),
                                    color: AppColor_yellow,
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
                                          text: 'Select Expense Category',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14),
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
                                        width: 10,
                                      ),
                                      Container(
                                          width: 300,
                                          padding: EdgeInsets.symmetric(
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
                                                style: TextStyle(fontSize: 12),
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
                                                  "Enter Expense Category",
                                                );
                                              } else {
                                                return Text(
                                                  item,
                                                );
                                              }
                                            },
                                            onChanged: (newValue) {
                                              setState(() {
                                                selectedString = newValue;
                                              });
                                            },
                                            items: ExpensecategoryList,
                                            selectedItem: selectedString,
                                          )),
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
                                          text: 'Amount',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14),
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
                                        width: 110,
                                      ),
                                      SizedBox(
                                        width: 300,
                                        child: TextField(
                                          controller: amounttxt,
                                          keyboardType: TextInputType.number,
                                          inputFormatters: [
                                            FilteringTextInputFormatter
                                                .digitsOnly
                                          ],
                                          decoration: const InputDecoration(
                                            border: OutlineInputBorder(),
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    vertical: 5),
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
                                          text: 'Date',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14),
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
                                        width: 130,
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
                                                border: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.grey),
                                                ),
                                                hintText: selectedDate != null
                                                    ? "${selectedDate!.day}-${selectedDate!.month}-${selectedDate!.year}"
                                                    : "Select a date",
                                                hintStyle: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 14,
                                                ),
                                                suffixIcon: Icon(
                                                    Icons.calendar_month_sharp,
                                                    size: 14,
                                                    color: Colors.grey),
                                              ),
                                            ),
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
                      height: 250,
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
                                    "All Expenses List",
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
                          SizedBox(
                            height: 25,
                          ),
                          MediaQuery.removePadding(
                            context: context,
                            removeTop: true,
                            child: DataTable(
                              showCheckboxColumn: false,
                              border: TableBorder.all(
                                  color: Colors.black26, width: 1),
                              headingRowColor: MaterialStateProperty.all<Color>(
                                  AppColor_Blue),
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
                                    'Expense Category',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    'Date',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                DataColumn(
                                  label: Text('Amount',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      )),
                                ),
                              ],
                              rows: [
                                for(var ele in _expenses)
                                  DataRow(
                                    cells: [
                                      DataCell(Text(ele["sl"].toString(),
                                          style: const TextStyle(
                                            fontSize: 12,
                                          ))),
                                      DataCell(Text(ele["ctgry"],
                                          style: const TextStyle(
                                            fontSize: 12,
                                          ))),
                                      DataCell(
                                        Text(DateFormat.yMMMMd().format(ele["Date"]),
                                            style: TextStyle(
                                              fontSize: 12,
                                            )),
                                      ),
                                      DataCell(
                                          Text(ele["amount"].toStringAsFixed(1),textAlign: TextAlign.end,
                                              style: TextStyle(
                                                fontSize: 12,
                                              ))),
                                    ],
                                  )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            NavbarScreenMFS(
              appbool: widget.appbool,
              navbool: widget.navbool,
            ),
          ],
        ),
      ),
    );
  }
}
