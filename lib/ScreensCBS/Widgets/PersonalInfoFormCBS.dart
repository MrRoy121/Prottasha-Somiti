import 'package:flutter/material.dart';

import '../../../Constants/Constants.dart';
import '../../Constants/values.dart';

class PersonalInfoFormCBS extends StatefulWidget {
  var firstname;
  var lastname;
  var fathername;
  var mothername;
  var nidnumber;
  var birthreginumber;
  var age;
  var sectorcode;
  var onbehalforrm;
  var education;
  var selectedcustomertype;
  var selectedispsb;

  void Function(int) setupmaritalstatus;
  void Function(int) setupcustomertype;
  void Function(int) setupispsb;
  void Function(int) setupgender;
  void Function(int) setupreligion;
  var selectedGender;
  var religion;
  DateTime selectedDate;
  var maritalstatus;

  PersonalInfoFormCBS(
      {required this.firstname,
      required this.selectedGender,
        required this.sectorcode,
        required this.onbehalforrm,
      required this.religion,
      required this.selectedDate,
      required this.maritalstatus,
      required this.setupreligion,
      required this.selectedcustomertype,
      required this.selectedispsb,
      required this.setupcustomertype,
      required this.setupispsb,
      required this.lastname,
      required this.fathername,
      required this.mothername,
      required this.setupmaritalstatus,
      required this.setupgender,
      required this.nidnumber,
      required this.birthreginumber,
      required this.age,
      required this.education});

  @override
  State<PersonalInfoFormCBS> createState() => _PersonalInfoFormCBSState();
}

