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

class RegularDepositAccount extends StatefulWidget {
  List<Memberss> memberss;
  bool mmems;
  var selectedmemberss;
  var selectedsamitee;
  var selectedsector;
  Function(int) save;
  RegularDepositAccount(
      {required this.memberss,
        required this.save,
      required this.selectedsector,
      required this.selectedmemberss,
      required this.selectedsamitee,
      required this.mmems});

  @override
  State<RegularDepositAccount> createState() => _RegularDepositAccountState();
}

class _RegularDepositAccountState extends State<RegularDepositAccount> {
  bool img = false;
  late Uint8List pickedImage;

  @override
  void initState() {
    _loadImage();
    // TODO: implement initState
    super.initState();
    fetch();
  }

  Future<void> _loadImage() async {
    ByteData data = await rootBundle.load('Assets/person.jpg');
    pickedImage = data.buffer.asUint8List();
  }

  Future<void> fetch() async {widget.memberss =[];
    await FirebaseFirestore.instance
        .collection('Customer')
        .get()
        .then((querySnapshot) {
      for (var element in querySnapshot.docs) {
        widget.memberss.add(Memberss(
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
            nodepenndent: element['Member']["No of Dependent"],
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
            housedesc: element['Member']["House Desc"],
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
      img = false;
      widget.selectedmemberss = ss;
      widget.mmems = false;
      widget.selectedsamitee = ss;
    });
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
    int _selectedValue = 1;
    var ScreenWidth = MediaQuery.of(context).size.width;

    double ResponsiveWidth = MediaQuery.of(context as BuildContext).size.width;
    double ResponsiveHeight =
        MediaQuery.of(context as BuildContext).size.height;

    bool desktop = false;
    bool tablet = false;
    bool mobile = false;

    Future<void> _setupmemberss(int ins) async {
      widget.selectedmemberss = widget.memberss[ins];
      await FirebaseFirestore.instance
          .collection('Somitee')
          .doc(widget.selectedmemberss.somiteeid)
          .get()
          .then((element) {
        widget.selectedsamitee = Somitee(
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
        widget.mmems = true;
        setState(() {});
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
    return Container(
      margin: EdgeInsets.only(top: 100),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 120),
            width: ScreenWidth / 1.097,
            height: 200,
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
                  height: ScreenWidth / 38.4,
                  color: navbarColor,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: ScreenWidth / 38.4),
                        child: Text(
                          "Regular A/c Opening (Choose A/c Type)",
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
                          widget.save(0);
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
                          if(widget.selectedsector == null && widget.selectedsamitee==null){
                            Get.snackbar(
                                "Next Page Error","Some Required Field is empty.",
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
                            widget.save(3);
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
                Expanded(child: SizedBox()),
                Container(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Transform.scale(
                            scale: 1.5,
                            child: Radio(
                              value: 1,
                              groupValue: _selectedValue,
                              onChanged: (newValue) {
                                setState(() {
                                  _selectedValue = newValue as int;
                                });
                              },
                              activeColor: AppColor_greyText,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          const Text(
                            'Single Account',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Transform.scale(
                            scale: 1.5,
                            child: Radio(
                              value: 2,
                              groupValue: _selectedValue,
                              onChanged: (newValue) {
                                setState(() {
                                  _selectedValue = newValue as int;
                                });
                              },
                              activeColor: AppColor_greyText,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Joint Account',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Transform.scale(
                            scale: 1.5,
                            child: Radio(
                              value: 3,
                              groupValue: _selectedValue,
                              onChanged: (newValue) {
                                setState(() {
                                  _selectedValue = newValue as int;
                                });
                              },
                              activeColor: AppColor_greyText,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Company Account',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(child: SizedBox()),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 30),
            width: 1400,
            height: 380,
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
                  child: const Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 40.0),
                        child: Text(
                          "Account Opening",
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
                Padding(
                  padding: const EdgeInsets.only(top: 50, left: 150),
                  child: Row(
                    children: [
                      Column(
                        children: [
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
                                        widget.selectedmemberss = newValue;
                                        _setupmemberss(
                                            widget.memberss.indexOf(newValue!));
                                      });
                                    },
                                    items: widget.memberss,
                                    selectedItem: widget.selectedmemberss,
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Row(
                            children: [
                              Text(
                                "Open Date :",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(
                                width: 65,
                              ),
                              SizedBox(
                                width: 300,
                                child: Text(
                                    DateFormat.yMMMd().format(DateTime.now())),
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
                                  text: 'Select Sector',
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
                                          "Enter Sector Code",
                                        );
                                      } else {
                                        return Text(
                                          item,
                                        );
                                      }
                                    },
                                    onChanged: (newValue) {
                                      setState(() {
                                        widget.selectedsector = newValue;
                                      });
                                    },
                                    items: SectorList,
                                    selectedItem: widget.selectedsector,
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
                          const SizedBox(
                            height: 40,
                          ),
                          Row(
                            children: [
                              const Text(
                                "Branch Name :",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(
                                width: 65,
                              ),
                              SizedBox(
                                width: 300,
                                child: Text(widget.mmems
                                    ? widget.selectedsamitee.branch.toString()
                                    : ""),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Row(
                            children: [
                              const Text(
                                "Account Type :",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(
                                width: 65,
                              ),
                              SizedBox(
                                width: 300,
                                child: Text(_selectedValue == 1
                                    ? "Single Account"
                                    : _selectedValue == 2
                                        ? "Joint Account"
                                        : _selectedValue == 3
                                            ? "Company Account"
                                            : ""),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          const Row(
                            children: [
                              Text(
                                "Currency :",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(
                                width: 65,
                              ),
                              SizedBox(
                                width: 300,
                                child: Text("BDT"),
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
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: ScreenWidth / 21.94, top: 40),
            child: desktop
                ? Row(
                    children: [
                      PersonalExistinginfo(
                          memberss: widget.selectedmemberss,
                          selectedmember: widget.mmems),
                      Spacer(),
                      widget.selectedmemberss == null
                          ? ImageMember(imgurl: '')
                          : ImageMember(
                              imgurl: widget.selectedmemberss.imageurl),
                    ],
                  )
                : Column(
                    children: [
                      PersonalExistinginfo(
                          memberss: widget.selectedmemberss,
                          selectedmember: widget.mmems),

                      // Spacer(),
                      SizedBox(
                        height: 50,
                      ),

                      widget.selectedmemberss == null
                          ? ImageMember(imgurl: '')
                          : ImageMember(
                              imgurl: widget.selectedmemberss.imageurl,
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
