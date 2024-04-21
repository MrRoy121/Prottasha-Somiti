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
import '../../Model/member.dart';
import '../../ScreensMFS/Widget/Appbar.dart';
import '../../ScreensMFS/Widget/Appbool.dart';
import '../Widgets/NavBoolCBS.dart';
import '../Widgets/NavbarScreenCBS.dart';

class LienScreen extends StatefulWidget {
  NavboolCBS navbool;
  Appbool appbool;

  LienScreen({required this.appbool, required this.navbool});

  @override
  State<LienScreen> createState() => _LienScreenState();
}

class _LienScreenState extends State<LienScreen> {
  var selectedString;
  DateTime selectedDate = DateTime.now();
  var amounttxt = TextEditingController();
  String electeddate = '';
  bool click = false;
  var _selectedmemberss;
  List<Map> _liens = [];
  List<Memberss> _memberss = [];

  Future<void> fetches() async {
  }

  Future<void> fetch() async {
    _memberss = [];
    _liens = [];
    int i = 0;
    await FirebaseFirestore.instance
        .collection('Lien')
        .get()
        .then((que) {
      for (var ele in que.docs) {
        i++;
        _liens.add({
          'Member ID': ele['Member ID'],
          'amount': ele['Amount'],
          'Date': ele['Date'].toDate(),
          'sl': i,
        });
      }
      setState(() {});
    });
    await FirebaseFirestore.instance
        .collection('Customer')
        .get()
        .then((querySnapshot) {
      for (var element in querySnapshot.docs) {
        _memberss.add(Memberss(
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
                                    "Add Lien",
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
                                      Get.snackbar("Lien Adding Failed.",
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
                                          .collection('Lien').doc( _selectedmemberss.id)
                                          .set({
                                        'Member ID': _selectedmemberss.id,
                                        'Amount': double.parse(amounttxt.text.toString()),
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
                                        width: 40,
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
                                                _selectedmemberss = newValue;
                                              });
                                            },
                                            items: _memberss,
                                            selectedItem: _selectedmemberss,
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
