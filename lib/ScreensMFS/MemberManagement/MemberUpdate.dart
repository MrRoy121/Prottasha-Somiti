import 'dart:convert';
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
import '../../../../Model/member.dart';
import '../../../../Model/somitee.dart';
import '../../../../route.dart';
import '../Widget/Appbar.dart';
import '../Widget/Appbool.dart';
import '../Widget/ContactForm.dart';
import '../Widget/NavBoolMFS.dart';
import '../Widget/NavbarScreenMFS.dart';
import '../Widget/OtherInfo.dart';
import '../Widget/PersonalInfoForm.dart';
import '../Widget/SamiteeSelectionUpdate.dart';
import '../Widget/SingleRow.dart';

class MemberUpdate extends StatefulWidget {
  Navbool navbool;
  Appbool appbool;

  MemberUpdate({required this.appbool, required this.navbool});

  @override
  State<MemberUpdate> createState() => _MemberUpdateState();
}

class _MemberUpdateState extends State<MemberUpdate> {
  List<Somitee> somitee = [];
  List<String> ssomitee = [];
  late String imgurl;
  bool img = false,url = false,loading = true;
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
  bool somiteeselected = false;
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
  var _housedesc = TextEditingController();
  var _remarks = TextEditingController();
  late Uint8List pickedImage;