class _PersonalInfoFormCBSState extends State<PersonalInfoFormCBS> {
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: widget.selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != widget.selectedDate) {
      setState(() {
        widget.selectedDate = picked;
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

    // if (ResponsiveWidth > 1200) {
    //   desktop = true;
    //   tablet = false;
    //   mobile = false;
    // } else if (ResponsiveWidth > 520) {
    //   tablet = true;
    //   desktop = false;
    //   mobile = false;
    // } else {
    //   mobile = true;
    //   desktop = false;
    //   tablet = false;
    // }

    return //desktop
        //?
        Container(
      width: ScreenWidth / 1.0971,
      height: 700,
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
        children: [
          Container(
            width: ScreenWidth / 1.0971,
            height: 50,
            color: navbarColor,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    "Personal Information",
                    style: TextStyle(
                      color: AppColor,
                      fontWeight: FontWeight.bold,
                      fontSize: ScreenWidth / 96,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: ScreenWidth / 30.72, left: ScreenWidth / 10.24),
            child: Row(
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        RichText(
                          text: TextSpan(
                            text: 'Customer Type',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: ScreenWidth / 109.71),
                            children: <TextSpan>[
                              TextSpan(
                                  text: ' *',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red,
                                      fontSize: ScreenWidth / 109.71)),
                              TextSpan(
                                  text: ' :',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: ScreenWidth / 109.71)),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 65,
                        ),
                        SizedBox(
                          height: ScreenWidth / 30.72,
                          width: ScreenWidth / 5.12,
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: AppColor_greyBorder,
                              border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: AppColor_greyBorder),
                              ),
                              hintText: "Select",
                              hintStyle: TextStyle(
                                fontSize: ScreenWidth / 109.71,
                                color: AppColor_greyText,
                              ),
                            ),
                            value: widget.selectedcustomertype,
                            onChanged: (newValue) {
                              setState(() {
                                widget.setupcustomertype(
                                    CustomerTypeList.indexOf(newValue!));
                              });
                            },
                            items: CustomerTypeList.map((item) {
                              return DropdownMenuItem(
                                value: item,
                                child: Text(
                                  item,
                                  style:
                                      TextStyle(fontSize: ScreenWidth / 109.71),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        RichText(
                          text: TextSpan(
                            text: 'First/ Institution Name',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: ScreenWidth / 109.71),
                            children: <TextSpan>[
                              TextSpan(
                                  text: ' *',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red,
                                      fontSize: ScreenWidth / 109.71)),
                              TextSpan(
                                  text: ' :',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: ScreenWidth / 109.71)),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 22,
                        ),
                        SizedBox(
                          width: ScreenWidth / 5.12,
                          height: ScreenWidth / 30.72,
                          child: TextField(
                            controller: widget.firstname,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.symmetric(vertical: 2),
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
                        RichText(
                          text: TextSpan(
                            text: 'Father Name',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: ScreenWidth / 109.71),
                            children: <TextSpan>[
                              TextSpan(
                                  text: ' *',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red,
                                      fontSize: ScreenWidth / 109.71)),
                              TextSpan(
                                  text: ' :',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: ScreenWidth / 109.71)),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: ScreenWidth / 19.2,
                        ),
                        SizedBox(
                          width: ScreenWidth / 5.12,
                          height: ScreenWidth / 30.72,
                          child: TextField(
                            controller: widget.fathername,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.symmetric(vertical: 2),
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
                        RichText(
                          text: TextSpan(
                            text: 'Gender',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: ScreenWidth / 109.71),
                            children: <TextSpan>[
                              TextSpan(
                                text: ' *',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red,
                                    fontSize: ScreenWidth / 109.71),
                              ),
                              TextSpan(
                                text: ' :',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: ScreenWidth / 109.71),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: ScreenWidth / 8.53),
                        Row(
                          children: [
                            Radio(
                              value: 'Male',
                              groupValue: widget.selectedGender,
                              onChanged: (value) {
                                setState(() {
                                  widget.selectedGender = value.toString();
                                  widget.setupgender(1);
                                });
                              },
                            ),
                            Text(
                              'Male',
                              style: TextStyle(fontSize: ScreenWidth / 109.71),
                            ),
                            SizedBox(width: ScreenWidth / 153.6),
                            Radio(
                              value: 'Female',
                              groupValue: widget.selectedGender,
                              onChanged: (value) {
                                setState(() {
                                  widget.selectedGender = value.toString();
                                  widget.setupgender(2);
                                });
                              },
                            ),
                            Text(
                              'Female',
                              style: TextStyle(fontSize: ScreenWidth / 109.71),
                            ),
                            SizedBox(width: ScreenWidth / 153.6),
                            Radio(
                              value: 'Others',
                              groupValue: widget.selectedGender,
                              onChanged: (value) {
                                setState(() {
                                  widget.selectedGender = value.toString();
                                  widget.setupgender(3);
                                });
                              },
                            ),
                            Text(
                              'Others',
                              style: TextStyle(fontSize: ScreenWidth / 109.71),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        RichText(
                          text: TextSpan(
                            text: 'National ID',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: ScreenWidth / 109.71),
                            children: <TextSpan>[
                              TextSpan(
                                  text: ' *',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red,
                                      fontSize: ScreenWidth / 109.71)),
                              TextSpan(
                                  text: ' :',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: ScreenWidth / 109.71)),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: ScreenWidth / 17.067,
                        ),
                        SizedBox(
                          height: ScreenWidth / 30.72,
                          width: ScreenWidth / 5.12,
                          child: TextField(
                            controller: widget.nidnumber,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.symmetric(vertical: 2),
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
                        RichText(
                          text: TextSpan(
                            text: 'Date of Birth',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: ScreenWidth / 109.71),
                            children: <TextSpan>[
                              TextSpan(
                                  text: ' *',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red,
                                      fontSize: ScreenWidth / 109.71)),
                              TextSpan(
                                  text: ' :',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: ScreenWidth / 109.71)),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: ScreenWidth / 18.07,
                        ),
                        SizedBox(
                          width: ScreenWidth / 5.12,
                          height: ScreenWidth / 30.72,
                          child: InkWell(
                            onTap: () => _selectDate(context),
                            child: AbsorbPointer(
                              child: TextField(
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  hintText: widget.selectedDate != null
                                      ? "${widget.selectedDate!.day}-${widget.selectedDate!.month}-${widget.selectedDate!.year}"
                                      : "Select a date",
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: ScreenWidth / 109.71,
                                  ),
                                  suffixIcon: Icon(Icons.calendar_month_sharp,
                                      size: ScreenWidth / 109.71,
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
                          "On Behalf Of RM: ",
                          style: TextStyle(
                            fontSize: ScreenWidth / 109.71,
                          ),
                        ),
                        SizedBox(
                          width: 70,
                        ),
                        SizedBox(
                          height: ScreenWidth / 30.72,
                          width: ScreenWidth / 5.12,
                          child: TextField(
                            controller: widget.onbehalforrm,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.symmetric(vertical: 2),
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
                        RichText(
                          text: TextSpan(
                            text: 'Marital Status',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: ScreenWidth / 109.71),
                            children: <TextSpan>[
                              TextSpan(
                                  text: ' *',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red,
                                      fontSize: ScreenWidth / 109.71)),
                              TextSpan(
                                  text: ' :',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: ScreenWidth / 109.71)),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: ScreenWidth / 19.2,
                        ),
                        SizedBox(
                          height: ScreenWidth / 30.72,
                          width: ScreenWidth / 5.12,
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: AppColor_greyBorder,
                              border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: AppColor_greyBorder),
                              ),
                              hintText: "Select",
                              hintStyle: TextStyle(
                                  color: AppColor_greyText,
                                  fontSize: ScreenWidth / 109.71),
                            ),
                            value: widget.maritalstatus,
                            onChanged: (newValue) {
                              setState(() {
                                widget.setupmaritalstatus(
                                    MaritalstatusList.indexOf(newValue!));
                              });
                            },
                            items: MaritalstatusList.map((item) {
                              return DropdownMenuItem(
                                value: item,
                                child: Text(item),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  width: ScreenWidth / 10.24,
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        RichText(
                          text: TextSpan(
                            text: 'Is PSB Employee',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: ScreenWidth / 109.71),
                            children: <TextSpan>[
                              TextSpan(
                                text: ' *',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red,
                                    fontSize: ScreenWidth / 109.71),
                              ),
                              TextSpan(
                                text: ' :',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: ScreenWidth / 109.71),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 150),
                        Row(
                          children: [
                            Radio(
                              value: 'Yes',
                              groupValue: widget.selectedispsb,
                              onChanged: (value) {
                                widget.setupispsb(1);
                              },
                            ),
                            Text(
                              'Yes',
                              style: TextStyle(fontSize: ScreenWidth / 109.71),
                            ),
                            SizedBox(width: ScreenWidth / 153.6),
                            Radio(
                              value: 'No',
                              groupValue: widget.selectedispsb,
                              onChanged: (value) {
                                widget.setupispsb(2);
                              },
                            ),
                            Text(
                              'No',
                              style: TextStyle(fontSize: ScreenWidth / 109.71),
                            ),
                            SizedBox(width: ScreenWidth / 16.6),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        RichText(
                          text: TextSpan(
                            text: 'Last/ Institution Name',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: ScreenWidth / 109.71),
                            children: <TextSpan>[
                              TextSpan(
                                  text: ' *',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red,
                                      fontSize: ScreenWidth / 109.71)),
                              TextSpan(
                                  text: ' :',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: ScreenWidth / 109.71)),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        SizedBox(
                          height: ScreenWidth / 30.72,
                          width: ScreenWidth / 5.12,
                          child: TextField(
                            controller: widget.lastname,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.symmetric(vertical: 2),
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
                        RichText(
                          text: TextSpan(
                            text: 'Mother Name',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: ScreenWidth / 109.71),
                            children: <TextSpan>[
                              TextSpan(
                                  text: ' *',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red,
                                      fontSize: ScreenWidth / 109.71)),
                              TextSpan(
                                  text: ' :',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: ScreenWidth / 109.71)),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: ScreenWidth / 19.2,
                        ),
                        SizedBox(
                          height: ScreenWidth / 30.72,
                          width: ScreenWidth / 5.12,
                          child: TextField(
                            controller: widget.mothername,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.symmetric(vertical: 2),
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
                        RichText(
                          text: TextSpan(
                            text: 'Religion',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: ScreenWidth / 109.71),
                            children: <TextSpan>[
                              TextSpan(
                                  text: ' *',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red,
                                      fontSize: ScreenWidth / 109.71)),
                              TextSpan(
                                  text: ' :',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: ScreenWidth / 109.71)),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: ScreenWidth / 12.8,
                        ),
                        SizedBox(
                          height: ScreenWidth / 30.72,
                          width: ScreenWidth / 5.12,
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: AppColor_greyBorder,
                              border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: AppColor_greyBorder),
                              ),
                              hintText: "Select",
                              hintStyle: TextStyle(
                                fontSize: ScreenWidth / 109.71,
                                color: AppColor_greyText,
                              ),
                            ),
                            value: widget.religion,
                            onChanged: (newValue) {
                              setState(() {
                                widget.setupreligion(
                                    ReligionList.indexOf(newValue!));
                              });
                            },
                            items: ReligionList.map((item) {
                              return DropdownMenuItem(
                                value: item,
                                child: Text(
                                  item,
                                  style:
                                      TextStyle(fontSize: ScreenWidth / 109.71),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        RichText(
                          text: TextSpan(
                            text: 'Birth Registration No',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: ScreenWidth / 109.71),
                            children: <TextSpan>[
                              TextSpan(
                                  text: ' *',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red,
                                      fontSize: ScreenWidth / 109.71)),
                              TextSpan(
                                  text: ' :',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: ScreenWidth / 109.71)),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: ScreenWidth / 34.13,
                        ),
                        SizedBox(
                          height: ScreenWidth / 30.72,
                          width: ScreenWidth / 5.12,
                          child: TextField(
                            controller: widget.birthreginumber,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.symmetric(vertical: 2),
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
                          "Age: ",
                          style: TextStyle(
                            fontSize: ScreenWidth / 109.71,
                          ),
                        ),
                        SizedBox(
                          width: ScreenWidth / 9.6,
                        ),
                        SizedBox(
                          height: ScreenWidth / 30.72,
                          width: ScreenWidth / 5.12,
                          child: TextField(
                            controller: widget.age,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: ScreenWidth / 768),
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
                          "Educational Qualification : ",
                          style: TextStyle(
                            fontSize: ScreenWidth / 109.71,
                          ),
                        ),
                        SizedBox(
                          width: ScreenWidth / 66.78,
                        ),
                        SizedBox(
                          height: ScreenWidth / 30.72,
                          width: ScreenWidth / 5.12,
                          child: TextField(
                            controller: widget.education,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: ScreenWidth / 768),
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
                          "Sector Code : ",
                          style: TextStyle(
                            fontSize: ScreenWidth / 109.71,
                          ),
                        ),
                        SizedBox(
                          width: 107,
                        ),
                        SizedBox(
                          height: ScreenWidth / 30.72,
                          width: ScreenWidth / 5.12,
                          child: TextField(
                            controller: widget.sectorcode,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: ScreenWidth / 768),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
    // : tablet
    //     ? Container(
    //         width: 1200,
    //         height: 1200,
    //         // color: Colors.white,
    //
    //         decoration: BoxDecoration(
    //           color: Colors.white,
    //           boxShadow: [
    //             BoxShadow(
    //               color: Colors.grey.withOpacity(0.3),
    //               spreadRadius: 2,
    //               blurRadius: 5,
    //               offset: Offset(0, 2),
    //             ),
    //           ],
    //         ),
    //
    //         child: Column(
    //           children: [
    //             Container(
    //               width: 1200,
    //               height: 20,
    //               color: navbarColor,
    //               child: Row(
    //                 crossAxisAlignment: CrossAxisAlignment.center,
    //                 children: [
    //                   Padding(
    //                     padding: EdgeInsets.only(left: 20.0),
    //                     child: Text(
    //                       "Personal Information",
    //                       style: TextStyle(
    //                         color: AppColor,
    //                         fontWeight: FontWeight.bold,
    //                         fontSize: ScreenWidth/96,
    //                       ),
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //             Padding(
    //               padding:
    //                   EdgeInsets.only(top: 50, left: ScreenWidth / 10.24),
    //               child: Column(
    //                 crossAxisAlignment: CrossAxisAlignment.end,
    //                 children: [
    //                   Column(
    //                     children: [
    //                       Row(
    //                         children: [
    //                           RichText(
    //                             text: TextSpan(
    //                               text: 'First Name',
    //                               style: TextStyle(
    //                                   color: Colors.black, fontSize: ScreenWidth/109.71),
    //                               children: <TextSpan>[
    //                                 TextSpan(
    //                                     text: ' *',
    //                                     style: TextStyle(
    //                                         fontWeight: FontWeight.bold,
    //                                         color: Colors.red,
    //                                         fontSize: ScreenWidth/109.71)),
    //                                 TextSpan(
    //                                     text: ' :',
    //                                     style: TextStyle(
    //                                         color: Colors.black,
    //                                         fontSize: ScreenWidth/109.71)),
    //                               ],
    //                             ),
    //                           ),
    //                           SizedBox(
    //                             width: 90,
    //                           ),
    //                           SizedBox(
    //                             width: 250,
    //                             child: TextField(controller: widget.firstname,
    //                               decoration: InputDecoration(
    //                                 border: OutlineInputBorder(),
    //                                 contentPadding:
    //                                     EdgeInsets.symmetric(vertical: 2),
    //                               ),
    //                             ),
    //                           ),
    //                         ],
    //                       ),
    //                       SizedBox(
    //                         height: 20,
    //                       ),
    //                       Row(
    //                         children: [
    //                           RichText(
    //                             text: TextSpan(
    //                               text: 'Father Name',
    //                               style: TextStyle(
    //                                   color: Colors.black, fontSize: ScreenWidth/109.71),
    //                               children: <TextSpan>[
    //                                 TextSpan(
    //                                     text: ' *',
    //                                     style: TextStyle(
    //                                         fontWeight: FontWeight.bold,
    //                                         color: Colors.red,
    //                                         fontSize: ScreenWidth/109.71)),
    //                                 TextSpan(
    //                                     text: ' :',
    //                                     style: TextStyle(
    //                                         color: Colors.black,
    //                                         fontSize: ScreenWidth/109.71)),
    //                               ],
    //                             ),
    //                           ),
    //                           SizedBox(
    //                             width: 80,
    //                           ),
    //                           SizedBox(
    //                             width: 250,
    //                             child: TextField(controller: widget.fathername,
    //                               decoration: InputDecoration(
    //                                 border: OutlineInputBorder(),
    //                                 contentPadding:
    //                                     EdgeInsets.symmetric(vertical: 2),
    //                               ),
    //                             ),
    //                           ),
    //                         ],
    //                       ),
    //                       SizedBox(
    //                         height: 20,
    //                       ),
    //
    //                       Row(
    //                         children: [
    //                           RichText(
    //                             text: const TextSpan(
    //                               text: 'Gender',
    //                               style: TextStyle(
    //                                   color: Colors.black, fontSize: ScreenWidth/109.71),
    //                               children: <TextSpan>[
    //                                 TextSpan(
    //                                   text: ' *',
    //                                   style: TextStyle(
    //                                       fontWeight: FontWeight.bold,
    //                                       color: Colors.red,
    //                                       fontSize: ScreenWidth/109.71),
    //                                 ),
    //                                 TextSpan(
    //                                   text: ' :',
    //                                   style: TextStyle(
    //                                       color: Colors.black, fontSize: ScreenWidth/109.71),
    //                                 ),
    //                               ],
    //                             ),
    //                           ),
    //                           SizedBox(width: 180),
    //                           Row(
    //                             children: [
    //                               Radio(
    //                                 value: 'Male',
    //                                 groupValue: widget.selectedGender,
    //                                 onChanged: (value) {
    //                                   setState(() {
    //                                     widget.selectedGender = value.toString();
    //                                     widget.setupgender(1);
    //                                   });
    //                                 },
    //                               ),
    //                               Text('Male'),
    //                               SizedBox(width: 10),
    //                               Radio(
    //                                 value: 'Female',
    //                                 groupValue: widget.selectedGender,
    //                                 onChanged: (value) {
    //                                   setState(() {
    //                                     widget.selectedGender = value.toString();
    //                                     widget.setupgender(2);
    //                                   });
    //                                 },
    //                               ),
    //                               Text('Female'),
    //                               SizedBox(width: 10),
    //                               Radio(
    //                                 value: 'Others',
    //                                 groupValue: widget.selectedGender,
    //                                 onChanged: (value) {
    //                                   setState(() {
    //                                     widget.selectedGender = value.toString();
    //                                     widget.setupgender(3);
    //                                   });
    //                                 },
    //                               ),
    //                               Text('Others'),
    //                             ],
    //                           ),
    //                         ],
    //                       ),
    //                       SizedBox(
    //                         height: 20,
    //                       ),
    //                       Row(
    //                         children: [
    //                           RichText(
    //                             text: TextSpan(
    //                               text: 'National ID',
    //                               style: TextStyle(
    //                                   color: Colors.black, fontSize: ScreenWidth/109.71),
    //                               children: <TextSpan>[
    //                                 TextSpan(
    //                                     text: ' *',
    //                                     style: TextStyle(
    //                                         fontWeight: FontWeight.bold,
    //                                         color: Colors.red,
    //                                         fontSize: ScreenWidth/109.71)),
    //                                 TextSpan(
    //                                     text: ' :',
    //                                     style: TextStyle(
    //                                         color: Colors.black,
    //                                         fontSize: ScreenWidth/109.71)),
    //                               ],
    //                             ),
    //                           ),
    //                           SizedBox(
    //                             width: 90,
    //                           ),
    //                           SizedBox(
    //                             width: 250,
    //                             child: TextField(controller: widget.nidnumber,
    //                               decoration: InputDecoration(
    //                                 border: OutlineInputBorder(),
    //                                 contentPadding:
    //                                     EdgeInsets.symmetric(vertical: 2),
    //                               ),
    //                             ),
    //                           ),
    //                         ],
    //                       ),
    //                       SizedBox(
    //                         height: 20,
    //                       ),
    //                       Row(
    //                         children: [
    //                           RichText(
    //                             text: TextSpan(
    //                               text: 'Date of Birth',
    //                               style: TextStyle(
    //                                   color: Colors.black, fontSize: ScreenWidth/109.71),
    //                               children: <TextSpan>[
    //                                 TextSpan(
    //                                     text: ' *',
    //                                     style: TextStyle(
    //                                         fontWeight: FontWeight.bold,
    //                                         color: Colors.red,
    //                                         fontSize: ScreenWidth/109.71)),
    //                                 TextSpan(
    //                                     text: ' :',
    //                                     style: TextStyle(
    //                                         color: Colors.black,
    //                                         fontSize: ScreenWidth/109.71)),
    //                               ],
    //                             ),
    //                           ),
    //                           SizedBox(
    //                             width: 80,
    //                           ),
    //                           SizedBox(
    //                             width: 250,
    //                             child: InkWell(
    //                               onTap: () => _selectDate(context),
    //                               child: AbsorbPointer(
    //                                 child: TextField(
    //                                   decoration: InputDecoration(
    //                                     filled: true,
    //                                     fillColor: Colors.white,
    //                                     border: OutlineInputBorder(
    //                                       borderSide: BorderSide(
    //                                           color: Colors.grey),
    //                                     ),
    //                                     hintText: widget.selectedDate != null
    //                                         ? "${widget.selectedDate!.day}-${widget.selectedDate!.month}-${widget.selectedDate!.year}"
    //                                         : "Select a date",
    //                                     hintStyle: TextStyle(
    //                                       color: Colors.grey,
    //                                     ),
    //                                     suffixIcon: Icon(
    //                                         Icons.calendar_month_sharp,
    //                                         color: Colors.grey),
    //                                   ),
    //                                 ),
    //                               ),
    //                             ),
    //                           ),
    //                         ],
    //                       ),
    //                       SizedBox(
    //                         height: 20,
    //                       ),
    //                       Row(
    //                         children: [
    //                           Text(
    //                             "No of Dependable Member: ",
    //                             style: TextStyle(
    //                               fontSize: ScreenWidth/109.71,
    //                             ),
    //                           ),
    //                           SizedBox(
    //                             width: 5,
    //                           ),
    //                           SizedBox(
    //                             width: 250,
    //                             child: TextField(controller: widget.dependablemember,
    //                               decoration: InputDecoration(
    //                                 border: OutlineInputBorder(),
    //                                 contentPadding:
    //                                     EdgeInsets.symmetric(vertical: 2),
    //                               ),
    //                             ),
    //                           ),
    //                         ],
    //                       ),
    //                       SizedBox(
    //                         height: 20,
    //                       ),
    //                       Row(
    //                         children: [
    //                           RichText(
    //                             text: TextSpan(
    //                               text: 'Marital Status',
    //                               style: TextStyle(
    //                                   color: Colors.black, fontSize: ScreenWidth/109.71),
    //                               children: <TextSpan>[
    //                                 TextSpan(
    //                                     text: ' *',
    //                                     style: TextStyle(
    //                                         fontWeight: FontWeight.bold,
    //                                         color: Colors.red,
    //                                         fontSize: ScreenWidth/109.71)),
    //                                 TextSpan(
    //                                     text: ' :',
    //                                     style: TextStyle(
    //                                         color: Colors.black,
    //                                         fontSize: ScreenWidth/109.71)),
    //                               ],
    //                             ),
    //                           ),
    //                           SizedBox(
    //                             width: 90,
    //                           ),
    //                           SizedBox(
    //                             width: 250,
    //                             child: DropdownButtonFormField<String>(
    //                               decoration: InputDecoration(
    //                                 filled: true,
    //                                 fillColor: AppColor_greyBorder,
    //                                 border: OutlineInputBorder(
    //                                   borderSide: BorderSide(
    //                                       color: AppColor_greyBorder),
    //                                 ),
    //                                 hintText: "Select",
    //                                 hintStyle: TextStyle(
    //                                   color: AppColor_greyText,
    //                                 ),
    //                               ),
    //                               value: widget.maritalstatus,
    //                               onChanged: (newValue) {setState(() {
    //                                 widget.setupmaritalstatus(MaritalstatusList.indexOf(newValue!));
    //                               });},
    //                               items: MaritalstatusList
    //                                   .map((item) {
    //                                 return DropdownMenuItem(
    //                                   value: item,
    //                                   child: Text(item),
    //                                 );
    //                               }).toList(),
    //                             ),
    //                           ),
    //                         ],
    //                       ),
    //                     ],
    //                   ),
    //                   SizedBox(
    //                     height: 50,
    //                   ),
    //                   Column(
    //                     children: [
    //                       Row(
    //                         children: [
    //                           RichText(
    //                             text: TextSpan(
    //                               text: 'Last Name',
    //                               style: TextStyle(
    //                                   color: Colors.black, fontSize: ScreenWidth/109.71),
    //                               children: <TextSpan>[
    //                                 TextSpan(
    //                                     text: ' *',
    //                                     style: TextStyle(
    //                                         fontWeight: FontWeight.bold,
    //                                         color: Colors.red,
    //                                         fontSize: ScreenWidth/109.71)),
    //                                 TextSpan(
    //                                     text: ' :',
    //                                     style: TextStyle(
    //                                         color: Colors.black,
    //                                         fontSize: ScreenWidth/109.71)),
    //                               ],
    //                             ),
    //                           ),
    //                           SizedBox(
    //                             width: 90,
    //                           ),
    //                           SizedBox(
    //                             width: 250,
    //                             child: TextField(controller: widget.lastname,
    //                               decoration: InputDecoration(
    //                                 border: OutlineInputBorder(),
    //                                 contentPadding:
    //                                     EdgeInsets.symmetric(vertical: 2),
    //                               ),
    //                             ),
    //                           ),
    //                         ],
    //                       ),
    //                       SizedBox(
    //                         height: 20,
    //                       ),
    //                       Row(
    //                         children: [
    //                           RichText(
    //                             text: TextSpan(
    //                               text: 'Mother Name',
    //                               style: TextStyle(
    //                                   color: Colors.black, fontSize: ScreenWidth/109.71),
    //                               children: <TextSpan>[
    //                                 TextSpan(
    //                                     text: ' *',
    //                                     style: TextStyle(
    //                                         fontWeight: FontWeight.bold,
    //                                         color: Colors.red,
    //                                         fontSize: ScreenWidth/109.71)),
    //                                 TextSpan(
    //                                     text: ' :',
    //                                     style: TextStyle(
    //                                         color: Colors.black,
    //                                         fontSize: ScreenWidth/109.71)),
    //                               ],
    //                             ),
    //                           ),
    //                           SizedBox(
    //                             width: 80,
    //                           ),
    //                           SizedBox(
    //                             width: 250,
    //                             child: TextField(controller: widget.mothername,
    //                               decoration: InputDecoration(
    //                                 border: OutlineInputBorder(),
    //                                 contentPadding:
    //                                     EdgeInsets.symmetric(vertical: 2),
    //                               ),
    //                             ),
    //                           ),
    //                         ],
    //                       ),
    //                       SizedBox(
    //                         height: 20,
    //                       ),
    //                       Row(
    //                         children: [
    //                           RichText(
    //                             text: TextSpan(
    //                               text: 'Religion',
    //                               style: TextStyle(
    //                                   color: Colors.black, fontSize: ScreenWidth/109.71),
    //                               children: <TextSpan>[
    //                                 TextSpan(
    //                                     text: ' *',
    //                                     style: TextStyle(
    //                                         fontWeight: FontWeight.bold,
    //                                         color: Colors.red,
    //                                         fontSize: ScreenWidth/109.71)),
    //                                 TextSpan(
    //                                     text: ' :',
    //                                     style: TextStyle(
    //                                         color: Colors.black,
    //                                         fontSize: ScreenWidth/109.71)),
    //                               ],
    //                             ),
    //                           ),
    //                           SizedBox(
    //                             width: 120,
    //                           ),
    //                           SizedBox(
    //                             width: 250,
    //                             child: DropdownButtonFormField<String>(
    //                               decoration: InputDecoration(
    //                                 filled: true,
    //                                 fillColor: AppColor_greyBorder,
    //                                 border: OutlineInputBorder(
    //                                   borderSide: BorderSide(
    //                                       color: AppColor_greyBorder),
    //                                 ),
    //                                 hintText: "Select",
    //                                 hintStyle: TextStyle(
    //                                   color: AppColor_greyText,
    //                                 ),
    //                               ),
    //                               value: widget.religion,
    //                               onChanged: (newValue) {setState(() {
    //                                 widget.setupreligion(ReligionList.indexOf(newValue!));
    //                               });},
    //                               items: ReligionList.map((item) {
    //                                 return DropdownMenuItem(
    //                                   value: item,
    //                                   child: Text(item),
    //                                 );
    //                               }).toList(),
    //                             ),
    //                           ),
    //                         ],
    //                       ),
    //                       SizedBox(
    //                         height: 20,
    //                       ),
    //                       Row(
    //                         children: [
    //                           RichText(
    //                             text: TextSpan(
    //                               text: 'Birth Registration No',
    //                               style: TextStyle(
    //                                   color: Colors.black, fontSize: ScreenWidth/109.71),
    //                               children: <TextSpan>[
    //                                 TextSpan(
    //                                     text: ' *',
    //                                     style: TextStyle(
    //                                         fontWeight: FontWeight.bold,
    //                                         color: Colors.red,
    //                                         fontSize: ScreenWidth/109.71)),
    //                                 TextSpan(
    //                                     text: ' :',
    //                                     style: TextStyle(
    //                                         color: Colors.black,
    //                                         fontSize: ScreenWidth/109.71)),
    //                               ],
    //                             ),
    //                           ),
    //                           SizedBox(
    //                             width: 50,
    //                           ),
    //                           SizedBox(
    //                             width: 250,
    //                             child: TextField(controller: widget.birthreginumber,
    //                               decoration: InputDecoration(
    //                                 border: OutlineInputBorder(),
    //                                 contentPadding:
    //                                     EdgeInsets.symmetric(vertical: 2),
    //                               ),
    //                             ),
    //                           ),
    //                         ],
    //                       ),
    //                       SizedBox(
    //                         height: 20,
    //                       ),
    //                       Row(
    //                         children: [
    //                           Text(
    //                             "Age: ",
    //                             style: TextStyle(
    //                               fontSize: ScreenWidth/109.71,
    //                             ),
    //                           ),
    //                           SizedBox(
    //                             width: 155,
    //                           ),
    //                           SizedBox(
    //                             width: 250,
    //                             child: TextField(controller: widget.age,
    //                               decoration: InputDecoration(
    //                                 border: OutlineInputBorder(),
    //                                 contentPadding:
    //                                     EdgeInsets.symmetric(vertical: 2),
    //                               ),
    //                             ),
    //                           ),
    //                         ],
    //                       ),
    //                       SizedBox(
    //                         height: 20,
    //                       ),
    //                       Row(
    //                         children: [
    //                           Text(
    //                             "Educational Qualification : ",
    //                             style: TextStyle(
    //                               fontSize: ScreenWidth/109.71,
    //                             ),
    //                           ),
    //                           SizedBox(
    //                             width: 35,
    //                           ),
    //                           SizedBox(
    //                             width: 250,
    //                             child: TextField(controller: widget.education,
    //                               decoration: InputDecoration(
    //                                 border: OutlineInputBorder(),
    //                                 contentPadding:
    //                                     EdgeInsets.symmetric(vertical: 2),
    //                               ),
    //                             ),
    //                           ),
    //                           SizedBox(
    //                             height: 120,
    //                           ),
    //                         ],
    //                       ),
    //                     ],
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           ],
    //         ),
    //       )
    //     : Container(
    //         width: 1200,
    //         height: 1200,
    //         // color: Colors.white,
    //
    //         decoration: BoxDecoration(
    //           color: Colors.white,
    //           boxShadow: [
    //             BoxShadow(
    //               color: Colors.grey.withOpacity(0.3),
    //               spreadRadius: 2,
    //               blurRadius: 5,
    //               offset: Offset(0, 2),
    //             ),
    //           ],
    //         ),
    //
    //         child: Column(
    //           children: [
    //             Container(
    //               width: 1200,
    //               height: 30,
    //               color: navbarColor,
    //               child: Row(
    //                 crossAxisAlignment: CrossAxisAlignment.center,
    //                 children: [
    //                   Padding(
    //                     padding: EdgeInsets.only(left: 20.0),
    //                     child: Text(
    //                       "Personal Information",
    //                       style: TextStyle(
    //                         color: AppColor,
    //                         fontWeight: FontWeight.bold,
    //                         fontSize: 10,
    //                       ),
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //             Padding(
    //               padding:
    //                   EdgeInsets.only(top: 50, left: ScreenWidth / 10.24),
    //               child: Column(
    //                 crossAxisAlignment: CrossAxisAlignment.end,
    //                 children: [
    //                   Column(
    //                     children: [
    //                       Row(
    //                         children: [
    //                           RichText(
    //                             text: TextSpan(
    //                               text: 'First Name',
    //                               style: TextStyle(
    //                                   color: Colors.black, fontSize: 8),
    //                               children: <TextSpan>[
    //                                 TextSpan(
    //                                     text: ' *',
    //                                     style: TextStyle(
    //                                         fontWeight: FontWeight.bold,
    //                                         color: Colors.red,
    //                                         fontSize: 8)),
    //                                 TextSpan(
    //                                     text: ' :',
    //                                     style: TextStyle(
    //                                         color: Colors.black,
    //                                         fontSize: 8)),
    //                               ],
    //                             ),
    //                           ),
    //                           SizedBox(
    //                             width: 50,
    //                           ),
    //                           SizedBox(
    //                             width: 200,
    //                             child: TextField(controller: widget.firstname,
    //                               decoration: InputDecoration(
    //                                 border: OutlineInputBorder(),
    //                                 contentPadding:
    //                                     EdgeInsets.symmetric(vertical: 2),
    //                               ),
    //                             ),
    //                           ),
    //                         ],
    //                       ),
    //                       SizedBox(
    //                         height: 20,
    //                       ),
    //                       Row(
    //                         children: [
    //                           RichText(
    //                             text: TextSpan(
    //                               text: 'Father Name',
    //                               style: TextStyle(
    //                                   color: Colors.black, fontSize: 8),
    //                               children: <TextSpan>[
    //                                 TextSpan(
    //                                     text: ' *',
    //                                     style: TextStyle(
    //                                         fontWeight: FontWeight.bold,
    //                                         color: Colors.red,
    //                                         fontSize: 8)),
    //                                 TextSpan(
    //                                     text: ' :',
    //                                     style: TextStyle(
    //                                         color: Colors.black,
    //                                         fontSize: 8)),
    //                               ],
    //                             ),
    //                           ),
    //                           SizedBox(
    //                             width: 50,
    //                           ),
    //                           SizedBox(
    //                             width: 200,
    //                             child: TextField(controller: widget.fathername,
    //                               decoration: InputDecoration(
    //                                 border: OutlineInputBorder(),
    //                                 contentPadding:
    //                                     EdgeInsets.symmetric(vertical: 2),
    //                               ),
    //                             ),
    //                           ),
    //                         ],
    //                       ),
    //                       SizedBox(
    //                         height: 20,
    //                       ),
    //
    //                       Row(
    //                         children: [
    //                           RichText(
    //                             text: const TextSpan(
    //                               text: 'Gender',
    //                               style: TextStyle(
    //                                   color: Colors.black, fontSize: ScreenWidth/109.71),
    //                               children: <TextSpan>[
    //                                 TextSpan(
    //                                   text: ' *',
    //                                   style: TextStyle(
    //                                       fontWeight: FontWeight.bold,
    //                                       color: Colors.red,
    //                                       fontSize: ScreenWidth/109.71),
    //                                 ),
    //                                 TextSpan(
    //                                   text: ' :',
    //                                   style: TextStyle(
    //                                       color: Colors.black, fontSize: ScreenWidth/109.71),
    //                                 ),
    //                               ],
    //                             ),
    //                           ),
    //                           SizedBox(width: 180),
    //                           Row(
    //                             children: [
    //                               Radio(
    //                                 value: 'Male',
    //                                 groupValue: widget.selectedGender,
    //                                 onChanged: (value) {
    //                                   setState(() {
    //                                     widget.selectedGender = value.toString();
    //                                     widget.setupgender(1);
    //                                   });
    //                                 },
    //                               ),
    //                               Text('Male'),
    //                               SizedBox(width: 10),
    //                               Radio(
    //                                 value: 'Female',
    //                                 groupValue: widget.selectedGender,
    //                                 onChanged: (value) {
    //                                   setState(() {
    //                                     widget.selectedGender = value.toString();
    //                                     widget.setupgender(2);
    //                                   });
    //                                 },
    //                               ),
    //                               Text('Female'),
    //                               SizedBox(width: 10),
    //                               Radio(
    //                                 value: 'Others',
    //                                 groupValue: widget.selectedGender,
    //                                 onChanged: (value) {
    //                                   setState(() {
    //                                     widget.selectedGender = value.toString();
    //                                     widget.setupgender(3);
    //                                   });
    //                                 },
    //                               ),
    //                               Text('Others'),
    //                             ],
    //                           ),
    //                         ],
    //                       ),
    //                       SizedBox(
    //                         height: 20,
    //                       ),
    //                       Row(
    //                         children: [
    //                           RichText(
    //                             text: TextSpan(
    //                               text: 'National ID',
    //                               style: TextStyle(
    //                                   color: Colors.black, fontSize: 8),
    //                               children: <TextSpan>[
    //                                 TextSpan(
    //                                     text: ' *',
    //                                     style: TextStyle(
    //                                         fontWeight: FontWeight.bold,
    //                                         color: Colors.red,
    //                                         fontSize: 8)),
    //                                 TextSpan(
    //                                     text: ' :',
    //                                     style: TextStyle(
    //                                         color: Colors.black,
    //                                         fontSize: 8)),
    //                               ],
    //                             ),
    //                           ),
    //                           SizedBox(
    //                             width: 50,
    //                           ),
    //                           SizedBox(
    //                             width: 200,
    //                             child: TextField(controller: widget.nidnumber,
    //                               decoration: InputDecoration(
    //                                 border: OutlineInputBorder(),
    //                                 contentPadding:
    //                                     EdgeInsets.symmetric(vertical: 2),
    //                               ),
    //                             ),
    //                           ),
    //                         ],
    //                       ),
    //                       SizedBox(
    //                         height: 20,
    //                       ),
    //                       Row(
    //                         children: [
    //                           RichText(
    //                             text: TextSpan(
    //                               text: 'Date of Birth',
    //                               style: TextStyle(
    //                                   color: Colors.black, fontSize: 8),
    //                               children: <TextSpan>[
    //                                 TextSpan(
    //                                     text: ' *',
    //                                     style: TextStyle(
    //                                         fontWeight: FontWeight.bold,
    //                                         color: Colors.red,
    //                                         fontSize: 8)),
    //                                 TextSpan(
    //                                     text: ' :',
    //                                     style: TextStyle(
    //                                         color: Colors.black,
    //                                         fontSize: 8)),
    //                               ],
    //                             ),
    //                           ),
    //                           SizedBox(
    //                             width: 50,
    //                           ),
    //                           SizedBox(
    //                             width: 200,
    //                             child: InkWell(
    //                               onTap: () => _selectDate(context),
    //                               child: AbsorbPointer(
    //                                 child: TextField(
    //                                   decoration: InputDecoration(
    //                                     filled: true,
    //                                     fillColor: Colors.white,
    //                                     border: OutlineInputBorder(
    //                                       borderSide: BorderSide(
    //                                           color: Colors.grey),
    //                                     ),
    //                                     hintText: widget.selectedDate != null
    //                                         ? "${widget.selectedDate!.day}-${widget.selectedDate!.month}-${widget.selectedDate!.year}"
    //                                         : "Select a date",
    //                                     hintStyle: TextStyle(
    //                                       color: Colors.grey,
    //                                     ),
    //                                     suffixIcon: Icon(
    //                                         Icons.calendar_month_sharp,
    //                                         color: Colors.grey),
    //                                   ),
    //                                 ),
    //                               ),
    //                             ),
    //                           ),
    //                         ],
    //                       ),
    //                       SizedBox(
    //                         height: 20,
    //                       ),
    //                       Row(
    //                         children: [
    //                           Text(
    //                             "No of Dependable Member: ",
    //                             style: TextStyle(
    //                               fontSize: 8,
    //                             ),
    //                           ),
    //                           SizedBox(
    //                             width: 5,
    //                           ),
    //                           SizedBox(
    //                             width: 200,
    //                             child: TextField(controller: widget.dependablemember,
    //                               decoration: InputDecoration(
    //                                 border: OutlineInputBorder(),
    //                                 contentPadding:
    //                                     EdgeInsets.symmetric(vertical: 2),
    //                               ),
    //                             ),
    //                           ),
    //                         ],
    //                       ),
    //                       SizedBox(
    //                         height: 20,
    //                       ),
    //                       Row(
    //                         children: [
    //                           RichText(
    //                             text: TextSpan(
    //                               text: 'Marital Status',
    //                               style: TextStyle(
    //                                   color: Colors.black, fontSize: 8),
    //                               children: <TextSpan>[
    //                                 TextSpan(
    //                                     text: ' *',
    //                                     style: TextStyle(
    //                                         fontWeight: FontWeight.bold,
    //                                         color: Colors.red,
    //                                         fontSize: 8)),
    //                                 TextSpan(
    //                                     text: ' :',
    //                                     style: TextStyle(
    //                                         color: Colors.black,
    //                                         fontSize: 8)),
    //                               ],
    //                             ),
    //                           ),
    //                           SizedBox(
    //                             width: 50,
    //                           ),
    //                           SizedBox(
    //                             width: 200,
    //                             child: DropdownButtonFormField<String>(
    //                               decoration: InputDecoration(
    //                                 filled: true,
    //                                 fillColor: AppColor_greyBorder,
    //                                 border: OutlineInputBorder(
    //                                   borderSide: BorderSide(
    //                                       color: AppColor_greyBorder),
    //                                 ),
    //                                 hintText: "Select",
    //                                 hintStyle: TextStyle(
    //                                   color: AppColor_greyText,
    //                                   fontSize: 8,
    //                                 ),
    //                               ),
    //                               value: widget.maritalstatus,
    //                               onChanged: (newValue) {setState(() {
    //                                 widget.setupmaritalstatus(MaritalstatusList.indexOf(newValue!));
    //                               });},
    //                               items: MaritalstatusList
    //                                   .map((item) {
    //                                 return DropdownMenuItem(
    //                                   value: item,
    //                                   child: Text(item),
    //                                 );
    //                               }).toList(),
    //                             ),
    //                           ),
    //                         ],
    //                       ),
    //                     ],
    //                   ),
    //                   SizedBox(
    //                     height: 50,
    //                   ),
    //                   Column(
    //                     children: [
    //                       Row(
    //                         children: [
    //                           RichText(
    //                             text: TextSpan(
    //                               text: 'Last Name',
    //                               style: TextStyle(
    //                                   color: Colors.black, fontSize: 8),
    //                               children: <TextSpan>[
    //                                 TextSpan(
    //                                     text: ' *',
    //                                     style: TextStyle(
    //                                         fontWeight: FontWeight.bold,
    //                                         color: Colors.red,
    //                                         fontSize: 8)),
    //                                 TextSpan(
    //                                     text: ' :',
    //                                     style: TextStyle(
    //                                         color: Colors.black,
    //                                         fontSize: 8)),
    //                               ],
    //                             ),
    //                           ),
    //                           SizedBox(
    //                             width: 50,
    //                           ),
    //                           SizedBox(
    //                             width: 200,
    //                             child: TextField(controller: widget.lastname,
    //                               decoration: InputDecoration(
    //                                 border: OutlineInputBorder(),
    //                                 contentPadding:
    //                                     EdgeInsets.symmetric(vertical: 2),
    //                               ),
    //                             ),
    //                           ),
    //                         ],
    //                       ),
    //                       SizedBox(
    //                         height: 20,
    //                       ),
    //                       Row(
    //                         children: [
    //                           RichText(
    //                             text: TextSpan(
    //                               text: 'Mother Name',
    //                               style: TextStyle(
    //                                   color: Colors.black, fontSize: 8),
    //                               children: <TextSpan>[
    //                                 TextSpan(
    //                                     text: ' *',
    //                                     style: TextStyle(
    //                                         fontWeight: FontWeight.bold,
    //                                         color: Colors.red,
    //                                         fontSize: 8)),
    //                                 TextSpan(
    //                                     text: ' :',
    //                                     style: TextStyle(
    //                                         color: Colors.black,
    //                                         fontSize: 8)),
    //                               ],
    //                             ),
    //                           ),
    //                           SizedBox(
    //                             width: 50,
    //                           ),
    //                           SizedBox(
    //                             width: 200,
    //                             child: TextField(controller: widget.mothername,
    //                               decoration: InputDecoration(
    //                                 border: OutlineInputBorder(),
    //                                 contentPadding:
    //                                     EdgeInsets.symmetric(vertical: 2),
    //                               ),
    //                             ),
    //                           ),
    //                         ],
    //                       ),
    //                       SizedBox(
    //                         height: 20,
    //                       ),
    //                       Row(
    //                         children: [
    //                           RichText(
    //                             text: TextSpan(
    //                               text: 'Religion',
    //                               style: TextStyle(
    //                                   color: Colors.black, fontSize: 8),
    //                               children: <TextSpan>[
    //                                 TextSpan(
    //                                     text: ' *',
    //                                     style: TextStyle(
    //                                         fontWeight: FontWeight.bold,
    //                                         color: Colors.red,
    //                                         fontSize: 8)),
    //                                 TextSpan(
    //                                     text: ' :',
    //                                     style: TextStyle(
    //                                         color: Colors.black,
    //                                         fontSize: 8)),
    //                               ],
    //                             ),
    //                           ),
    //                           SizedBox(
    //                             width: 60,
    //                           ),
    //                           SizedBox(
    //                             width: 200,
    //                             child: DropdownButtonFormField<String>(
    //                               decoration: InputDecoration(
    //                                 filled: true,
    //                                 fillColor: AppColor_greyBorder,
    //                                 border: OutlineInputBorder(
    //                                   borderSide: BorderSide(
    //                                       color: AppColor_greyBorder),
    //                                 ),
    //                                 hintText: "Select",
    //                                 hintStyle: TextStyle(
    //                                   color: AppColor_greyText,
    //                                 ),
    //                               ),
    //                               value: widget.religion,
    //                               onChanged: (newValue) {setState(() {
    //                                 widget.setupreligion(ReligionList.indexOf(newValue!));
    //                               });},
    //                               items: ReligionList.map((item) {
    //                                 return DropdownMenuItem(
    //                                   value: item,
    //                                   child: Text(item),
    //                                 );
    //                               }).toList(),
    //                             ),
    //                           ),
    //                         ],
    //                       ),
    //                       SizedBox(
    //                         height: 20,
    //                       ),
    //                       Row(
    //                         children: [
    //                           RichText(
    //                             text: TextSpan(
    //                               text: 'Birth Registration No',
    //                               style: TextStyle(
    //                                   color: Colors.black, fontSize: 8),
    //                               children: <TextSpan>[
    //                                 TextSpan(
    //                                     text: ' *',
    //                                     style: TextStyle(
    //                                         fontWeight: FontWeight.bold,
    //                                         color: Colors.red,
    //                                         fontSize: 8)),
    //                                 TextSpan(
    //                                     text: ' :',
    //                                     style: TextStyle(
    //                                         color: Colors.black,
    //                                         fontSize: 8)),
    //                               ],
    //                             ),
    //                           ),
    //                           SizedBox(
    //                             width: 20,
    //                           ),
    //                           SizedBox(
    //                             width: 200,
    //                             child: TextField(controller: widget.birthreginumber,
    //                               decoration: InputDecoration(
    //                                 border: OutlineInputBorder(),
    //                                 contentPadding:
    //                                     EdgeInsets.symmetric(vertical: 2),
    //                               ),
    //                             ),
    //                           ),
    //                         ],
    //                       ),
    //                       SizedBox(
    //                         height: 20,
    //                       ),
    //                       Row(
    //                         children: [
    //                           Text(
    //                             "Age: ",
    //                             style: TextStyle(
    //                               fontSize: 8,
    //                             ),
    //                           ),
    //                           SizedBox(
    //                             width: 80,
    //                           ),
    //                           SizedBox(
    //                             width: 200,
    //                             child: TextField(controller: widget.age,
    //                               decoration: InputDecoration(
    //                                 border: OutlineInputBorder(),
    //                                 contentPadding:
    //                                     EdgeInsets.symmetric(vertical: 2),
    //                               ),
    //                             ),
    //                           ),
    //                         ],
    //                       ),
    //                       SizedBox(
    //                         height: 20,
    //                       ),
    //                       Row(
    //                         children: [
    //                           Text(
    //                             "Educational Qualification : ",
    //                             style: TextStyle(
    //                               fontSize: 8,
    //                             ),
    //                           ),
    //                           SizedBox(
    //                             width: 5,
    //                           ),
    //                           SizedBox(
    //                             width: 200,
    //                             child: TextField(controller: widget.education,
    //                               decoration: InputDecoration(
    //                                 border: OutlineInputBorder(),
    //                                 contentPadding:
    //                                     EdgeInsets.symmetric(vertical: 2),
    //                               ),
    //                             ),
    //                           ),
    //                           SizedBox(
    //                             height: 120,
    //                           ),
    //                         ],
    //                       ),
    //                     ],
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           ],
    //         ),
    //       );
  }
}
