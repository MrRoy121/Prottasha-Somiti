import 'package:flutter/material.dart';

import '../Constants/Constants.dart';
import '../Constants/values.dart';

class PersonalInfoForm extends StatefulWidget {
  var firstname;
  var lastname;
  var fathername;
  var mothername;
  var nidnumber;
  var birthreginumber;
  var age;
  var dependablemember;
  var education;
  String? selectedGender;
  String? religion;
  DateTime? selectedDate;
  String? maritalstatus;

  PersonalInfoForm(
      {required this.firstname,required this.selectedGender,required this.religion,required this.selectedDate,required this.maritalstatus,
      required this.lastname,
      required this.fathername,
      required this.mothername,
      required this.nidnumber,
      required this.birthreginumber,
      required this.age,
      required this.dependablemember,
      required this.education});

  @override
  State<PersonalInfoForm> createState() => _PersonalInfoFormState();
}

class _PersonalInfoFormState extends State<PersonalInfoForm> {
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

    return desktop
        ? Container(
            width: 1400,
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
                  width: 1400,
                  height: 40,
                  color: navbarColor,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 40.0),
                        child: Text(
                          "Personal Info",
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
                                text: TextSpan(
                                  text: 'First Name',
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
                                width: 90,
                              ),
                              SizedBox(
                                width: 300,
                                child: TextField(controller: widget.firstname,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    contentPadding:
                                        EdgeInsets.symmetric(vertical: 2),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Row(
                            children: [
                              RichText(
                                text: TextSpan(
                                  text: 'Father Name',
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
                                width: 80,
                              ),
                              SizedBox(
                                width: 300,
                                child: TextField(controller: widget.fathername,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    contentPadding:
                                        EdgeInsets.symmetric(vertical: 2),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Row(
                            children: [
                              RichText(
                                text: TextSpan(
                                  text: 'Gender',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 14),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: ' *',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.red,
                                          fontSize: 14),
                                    ),
                                    TextSpan(
                                      text: ' :',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 14),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 180),
                              Row(
                                children: [
                                  Radio(
                                    value: 'male',
                                    groupValue: widget.selectedGender,
                                    onChanged: (value) {
                                      setState(() {
                                        widget.selectedGender = value.toString();
                                      });
                                    },
                                  ),
                                  Text('Male'),
                                  SizedBox(width: 10),
                                  Radio(
                                    value: 'female',
                                    groupValue: widget.selectedGender,
                                    onChanged: (value) {
                                      setState(() {
                                        widget.selectedGender = value.toString();
                                      });
                                    },
                                  ),
                                  Text('Female'),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Row(
                            children: [
                              RichText(
                                text: TextSpan(
                                  text: 'National ID',
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
                                width: 90,
                              ),
                              SizedBox(
                                width: 300,
                                child: TextField(controller: widget.nidnumber,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    contentPadding:
                                        EdgeInsets.symmetric(vertical: 2),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Row(
                            children: [
                              RichText(
                                text: TextSpan(
                                  text: 'Date of Birth',
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
                                width: 80,
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
                                        hintText: widget.selectedDate != null
                                            ? "${widget.selectedDate!.day}-${widget.selectedDate!.month}-${widget.selectedDate!.year}"
                                            : "Select a date",
                                        hintStyle: TextStyle(
                                          color: Colors.grey,
                                        ),
                                        suffixIcon: Icon(
                                            Icons.calendar_month_sharp,
                                            color: Colors.grey),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Row(
                            children: [
                              Text(
                                "No of Dependable Member: ",
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              SizedBox(
                                width: 300,
                                child: TextField(controller: widget.dependablemember,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    contentPadding:
                                        EdgeInsets.symmetric(vertical: 2),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Row(
                            children: [
                              RichText(
                                text: TextSpan(
                                  text: 'Marital Status',
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
                                width: 90,
                              ),
                              SizedBox(
                                width: 300,
                                child: DropdownButtonFormField<String>(
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: AppColor_greyBorder,
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: AppColor_greyBorder),
                                    ),
                                    hintText: "Select",
                                    hintStyle: TextStyle(
                                      color: AppColor_greyText,
                                    ),
                                  ),
                                  value: widget.maritalstatus,
                                  onChanged: (newValue) {},
                                  items: MaritalstatusList
                                      .map((item) {
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
                        width: 150,
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              RichText(
                                text: TextSpan(
                                  text: 'Last Name',
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
                                width: 90,
                              ),
                              SizedBox(
                                width: 300,
                                child: TextField(controller: widget.lastname,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    contentPadding:
                                        EdgeInsets.symmetric(vertical: 2),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Row(
                            children: [
                              RichText(
                                text: TextSpan(
                                  text: 'Mother Name',
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
                                width: 80,
                              ),
                              SizedBox(
                                width: 300,
                                child: TextField(controller: widget.mothername,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    contentPadding:
                                        EdgeInsets.symmetric(vertical: 2),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Row(
                            children: [
                              RichText(
                                text: TextSpan(
                                  text: 'Religion',
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
                                width: 120,
                              ),
                              SizedBox(
                                width: 300,
                                child: DropdownButtonFormField<String>(
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: AppColor_greyBorder,
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: AppColor_greyBorder),
                                    ),
                                    hintText: "Select",
                                    hintStyle: TextStyle(
                                      color: AppColor_greyText,
                                    ),
                                  ),
                                  value: widget.religion,
                                  onChanged: (newValue) {},
                                  items: ReligionList.map((item) {
                                    return DropdownMenuItem(
                                      value: item,
                                      child: Text(item),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Row(
                            children: [
                              RichText(
                                text: TextSpan(
                                  text: 'Birth Registration No',
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
                                width: 50,
                              ),
                              SizedBox(
                                width: 300,
                                child: TextField(controller: widget.birthreginumber,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    contentPadding:
                                        EdgeInsets.symmetric(vertical: 2),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Row(
                            children: [
                              Text(
                                "Age: ",
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(
                                width: 155,
                              ),
                              SizedBox(
                                width: 300,
                                child: TextField(controller: widget.age,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    contentPadding:
                                        EdgeInsets.symmetric(vertical: 2),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Row(
                            children: [
                              Text(
                                "Educational Qualification : ",
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(
                                width: 35,
                              ),
                              SizedBox(
                                width: 300,
                                child: TextField(controller: widget.education,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    contentPadding:
                                        EdgeInsets.symmetric(vertical: 2),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 120,
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
          )
        : tablet
            ? Container(
                width: 1400,
                height: 1400,
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
                      width: 1400,
                      height: 40,
                      color: navbarColor,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 40.0),
                            child: Text(
                              "Personal Info",
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
                      padding:
                          EdgeInsets.only(top: 50, left: ScreenWidth / 10.24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      text: 'First Name',
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
                                                color: Colors.black,
                                                fontSize: 14)),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 90,
                                  ),
                                  SizedBox(
                                    width: 250,
                                    child: TextField(controller: widget.firstname,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        contentPadding:
                                            EdgeInsets.symmetric(vertical: 2),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Row(
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      text: 'Father Name',
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
                                                color: Colors.black,
                                                fontSize: 14)),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 80,
                                  ),
                                  SizedBox(
                                    width: 250,
                                    child: TextField(controller: widget.fathername,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        contentPadding:
                                            EdgeInsets.symmetric(vertical: 2),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Row(
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      text: 'Gender',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 14),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: ' *',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.red,
                                              fontSize: 14),
                                        ),
                                        TextSpan(
                                          text: ' :',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 180),
                                  Row(
                                    children: [
                                      Radio(
                                        value: 'male',
                                        groupValue: widget.selectedGender,
                                        onChanged: (value) {
                                          setState(() {
                                            widget.selectedGender = value.toString();
                                          });
                                        },
                                      ),
                                      Text('Male'),
                                      SizedBox(width: 10),
                                      Radio(
                                        value: 'female',
                                        groupValue: widget.selectedGender,
                                        onChanged: (value) {
                                          setState(() {
                                            widget.selectedGender = value.toString();
                                          });
                                        },
                                      ),
                                      Text('Female'),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Row(
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      text: 'National ID',
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
                                                color: Colors.black,
                                                fontSize: 14)),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 90,
                                  ),
                                  SizedBox(
                                    width: 250,
                                    child: TextField(controller: widget.nidnumber,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        contentPadding:
                                            EdgeInsets.symmetric(vertical: 2),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Row(
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      text: 'Date of Birth',
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
                                                color: Colors.black,
                                                fontSize: 14)),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 80,
                                  ),
                                  SizedBox(
                                    width: 250,
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
                                            hintText: widget.selectedDate != null
                                                ? "${widget.selectedDate!.day}-${widget.selectedDate!.month}-${widget.selectedDate!.year}"
                                                : "Select a date",
                                            hintStyle: TextStyle(
                                              color: Colors.grey,
                                            ),
                                            suffixIcon: Icon(
                                                Icons.calendar_month_sharp,
                                                color: Colors.grey),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "No of Dependable Member: ",
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  SizedBox(
                                    width: 250,
                                    child: TextField(controller: widget.dependablemember,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        contentPadding:
                                            EdgeInsets.symmetric(vertical: 2),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Row(
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      text: 'Marital Status',
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
                                                color: Colors.black,
                                                fontSize: 14)),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 90,
                                  ),
                                  SizedBox(
                                    width: 250,
                                    child: DropdownButtonFormField<String>(
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: AppColor_greyBorder,
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: AppColor_greyBorder),
                                        ),
                                        hintText: "Select",
                                        hintStyle: TextStyle(
                                          color: AppColor_greyText,
                                        ),
                                      ),
                                      value: widget.maritalstatus,
                                      onChanged: (newValue) {},
                                      items: MaritalstatusList
                                          .map((item) {
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
                            height: 50,
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      text: 'Last Name',
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
                                                color: Colors.black,
                                                fontSize: 14)),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 90,
                                  ),
                                  SizedBox(
                                    width: 250,
                                    child: TextField(controller: widget.lastname,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        contentPadding:
                                            EdgeInsets.symmetric(vertical: 2),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Row(
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      text: 'Mother Name',
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
                                                color: Colors.black,
                                                fontSize: 14)),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 80,
                                  ),
                                  SizedBox(
                                    width: 250,
                                    child: TextField(controller: widget.mothername,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        contentPadding:
                                            EdgeInsets.symmetric(vertical: 2),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Row(
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      text: 'Religion',
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
                                                color: Colors.black,
                                                fontSize: 14)),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 120,
                                  ),
                                  SizedBox(
                                    width: 250,
                                    child: DropdownButtonFormField<String>(
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: AppColor_greyBorder,
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: AppColor_greyBorder),
                                        ),
                                        hintText: "Select",
                                        hintStyle: TextStyle(
                                          color: AppColor_greyText,
                                        ),
                                      ),
                                      value: widget.religion,
                                      onChanged: (newValue) {},
                                      items: ReligionList.map((item) {
                                        return DropdownMenuItem(
                                          value: item,
                                          child: Text(item),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Row(
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      text: 'Birth Registration No',
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
                                                color: Colors.black,
                                                fontSize: 14)),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 50,
                                  ),
                                  SizedBox(
                                    width: 250,
                                    child: TextField(controller: widget.birthreginumber,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        contentPadding:
                                            EdgeInsets.symmetric(vertical: 2),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Age: ",
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 155,
                                  ),
                                  SizedBox(
                                    width: 250,
                                    child: TextField(controller: widget.age,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        contentPadding:
                                            EdgeInsets.symmetric(vertical: 2),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Educational Qualification : ",
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 35,
                                  ),
                                  SizedBox(
                                    width: 250,
                                    child: TextField(controller: widget.education,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        contentPadding:
                                            EdgeInsets.symmetric(vertical: 2),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 120,
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
              )
            : Container(
                width: 1400,
                height: 1400,
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
                      width: 1400,
                      height: 30,
                      color: navbarColor,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 40.0),
                            child: Text(
                              "Personal Info",
                              style: TextStyle(
                                color: AppColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(top: 50, left: ScreenWidth / 10.24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      text: 'First Name',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 8),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: ' *',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.red,
                                                fontSize: 8)),
                                        TextSpan(
                                            text: ' :',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 8)),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 50,
                                  ),
                                  SizedBox(
                                    width: 200,
                                    child: TextField(controller: widget.firstname,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        contentPadding:
                                            EdgeInsets.symmetric(vertical: 2),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Row(
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      text: 'Father Name',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 8),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: ' *',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.red,
                                                fontSize: 8)),
                                        TextSpan(
                                            text: ' :',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 8)),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 50,
                                  ),
                                  SizedBox(
                                    width: 200,
                                    child: TextField(controller: widget.fathername,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        contentPadding:
                                            EdgeInsets.symmetric(vertical: 2),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Row(
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      text: 'Gender',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 8),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: ' *',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.red,
                                              fontSize: 8),
                                        ),
                                        TextSpan(
                                          text: ' :',
                                          style: TextStyle(
                                              color: Colors.black, fontSize: 8),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 100),
                                  Row(
                                    children: [
                                      Radio(
                                        value: 'male',
                                        groupValue: widget.selectedGender,
                                        onChanged: (value) {
                                          setState(() {
                                            widget.selectedGender = value.toString();
                                          });
                                        },
                                      ),
                                      Text(
                                        'Male',
                                        style: TextStyle(fontSize: 8),
                                      ),
                                      SizedBox(width: 10),
                                      Radio(
                                        value: 'female',
                                        groupValue: widget.selectedGender,
                                        onChanged: (value) {
                                          setState(() {
                                            widget.selectedGender = value.toString();
                                          });
                                        },
                                      ),
                                      Text('Female',
                                          style: TextStyle(fontSize: 8)),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Row(
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      text: 'National ID',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 8),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: ' *',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.red,
                                                fontSize: 8)),
                                        TextSpan(
                                            text: ' :',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 8)),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 50,
                                  ),
                                  SizedBox(
                                    width: 200,
                                    child: TextField(controller: widget.nidnumber,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        contentPadding:
                                            EdgeInsets.symmetric(vertical: 2),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Row(
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      text: 'Date of Birth',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 8),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: ' *',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.red,
                                                fontSize: 8)),
                                        TextSpan(
                                            text: ' :',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 8)),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 50,
                                  ),
                                  SizedBox(
                                    width: 200,
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
                                            hintText: widget.selectedDate != null
                                                ? "${widget.selectedDate!.day}-${widget.selectedDate!.month}-${widget.selectedDate!.year}"
                                                : "Select a date",
                                            hintStyle: TextStyle(
                                              color: Colors.grey,
                                            ),
                                            suffixIcon: Icon(
                                                Icons.calendar_month_sharp,
                                                color: Colors.grey),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "No of Dependable Member: ",
                                    style: TextStyle(
                                      fontSize: 8,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  SizedBox(
                                    width: 200,
                                    child: TextField(controller: widget.dependablemember,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        contentPadding:
                                            EdgeInsets.symmetric(vertical: 2),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Row(
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      text: 'Marital Status',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 8),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: ' *',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.red,
                                                fontSize: 8)),
                                        TextSpan(
                                            text: ' :',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 8)),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 50,
                                  ),
                                  SizedBox(
                                    width: 200,
                                    child: DropdownButtonFormField<String>(
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: AppColor_greyBorder,
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: AppColor_greyBorder),
                                        ),
                                        hintText: "Select",
                                        hintStyle: TextStyle(
                                          color: AppColor_greyText,
                                          fontSize: 8,
                                        ),
                                      ),
                                      value: widget.maritalstatus,
                                      onChanged: (newValue) {},
                                      items: MaritalstatusList
                                          .map((item) {
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
                            height: 50,
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      text: 'Last Name',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 8),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: ' *',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.red,
                                                fontSize: 8)),
                                        TextSpan(
                                            text: ' :',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 8)),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 50,
                                  ),
                                  SizedBox(
                                    width: 200,
                                    child: TextField(controller: widget.lastname,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        contentPadding:
                                            EdgeInsets.symmetric(vertical: 2),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Row(
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      text: 'Mother Name',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 8),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: ' *',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.red,
                                                fontSize: 8)),
                                        TextSpan(
                                            text: ' :',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 8)),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 50,
                                  ),
                                  SizedBox(
                                    width: 200,
                                    child: TextField(controller: widget.mothername,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        contentPadding:
                                            EdgeInsets.symmetric(vertical: 2),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Row(
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      text: 'Religion',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 8),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: ' *',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.red,
                                                fontSize: 8)),
                                        TextSpan(
                                            text: ' :',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 8)),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 60,
                                  ),
                                  SizedBox(
                                    width: 200,
                                    child: DropdownButtonFormField<String>(
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: AppColor_greyBorder,
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: AppColor_greyBorder),
                                        ),
                                        hintText: "Select",
                                        hintStyle: TextStyle(
                                          color: AppColor_greyText,
                                        ),
                                      ),
                                      value: widget.religion,
                                      onChanged: (newValue) {},
                                      items: ReligionList.map((item) {
                                        return DropdownMenuItem(
                                          value: item,
                                          child: Text(item),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Row(
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      text: 'Birth Registration No',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 8),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: ' *',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.red,
                                                fontSize: 8)),
                                        TextSpan(
                                            text: ' :',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 8)),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  SizedBox(
                                    width: 200,
                                    child: TextField(controller: widget.birthreginumber,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        contentPadding:
                                            EdgeInsets.symmetric(vertical: 2),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Age: ",
                                    style: TextStyle(
                                      fontSize: 8,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 80,
                                  ),
                                  SizedBox(
                                    width: 200,
                                    child: TextField(controller: widget.age,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        contentPadding:
                                            EdgeInsets.symmetric(vertical: 2),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Educational Qualification : ",
                                    style: TextStyle(
                                      fontSize: 8,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  SizedBox(
                                    width: 200,
                                    child: TextField(controller: widget.education,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        contentPadding:
                                            EdgeInsets.symmetric(vertical: 2),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 120,
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
  }
}