  @override
  void initState() {
    _loadImage();
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
            lastupdated: element["Last Edited"].toDate(),closed: element["Closed"],
            name: element["Name"],
            active: element["Active"],
            formation: element["Formation Date"].toDate(),
            phone: element["Phone"],
            branch: element["Branch"],
            sl: 0));
        ssomitee.add(element["Name"]);
      }
      setState(() {
        loading = false;
      });
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
      _housedesc = TextEditingController(text: "");
      _remarks = TextEditingController(text: "");
      img = false;
    });
  }

  void _save(Memberss mst) async {
    if (selectedsomiti == null ||
        selectedGender == null ||
        selectedmebertype == '' ||
        selectedocupation == '' ||
        _fathername.text.isEmpty ||
        _firstname.text.isEmpty ||
        _lastname.text.isEmpty ||
        _preseentaddress.text.isEmpty ||
        _mothername.text.isEmpty ||
        _mobileno.text.isEmpty ||
        _annualincome.text.isEmpty ||
        _mobileno.text.isEmpty ||
        (_birthreginumber.text.isEmpty && _nidnumber.text.isEmpty)) {
      Get.snackbar("Member Updating Failed.", "Some Required  Fields are Empty",
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
      if (img) {
        final photoRef =
            FirebaseStorage.instance.ref("MembersImage/$mst.id.jpeg");
        UploadTask uploadTask = photoRef.putData(
            pickedImage,
            SettableMetadata(
              contentType: "image/jpeg",
            ));
        String url = await (await uploadTask).ref.getDownloadURL();
        FirebaseFirestore.instance.collection('Member').doc(mst.id).update({
          'Somitee Name': selectedsomiti.name,
          'Somitee ID': selectedsomiti.id,
          'Member Type': selectedmebertype,
          'Occupation': selectedocupation,
          'First Name': _firstname.text,
          'Last Name': _lastname.text,
          'Father Name': _fathername.text,
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
          'Annual Income': _annualincome.text,
          'ID': mst.id,
          'Head Family': selectedfamilyhead,
          'Own HomeStead': selectedownhomestead,
          'Relation With Head': _relationwithhead.text,
          'Land Desc': _landdesc.text,
          'House Desc': _housedesc.text,
          'Remarks': _remarks.text,
          'Image': true,
          'ImageURL': url,
        }).then((value) async {
          Get.offNamed(memberlistPageRoute);
          Get.snackbar(
              "Member Updated Successfully.", "Redirecting to Member List Page.",
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
      else if (url){
        FirebaseFirestore.instance.collection('Member').doc(mst.id).update({
          'Somitee Name': selectedsomiti.name,
          'Somitee ID': selectedsomiti.id,
          'Member Type': selectedmebertype,
          'Occupation': selectedocupation,
          'First Name': _firstname.text,
          'Last Name': _lastname.text,
          'Father Name': _fathername.text,
          'Mother Name': _mothername.text,
          'Gender': selectedGender,
          'Religion': selectedreligion,
          'National ID': _nidnumber.text,
          'Birth Registration': _birthreginumber.text,
          'Age': _age.text,
          'Date Of Birth': _selectedDate,
          'Annual Income': _annualincome.text,
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
          'ID': mst.id,
          'Head Family': selectedfamilyhead,
          'Own HomeStead': selectedownhomestead,
          'Relation With Head': _relationwithhead.text,
          'Land Desc': _landdesc.text,
          'House Desc': _housedesc.text,
          'Remarks': _remarks.text,
          'Image': true,
          'ImageURL': mst.imageurl,
        }).then((value) async {
          Get.offNamed(memberlistPageRoute);
          Get.snackbar(
              "Member Updated Successfully.", "Redirecting to Member List Page.",
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
      else {
        FirebaseFirestore.instance.collection('Member').doc(mst.id).update({
          'Somitee Name': selectedsomiti.name,
          'Somitee ID': selectedsomiti.id,
          'Member Type': selectedmebertype,
          'Occupation': selectedocupation,
          'First Name': _firstname.text,
          'Last Name': _lastname.text,
          'Father Name': _fathername.text,
          'Mother Name': _mothername.text,
          'Gender': selectedGender,
          'Religion': selectedreligion,
          'National ID': _nidnumber.text,
          'Birth Registration': _birthreginumber.text,
          'Age': _age.text,
          'Date Of Birth': _selectedDate,
          'Annual Income': _annualincome.text,
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
          'ID': mst.id,
          'Head Family': selectedfamilyhead,
          'Own HomeStead': selectedownhomestead,
          'Relation With Head': _relationwithhead.text,
          'Land Desc': _landdesc.text,
          'House Desc': _housedesc.text,
          'Remarks': _remarks.text,
          'Image': false,
          'ImageURL': '',
        }).then((value) async {
          Get.offNamed(memberlistPageRoute);
          Get.snackbar(
              "Member Updated Successfully.", "Redirecting to Member List Page.",
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

  void _addinit(Memberss cst) {
    if(!loading){
    selectedsomiti = somitee[ssomitee.indexOf(cst.somiteename)];
    sselectedsomiti = cst.somiteename;
    selectedmebertype = cst.membertype;
    selectedocupation = cst.occupation;
    _firstname = TextEditingController(text: cst.firstname);
    _lastname = TextEditingController(text: cst.lastname);
    _fathername = TextEditingController(text: cst.fathername);
    _mothername = TextEditingController(text: cst.mothername);
    _nidnumber = TextEditingController(text: cst.nationalid);
    _birthreginumber = TextEditingController(text: cst.birthregi);
    _age = TextEditingController(text: cst.age);
    _education = TextEditingController(text: cst.education);
    selectedGender = cst.gender;
    selectedreligion = cst.religion;
    _selectedDate = cst.birthdate;
    maritalstatus = cst.maritalstatus;
    mobiletype = cst.mobilenotype;
    _mobileno = TextEditingController(text: cst.mobilenno);
    _preseentaddress = TextEditingController(text: cst.presentadd);
    _parmaaddress = TextEditingController(text: cst.parmaadd);
    selectedfamilyhead = cst.headfamily;
    selectedownhomestead = cst.ownhomestead;
    _livingperiod = TextEditingController(text: cst.livingperiod);
    _annualincome = TextEditingController(text: cst.annualincome);
    _nomaleearner = TextEditingController(text: cst.nomaleearner);
    _nofemaleearner = TextEditingController(text: cst.nofemaleearner);
    _relationwithhead = TextEditingController(text: cst.relationwithhead);
    _landdesc = TextEditingController(text: cst.landdesc);
    _remarks = TextEditingController(text: cst.remarks);
    if (cst.img) {
      imgurl = cst.imageurl;
      url = true;
    }
    setState(() {});
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
          final age = today.year - picked.year - ((today.month > picked.month || (today.month == picked.month && today.day >= picked.day)) ? 0 : 1);
          _age.text = age.toString();
        });
      }
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

    var arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    Memberss mst = Memberss(
        somiteename: arguments['Members']["Somitee Name"]?? '',
        somiteeid: arguments['Members']["Somitee ID"]?? '',
        membertype: arguments['Members']["Member Type"]?? '',dead: arguments['Members']['Dead']?? '',
        occupation: arguments['Members']["Occupation"]?? '',
        firstname: arguments['Members']["First Name"]?? '',loanpendingamount: arguments['Members']["Loan Pending Amount"]?? '',owndepositamount: arguments['Members']["Own deposit Amount"]?? '',
        lastname: arguments['Members']["Last Name"]?? '',
        fathername: arguments['Members']["Father Name"]?? '',
        mothername: arguments['Members']["Mother Name"]?? '',
        gender: arguments['Members']["Gender"]?? '',sts: arguments['Members']["Status"]?? '',
        religion: arguments['Members']["Religion"]?? '',
        nationalid: arguments['Members']["National ID"]?? '',
        birthregi: arguments['Members']["Birth Registration"]?? '',
        annualincome: arguments['Members']["Annual Income"]?? '',
        age: arguments['Members']["Age"]?? '',
        education: arguments['Members']["Education"]?? '',
        maritalstatus: arguments['Members']["Marital Status"]?? '',
        mobilenotype: arguments['Members']["Mobile No Type"]?? '',
        mobilenno: arguments['Members']["Mobile No"]?? '',
        presentadd: arguments['Members']["Present Address"]?? '',
        parmaadd: arguments['Members']["Permanent Address"]?? '',
        livingperiod: arguments['Members']["Living Period"]?? '',
        nomaleearner: arguments['Members']["No Female Earner"]?? '',
        nofemaleearner: arguments['Members']["No Male Earner"]?? '',
        id: arguments['Members']["ID"]?? '',
        headfamily: arguments['Members']["Head Family"]?? '',
        ownhomestead: arguments['Members']["Own HomeStead"]?? '',
        relationwithhead: arguments['Members']["Relation With Head"]?? '',
        landdesc: arguments['Members']["Land Desc"]?? '',
        remarks: arguments['Members']["Remarks"]?? '',
        imageurl: arguments['Members']["ImageURL"]?? '',
        img: arguments['Members']["Image"]?? '',
        birthdate: arguments['Members']["Date Of Birth"]?? '',
        sl: arguments['Members']["sl"]);
    _addinit(mst);
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
      body: loading ? Center(child: CircularProgressIndicator(),):SingleChildScrollView(
        child: Column(
          children: [
            NavbarScreenMFS(
              appbool: widget.appbool,
              navbool: widget.navbool,
            ),

            SizedBox(
              height: 50,
            ),

            SamiteeSelectionUpdate(
                submit: true,
                selectmember: false,
                clear: true,
                mst: mst,
                ssomitee: ssomitee,
                close: true,
                setupsomiti: _setupsomiti,
                active: true,
                selectedsomiteeid: selectedsomiti,
                onsubmit: _save,
                somitee: somitee,
                onclear: _onclear,
                selectedsomitee: sselectedsomiti),

            SizedBox(
              height: 50,
            ),

            // BASIC INFO SCREEN
            SingleRow(
              heading: 'Basic Information',
              field1: 'Member Type:',
              setupoccupationtype: _setupoccupationtype,
              field2: 'Main Occupation:',
              setupmembertype: _setupmembertype,
              membertype: selectedmebertype,
              ocupation: selectedocupation,
            ),

            SizedBox(
              height: 50,
            ),

            // PERSONAL INFORMATION SCREEN
            PersonalInfoForm(
                firstname: _firstname,
                selectedGender: selectedGender,
                religion: selectedreligion,
                selectedDate: _selectedDate,selectDate: _selectDate,
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

            SizedBox(
              height: 50,
            ),

            // CONTACT INFORMATION SCREEN
            ContactForm(
                mobiletype: mobiletype,
                mobileno: _mobileno,
                setupmobileType: _setupmobileType,
                preseentaddress: _preseentaddress,
                parmaaddress: _parmaaddress),

            SizedBox(
              height: 50,
            ),

            // OTHER'S INFORMATION
            OtherInfo(
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
                reference: _housedesc,
                remarks: _remarks),

            SizedBox(
              height: 50,
            ),

            // MEMBER IMAGE
            desktop
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
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                            backgroundColor: Colors.white,
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
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    child: url ?Image.network(
                                      imgurl,
                                      fit: BoxFit.cover,
                                    ) :img
                                        ? Image.memory(
                                            pickedImage,
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
                                                            child:
                                                                ElevatedButton(
                                                              style:
                                                                  ElevatedButton
                                                                      .styleFrom(
                                                                backgroundColor: Colors
                                                                    .white,
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
                                                                style:
                                                                    TextStyle(
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
                                          child: url ?Image.network(
                                            imgurl,
                                            fit: BoxFit.cover,
                                          ) :img
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
                                                      padding: EdgeInsets.only(
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
                                                            child:
                                                                ElevatedButton(
                                                              style:
                                                                  ElevatedButton
                                                                      .styleFrom(
                                                                backgroundColor: Colors
                                                                    .white,
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
                                                                style:
                                                                    TextStyle(
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
                                          child: url ?Image.network(
                                            imgurl,
                                            fit: BoxFit.cover,
                                          ) :img
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

            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
