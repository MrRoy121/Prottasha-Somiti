import 'dart:convert';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import 'package:get/get.dart';
import 'package:prottashasomit/helpers/auth_service.dart';
import 'package:prottashasomit/route.dart';
import '../../Constants/values.dart';
import '../../model/User.dart';

class AddUser extends StatefulWidget {
  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  String loinlout = "";
  bool first = false;
  var _selectedtype;
  int _sts = 1;
  final _conmanname = TextEditingController();
  final _conmanphone = TextEditingController();
  final _conmanid = TextEditingController();
  final _conmanpass = TextEditingController();
  final _conmandetails = TextEditingController();

  _addUser() async {
    String mname = _conmanname.text;
    String mphone = _conmanphone.text;
    String mid = _conmanid.text;
    String mpass = _conmanpass.text;
    String mdetails = _conmandetails.text;

    const _chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    Random _rnd = Random();
    String getRandomString(int length) =>
        String.fromCharCodes(Iterable.generate(
            length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
    String ss = getRandomString(20);
    bool cstats = true;

    if (_sts == 2) {
      cstats = false;
    }
    if (mname.isEmpty ||
        mphone.isEmpty ||
        mid.isEmpty ||
        mdetails.isEmpty ||
        _selectedtype == null ||
        mpass.isEmpty) {
      Get.snackbar("Invalid Format.",
          "User's Name, Phone, Address and Previous Balance is Required",
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
      FirebaseFirestore.instance.collection('User').doc(ss).update({
        'Name': mname,
        'Phone': mphone,
        'ID': mid,
        'Type': _selectedtype,
        'Status': cstats,
        'User': AuthService.to.user!.name,
        "Last Login": DateTime.now(),
        "Last Logout": DateTime.now(),
        'Password': mpass,
        'Details': mdetails,
      }).then((valu) {
        Get.offNamed(userlistPageRoute);
        Get.snackbar(
            "Saved User Successfully.", "Redirected to User List Page!",
            snackPosition: SnackPosition.BOTTOM,
            colorText: Colors.white,
            backgroundColor: Colors.green,
            margin: EdgeInsets.zero,
            duration: const Duration(milliseconds: 2000),
            boxShadows: [
              BoxShadow(
                  color: Colors.grey, offset: Offset(-100, 0), blurRadius: 20),
            ],
            borderRadius: 0);
      }).catchError((error) => print("Failed to add user: $error"));
    }
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          margin: EdgeInsets.only(
              top: 20, left: _width / 6, right: _width / 6, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Add User",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
              ),
              Container(
                margin: EdgeInsets.only(top: _height / 25, left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        flex: 10,
                        child: Text(
                          "User's Name",
                          style: TextStyle(fontSize: 16),
                        )),
                    Expanded(
                      child: SizedBox(
                        height: 1,
                      ),
                      flex: 1,
                    ),
                    Expanded(
                      flex: 10,
                      child: Text(
                        "Phone Number",
                        style: TextStyle(fontSize: 16),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 10,
                      child: Container(
                        child: TextFormField(
                          controller: _conmanname,
                          decoration: InputDecoration(
                            enabledBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                            hintText: "Users Name",
                            fillColor: Colors.grey.shade200,
                            filled: true,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 1,
                      ),
                      flex: 1,
                    ),
                    Expanded(
                      flex: 10,
                      child: Container(
                        child: TextFormField(
                          controller: _conmanphone,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                            hintText: "Phone Number",
                            fillColor: Colors.grey.shade200,
                            filled: true,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: _height / 25, left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        flex: 10,
                        child: Text(
                          "ID",
                          style: TextStyle(fontSize: 16),
                        )),
                    const Expanded(
                      flex: 1,
                      child: SizedBox(
                        height: 1,
                      ),
                    ),
                    Expanded(
                      flex: 10,
                      child: Text(
                        "Password",
                        style: TextStyle(fontSize: 16),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 10,
                      child: Container(
                        child: TextFormField(
                          controller: _conmanid,
                          decoration: InputDecoration(
                            enabledBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                            hintText: "User ID",
                            fillColor: Colors.grey.shade200,
                            filled: true,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 1,
                      ),
                      flex: 1,
                    ),
                    Expanded(
                      flex: 10,
                      child: Container(
                        child: TextFormField(
                          controller: _conmanpass,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                            hintText: "Password",
                            fillColor: Colors.grey.shade200,
                            filled: true,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: _height / 25, left: 10, right: 10),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        flex: 10,
                        child: Text(
                          "Role",
                          style: TextStyle(fontSize: 16),
                        )),
                    Expanded(
                      child: SizedBox(
                        height: 1,
                      ),
                      flex: 1,
                    ),
                    Expanded(
                      flex: 10,
                      child: Text(
                        "Status",
                        style: TextStyle(fontSize: 16),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 10,
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.grey.shade200,
                        ),
                        child: DropdownButton(
                          underline: SizedBox(),
                          isExpanded: true,
                          hint: Text('Select User Type'),
                          value: _selectedtype,
                          onChanged: (Value) {
                            setState(() {
                              _selectedtype = Value.toString();
                            });
                          },
                          items: UserTypeList.map((location) {
                            return DropdownMenuItem(
                              value: location,
                              child: Text(location),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    const Expanded(
                      child: SizedBox(
                        height: 1,
                      ),
                      flex: 1,
                    ),
                    Expanded(
                      flex: 10,
                      child: Container(
                        margin: EdgeInsets.only(left: 5),
                        child: Column(
                          children: [
                            RadioListTile(
                              title: Text("Enabled"),
                              value: 1,
                              groupValue: _sts,
                              onChanged: (value) {
                                setState(() {
                                  _sts = int.parse(value.toString());
                                });
                              },
                            ),
                            RadioListTile(
                              title: Text("Disabled"),
                              value: 2,
                              groupValue: _sts,
                              onChanged: (value) {
                                setState(() {
                                  print(_sts);
                                  _sts = int.parse(value.toString());
                                  print(_sts);
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 0, left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        flex: 10,
                        child: Text(
                          "Details",
                          style: TextStyle(fontSize: 16),
                        )),
                    Expanded(
                      child: SizedBox(
                        height: 1,
                      ),
                      flex: 1,
                    ),
                    Expanded(
                      flex: 10,
                      child: SizedBox(),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 10,
                      child: Container(
                        child: TextFormField(
                          controller: _conmandetails,
                          decoration: InputDecoration(
                            enabledBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                            hintText: "Details",
                            fillColor: Colors.grey.shade200,
                            filled: true,
                          ),
                        ),
                      ),
                    ),
                    const Expanded(
                      flex: 1,
                      child: SizedBox(
                        height: 1,
                      ),
                    ),
                    Expanded(
                      flex: 10,
                      child: Container(),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: _height / 25, left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: ElevatedButton(
                          onPressed: () {
                            _addUser();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            elevation: 20,
                            padding: const EdgeInsets.symmetric(vertical: 20),
                          ),
                          child: const Text(
                            "Submit",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 1,
                      ),
                      flex: 3,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
