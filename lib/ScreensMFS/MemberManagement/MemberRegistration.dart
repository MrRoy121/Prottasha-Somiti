import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker_web/image_picker_web.dart';
import '../../../../Constants/Constants.dart';
import '../../../../Constants/values.dart';
import '../../../../Model/somitee.dart';
import '../../../../route.dart';
import '../Widget/Appbar.dart';
import '../Widget/Appbool.dart';
import '../Widget/ContactForm.dart';
import '../Widget/NavBoolMFS.dart';
import '../Widget/NavbarScreenMFS.dart';
import '../Widget/OtherInfo.dart';
import '../Widget/PersonalInfoForm.dart';
import '../Widget/SamiteeSelection.dart';
import '../Widget/SingleRow.dart';

class MemberRegistration extends StatefulWidget {
  Navbool navbool;
  Appbool appbool;

  MemberRegistration({required this.appbool, required this.navbool});

  @override
  State<MemberRegistration> createState() => _MemberRegistrationState();
}

class _MemberRegistrationState extends State<MemberRegistration> {
  List<Somitee> somitee = [];
  List<String> ssomitee = [];
  bool img = false;
  DateTime _selectedDate = DateTime.now();
  var selectedsomiti;
  var sselectedsomiti;
  var selectedmebertype;
  var selectedocupation;
  var _firstname = TextEditingController();
  var _lastname = TextEditingController();
  var _fathername = TextEditingController();
  var _mothername = TextEditingController();
  var _nidnumber = TextEditingController();
  var _birthreginumber = TextEditingController();
  var _age = TextEditingController();
  var _spouse = TextEditingController();
  var _education = TextEditingController();
  var selectedGender;
  var selectedreligion;
  var maritalstatus;
  var mobiletype;
  var _mobileno = TextEditingController();
  var _preseentaddress = TextEditingController();
  var _parmaaddress = TextEditingController();
  var selectedfamilyhead = "";
  var selectedownhomestead = "";
  var _livingperiod = TextEditingController();
  var _annualincome = TextEditingController();
  var _nomaleearner = TextEditingController();
  var _nofemaleearner = TextEditingController();
  var _relationwithhead = TextEditingController();
  var _landdesc = TextEditingController();
  var _reference = TextEditingController();
  var _remarks = TextEditingController();
  late Uint8List pickedImage;

  @override
  void initState() {
    _loadImage();
    // TODO: implement initState
    super.initState();
    fetch();
  }

  Future<void> _loadImage() async {
    ByteData data = await rootBundle.load('assets/person.jpg');
    pickedImage = data.buffer.asUint8List();
  }

  Future<void> fetch() async {
    await FirebaseFirestore.instance
        .collection('Somitee')
        .get()
        .then((querySnapshot) {
      for (var element in querySnapshot.docs) {
        somitee.add(Somitee(
            address: element["Address"],
            id: element.id,
            lastupdated: element["Last Edited"].toDate(),
            closed: element["Closed"],
            name: element["Name"],
            active: element["Active"],
            formation: element["Formation Date"].toDate(),
            phone: element["Phone"],
            branch: element["Branch"],
            sl: 0));
        ssomitee.add(element["Name"]);
      }
    });
  }

  void _onclear() {
    setState(() {
      var ss;
      selectedsomiti = ss;
      sselectedsomiti = ss;
      selectedmebertype = ss;
      selectedocupation = ss;
      _firstname = TextEditingController(text: "");
      _lastname = TextEditingController(text: "");
      _fathername = TextEditingController(text: "");
      _mothername = TextEditingController(text: "");
      _nidnumber = TextEditingController(text: "");
      _birthreginumber = TextEditingController(text: "");
      _age = TextEditingController(text: "");
      _spouse = TextEditingController(text: "");
      _education = TextEditingController(text: "");
      selectedGender = ss;
      selectedreligion = ss;
      _selectedDate = DateTime.now();
      maritalstatus = ss;
      mobiletype = ss;
      _mobileno = TextEditingController(text: "");
      _preseentaddress = TextEditingController(text: "");
      _parmaaddress = TextEditingController(text: "");
      selectedfamilyhead = ss;
      selectedownhomestead = ss;
      _livingperiod = TextEditingController(text: "");
      _annualincome = TextEditingController(text: "");
      _nomaleearner = TextEditingController(text: "");
      _nofemaleearner = TextEditingController(text: "");
      _relationwithhead = TextEditingController(text: "");
      _landdesc = TextEditingController(text: "");
      _reference = TextEditingController(text: "");
      _remarks = TextEditingController(text: "");
      img = false;
    });
  }

