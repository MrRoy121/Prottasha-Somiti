import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:prottashasomit/route.dart';
import '../../../../Constants/Constants.dart';
import '../../ScreensMFS/Widget/Appbar.dart';
import '../../ScreensMFS/Widget/Appbool.dart';
import '../Widgets/NavBoolCBS.dart';
import '../Widgets/NavbarScreenCBS.dart';

class DayOpenClose extends StatefulWidget {
  NavboolCBS navbool;
  Appbool appbool;

  DayOpenClose({required this.appbool, required this.navbool});

  @override
  State<DayOpenClose> createState() => _DayOpenCloseState();
}

class _DayOpenCloseState extends State<DayOpenClose> {
  var selectedString;
  int _selectedValue = 1;
  DateTime selectedDate =  DateTime.now();
  String electeddate ='';
  bool click = false;

  Future<void> fetch() async {
    var collectionReference =
    FirebaseFirestore.instance.collection('DayOpenClose');
    var documentReference = collectionReference.doc('98765');
    var snapshot = await documentReference.get();
    if (snapshot.exists && snapshot.data()?['OpenClose'] == true) {
      click = true;
      electeddate = snapshot.data()?['Date'];
    }else{
      click = false;
    }
    setState(() {});
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetch();
  }
  @override
  Widget build(BuildContext context) {Future<void> _selectDate(BuildContext context) async {
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
                                    "Day Open Close",
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
                                    bool dd = false;
                                    if(_selectedValue==1) {
                                      dd=true;
                                    }
                                      FirebaseFirestore.instance
                                        .collection('DayOpenClose')
                                        .doc("98765")
                                        .set({
                                      'OpenClose': dd,
                                      'Date': DateFormat.yMMMd().format(selectedDate).toString(),
                                    }).then((value) async {
                                      Get.offNamed(homePageRoute);
                                      Get.snackbar(
                                          "Open Close Updated Successfully.", "Redirecting to Home Page.",
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
                                    }).catchError((error) => print("Failed to add user: $error"));

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
                                  onTap: () { var ss;
                                    selectedDate = DateTime.now();
                                    selectedString = ss;
                                    _selectedValue =1;
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
                                          text: 'Select Branch',
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
                                        width: 40,
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
                                                  "Enter Branch Code",
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
                                            items: const [
                                              '98765 - Sunamgonj Sadar'
                                            ],
                                            selectedItem: selectedString,
                                          )),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    padding:
                                        EdgeInsets.only(left: 250, right: 100),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Row(
                                          children: [
                                            Transform.scale(
                                              scale: 1,
                                              child: Radio(
                                                value:1,
                                                groupValue: _selectedValue,
                                                onChanged: (newValue) {
                                                  setState(() {
                                                    _selectedValue =
                                                        newValue as int;
                                                  });
                                                },
                                                activeColor: AppColor_greyText,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 2,
                                            ),
                                            Text(
                                              'Day Open',
                                              style: TextStyle(fontSize: 14),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Transform.scale(
                                              scale: 1,
                                              child: Radio(
                                                value: 2,
                                                groupValue: _selectedValue,
                                                onChanged: (newValue) {
                                                  setState(() {
                                                    _selectedValue =
                                                        newValue as int;
                                                  });
                                                },
                                                activeColor: AppColor_greyText,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 2,
                                            ),
                                            const Text(
                                              'Day Close',
                                              style: TextStyle(fontSize: 14),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
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
                                        width: 100,
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
                                                  borderSide:
                                                  BorderSide(color: Colors.grey),
                                                ),
                                                hintText: selectedDate != null
                                                    ? "${selectedDate!.day}-${selectedDate!.month}-${selectedDate!.year}"
                                                    : "Select a date",
                                                hintStyle: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize:14,
                                                ),
                                                suffixIcon: Icon(
                                                    Icons.calendar_month_sharp, size: 14,
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
                                    "Branch Wise Day Open Close",
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

                          SizedBox(height: 25,),
                          MediaQuery.removePadding(
                            context: context,
                            removeTop: true,
                            child: DataTable(
                              showCheckboxColumn: false,
                              border: TableBorder.all(
                                  color: Colors.black26,
                                  width: 1),
                              headingRowColor:
                              MaterialStateProperty.all<
                                  Color>(AppColor_Blue),
                              columns: const [
                                DataColumn(
                                  label: Text(
                                    'Branch Name',
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
                                  label: Text('Day Status',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight:
                                        FontWeight.bold,
                                        color: Colors.white,
                                      )),
                                ),
                              ],
                              rows: [DataRow(
                                cells: [
                                  DataCell(Text(
                                      "98765 - Sunamgonj Sadar",
                                      style: const TextStyle(
                                        fontSize: 12,
                                      ))),
                                  DataCell(
                                    Text(
                                        electeddate,
                                        style: TextStyle(
                                          fontSize: 12,
                                        )),
                                  ),
                                  DataCell(Text(
                                      click?"Day Open":"Day Close",
                                      style: TextStyle(
                                        fontSize: 12,
                                      ))),
                                ],
                              )],
                            ),
                          )
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