  void _save() async {
    if (selectedsomiti == null ||
        selectedGender == null ||
        selectedreligion == null ||
        selectedmebertype == '' ||
        selectedocupation == '' ||
        _fathername.text.isEmpty ||
        _firstname.text.isEmpty ||
        _reference.text.isEmpty ||
        _lastname.text.isEmpty ||
        _preseentaddress.text.isEmpty ||
        _mothername.text.isEmpty ||
        _mobileno.text.isEmpty ||
        _mobileno.text.isEmpty ||
        _reference.text.isEmpty ||
        (_birthreginumber.text.isEmpty && _nidnumber.text.isEmpty)) {
      Get.snackbar(
          "Member Registration Failed.", "Some Required  Fields are Empty",
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
      FirebaseFirestore.instance
          .collection('Somitee')
          .doc(selectedsomiti.id)
          .get()
          .then((value) {
        FirebaseFirestore.instance
            .collection('Somitee')
            .doc(selectedsomiti.id)
            .update({'Active': value['Active'] + 1});
      });
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('Member').get();
      int somiteeCount = querySnapshot.docs.length + 1;
      String memberid =
          selectedsomiti.id + somiteeCount.toString().padLeft(3, '0');

      if (img) {
        final photoRef =
            FirebaseStorage.instance.ref("MembersImage/$memberid.jpeg");
        UploadTask uploadTask = photoRef.putData(
            pickedImage,
            SettableMetadata(
              contentType: "image/jpeg",
            ));
        String url = await (await uploadTask).ref.getDownloadURL();
        FirebaseFirestore.instance.collection('Member').doc(memberid).set({
          'Somitee Name': selectedsomiti.name,
          'Somitee ID': selectedsomiti.id,
          'Member Type': selectedmebertype,
          'Occupation': selectedocupation,
          'First Name': _firstname.text,
          'Last Name': _lastname.text,
          'Father Name': _fathername.text,
          'Loan Pending Amount': 0,
          'Own deposit Amount': 0,
          'Deposits': [],
          'Withdraws': [],
          'Mother Name': _mothername.text,
          'Gender': selectedGender,
          'Religion': selectedreligion,
          'National ID': _nidnumber.text,
          'Birth Registration': _birthreginumber.text,
          'Age': _age.text,
          'Date Of Birth': _selectedDate,
          'Spouse': _spouse.text,
          'Education': _education.text,
          'Marital Status': maritalstatus,
          'Mobile No Type': mobiletype,
          'Mobile No': _mobileno.text,
          'Present Address': _preseentaddress.text,
          'Permanent Address': _parmaaddress.text,
          'Living Period': _livingperiod.text,
          'No Female Earner': _nofemaleearner.text,
          'No Male Earner': _nomaleearner.text,
          'ID': memberid,
          'Status': true,
          'Dead': false,
          'Head Family': selectedfamilyhead,
          'Own HomeStead': selectedownhomestead,
          'Relation With Head': _relationwithhead.text,
          'Annual Income': _annualincome.text,
          'Land Desc': _landdesc.text,
          'Reference': _reference.text,
          'Remarks': _remarks.text,
          'Image': true,
          'ImageURL': url,
        }).then((value) async {
          Get.offNamed(memberlistPageRoute);
          Get.snackbar(
              "Member Added Successfully.", "Redirecting to Member List Page.",
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
        }).catchError((error) => print("Failed to add user: $error"));
      } else {
        FirebaseFirestore.instance.collection('Member').doc(memberid).set({
          'Somitee Name': selectedsomiti.name,
          'Somitee ID': selectedsomiti.id,
          'Member Type': selectedmebertype,
          'Occupation': selectedocupation,
          'First Name': _firstname.text,
          'Loan Pending Amount': 0,
          'Own deposit Amount': 0,
          'Last Name': _lastname.text,
          'Father Name': _fathername.text,
          'Mother Name': _mothername.text,
          'Gender': selectedGender,
          'Status': true,
          'Dead': false,
          'Deposits': [],
          'Withdraws': [],
          'Religion': selectedreligion,
          'National ID': _nidnumber.text,
          'Birth Registration': _birthreginumber.text,
          'Age': _age.text,
          'Date Of Birth': _selectedDate,
          'Spouse': _spouse.text,
          'Education': _education.text,
          'Marital Status': maritalstatus,
          'Mobile No Type': mobiletype,
          'Mobile No': _mobileno.text,
          'Present Address': _preseentaddress.text,
          'Permanent Address': _parmaaddress.text,
          'Living Period': _livingperiod.text,
          'Annual Income': _annualincome.text,
          'No Female Earner': _nofemaleearner.text,
          'No Male Earner': _nomaleearner.text,
          'ID': memberid,
          'Head Family': selectedfamilyhead,
          'Own HomeStead': selectedownhomestead,
          'Relation With Head': _relationwithhead.text,
          'Land Desc': _landdesc.text,
          'Reference': _reference.text,
          'Remarks': _remarks.text,
          'Image': false,
          'ImageURL': '',
        }).then((value) async {
          Get.offNamed(memberlistPageRoute);
          Get.snackbar(
              "Member Added Successfully.", "Redirecting to Member List Page.",
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
        }).catchError((error) => print("Failed to add user: $error"));
      }
    }
  }

  Future<void> _selectImage() async {
    final fromPicker = await ImagePickerWeb.getImageAsBytes();
    if (fromPicker != null) {
      setState(() {
        pickedImage = fromPicker;
        img = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var ScreenWidth = MediaQuery.of(context).size.width;

    double ResponsiveWidth = MediaQuery.of(context as BuildContext).size.width;
    double ResponsiveHeight =
        MediaQuery.of(context as BuildContext).size.height;

    bool desktop = false;
    bool tablet = false;
    bool mobile = false;

    void _setupsomiti(int ins) {
      setState(() {
        selectedsomiti = somitee[ins];
      });
    }

    void _setupmembertype(int ins) {
      setState(() {
        selectedmebertype = MemberTypeList[ins];
      });
    }

    void _setupoccupationtype(int ins) {
      setState(() {
        selectedocupation = SectorList[ins];
      });
    }

    void _setupmaritalstatus(int ins) {
      setState(() {
        maritalstatus = MaritalstatusList[ins];
      });
    }

    void _setupgender(int ins) {
      setState(() {
        if (ins == 1) {
          selectedGender = 'Male';
        } else if (ins == 2) {
          selectedGender = 'Female';
        } else {
          selectedGender = 'Others';
        }
      });
    }

    void _setupfamilyhead(int ins) {
      setState(() {
        if (ins == 1) {
          selectedfamilyhead = 'Yes';
        } else {
          selectedfamilyhead = 'No';
        }
      });
    }

    void _setupownhomestead(int ins) {
      setState(() {
        if (ins == 1) {
          selectedownhomestead = 'Yes';
        } else {
          selectedownhomestead = 'No';
        }
      });
    }

    void _setupreligion(int ins) {
      setState(() {
        selectedreligion = ReligionList[ins];
      });
    }

    void _setupmobileType(int ins) {
      setState(() {
        mobiletype = MobileTypeList[ins];
      });
    }

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
          final today = DateTime.now();
          final age = today.year -
              picked.year -
              ((today.month > picked.month ||
                      (today.month == picked.month && today.day >= picked.day))
                  ? 0
                  : 1);
          _age.text = age.toString();
        });
      }
    }

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
    return Scaffold(
      appBar: Appbar(
        navbool: widget.appbool,
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: 100, left: 50),
              child: SamiteeSelection(
                  submit: true,
                  selectmember: false,
                  clear: true,
                  ssomitee: ssomitee,
                  close: true,
                  setupsomiti: _setupsomiti,
                  active: true,
                  selectedsomiteeid: selectedsomiti,
                  onsubmit: _save,
                  somitee: somitee,
                  onclear: _onclear,
                  selectedsomitee: sselectedsomiti),
            ),

            // BASIC INFO SCREEN
            Container(
              margin: EdgeInsets.only(top: 500, left: 50),
              child: SingleRow(
                heading: 'Basic Information',
                field1: 'Member Type:',
                setupoccupationtype: _setupoccupationtype,
                field2: 'Main Occupation:',
                setupmembertype: _setupmembertype,
                membertype: selectedmebertype,
                ocupation: selectedocupation,
              ),
            ),

            // PERSONAL INFORMATION SCREEN
            Container(
              margin: EdgeInsets.only(top: 730, left: 50),
              child: PersonalInfoForm(
                  firstname: _firstname,
                  selectedGender: selectedGender,
                  religion: selectedreligion,
                  selectDate: _selectDate,
                  selectedDate: _selectedDate,
                  maritalstatus: maritalstatus,
                  lastname: _lastname,
                  setupmaritalstatus: _setupmaritalstatus,
                  fathername: _fathername,
                  setupreligion: _setupreligion,
                  mothername: _mothername,
                  setupgender: _setupgender,
                  nidnumber: _nidnumber,
                  birthreginumber: _birthreginumber,
                  age: _age,
                  spouse: _spouse,
                  education: _education),
            ),

            // CONTACT INFORMATION SCREEN
            Container(
              margin: EdgeInsets.only(top: 1500, left: 50),
              child: ContactForm(
                  mobiletype: mobiletype,
                  mobileno: _mobileno,
                  setupmobileType: _setupmobileType,
                  preseentaddress: _preseentaddress,
                  parmaaddress: _parmaaddress),
            ),

            // OTHER'S INFORMATION
            Container(
              margin: EdgeInsets.only(top: 1850, left: 50),
              child: OtherInfo(
                  selectedfamilyhead: selectedfamilyhead,
                  selectedownhomestead: selectedownhomestead,
                  livingperiod: _livingperiod,
                  annualincome: _annualincome,
                  setupownhomestead: _setupownhomestead,
                  nomaleearner: _nomaleearner,
                  setupfamilyhead: _setupfamilyhead,
                  nofemaleearner: _nofemaleearner,
                  relationwithhead: _relationwithhead,
                  landdesc: _landdesc,
                  reference: _reference,
                  remarks: _remarks),
            ),

            // MEMBER IMAGE
            Container(
              margin: EdgeInsets.only(top: 2500, left: 50, bottom: 30),
              child: desktop
                  ? Container(
                      width: 1400,
                      height: 350,
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
                                  padding: const EdgeInsets.only(left: 40.0),
                                  child: Text(
                                    "Member’s Image",
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
                          Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 50, left: 250),
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
                                        child: Center(
                                          child: Text(
                                            "Choose Image",
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
                                                    padding: EdgeInsets.only(
                                                      top: 20,
                                                      left: 10,
                                                      right: 10,
                                                    ),
                                                    child: Row(
                                                      children: [
                                                        Text(
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
                                                            style:
                                                                ElevatedButton
                                                                    .styleFrom(
                                                              backgroundColor:
                                                                  Colors.white,
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                side: BorderSide(
                                                                    color: Colors
                                                                        .blue),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5.0),
                                                              ),
                                                            ),
                                                            onPressed:
                                                                _selectImage,
                                                            child: Text(
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
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      child: img
                                          ? Image.memory(
                                              pickedImage,
                                              fit: BoxFit.cover,
                                            )
                                          : Center(
                                              child: Icon(
                                                  Icons.person_2_outlined,
                                                  size: 58),
                                            ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  : tablet
                      ? Container(
                          width: 1400,
                          height: 650,
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
                                      padding:
                                          const EdgeInsets.only(left: 40.0),
                                      child: Text(
                                        "Member’s Image",
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
                              Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: 50, left: ScreenWidth / 6.144),
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
                                            child: Center(
                                              child: Text(
                                                "Choose Image",
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
                                                        BorderRadius.circular(
                                                            5.0),
                                                  ),
                                                  child: Column(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                          top: 20,
                                                          left: 10,
                                                          right: 10,
                                                        ),
                                                        child: Row(
                                                          children: [
                                                            Text(
                                                              "Select an Image File",
                                                              style: TextStyle(
                                                                fontSize: 14,
                                                              ),
                                                            ),
                                                            SizedBox(width: 10),
                                                            SizedBox(
                                                              height: 30,
                                                              width: 96,
                                                              child:
                                                                  ElevatedButton(
                                                                style: ElevatedButton
                                                                    .styleFrom(
                                                                  backgroundColor:
                                                                      Colors
                                                                          .white,
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    side: BorderSide(
                                                                        color: Colors
                                                                            .blue),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            5.0),
                                                                  ),
                                                                ),
                                                                onPressed:
                                                                    _selectImage,
                                                                child: Text(
                                                                  "Select",
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        14,
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
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: 50, left: ScreenWidth / 11.82),
                                    child: Container(
                                      // margin: EdgeInsets.only(top: 50, right: 250),
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
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                            ),
                                            child: img
                                                ? Image.memory(
                                                    pickedImage,
                                                    fit: BoxFit.cover,
                                                  )
                                                : Center(
                                                    child: Icon(
                                                        Icons.person_2_outlined,
                                                        size: 58),
                                                  ),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        )
                      : Container(
                          width: 1400,
                          height: 650,
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
                                      padding:
                                          const EdgeInsets.only(left: 40.0),
                                      child: Text(
                                        "Member’s Image",
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
                              Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: 50, left: ScreenWidth / 6.144),
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
                                            child: Center(
                                              child: Text(
                                                "Choose Image",
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
                                                        BorderRadius.circular(
                                                            5.0),
                                                  ),
                                                  child: Column(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                          top: 20,
                                                          left: 10,
                                                          right: 10,
                                                        ),
                                                        child: Row(
                                                          children: [
                                                            Text(
                                                              "Select an Image File",
                                                              style: TextStyle(
                                                                fontSize: 14,
                                                              ),
                                                            ),
                                                            SizedBox(width: 10),
                                                            SizedBox(
                                                              height: 30,
                                                              width: 96,
                                                              child:
                                                                  ElevatedButton(
                                                                style: ElevatedButton
                                                                    .styleFrom(
                                                                  backgroundColor:
                                                                      Colors
                                                                          .white,
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    side: BorderSide(
                                                                        color: Colors
                                                                            .blue),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            5.0),
                                                                  ),
                                                                ),
                                                                onPressed:
                                                                    _selectImage,
                                                                child: Text(
                                                                  "Select",
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        14,
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
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: 50, left: ScreenWidth / 11.82),
                                    child: Container(
                                      // margin: EdgeInsets.only(top: 50, right: 250),
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
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                            ),
                                            child: img
                                                ? Image.memory(
                                                    pickedImage,
                                                    fit: BoxFit.cover,
                                                  )
                                                : Center(
                                                    child: Icon(
                                                        Icons.person_2_outlined,
                                                        size: 58),
                                                  ),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
            ),

            NavbarScreenMFS(
              appbool: widget.appbool,
              navbool: widget.navbool,
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
