import 'package:flutter/material.dart';

import '../../../Constants/Constants.dart';


class GLSummary extends StatefulWidget {
  @override
  State<GLSummary> createState() => _GLSummaryState();
}

class _GLSummaryState extends State<GLSummary> {
  String? selectedGender;
  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
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


    return desktop? Container(
      width: 1400,
      height: 300,
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
                    "Daily GL Summary",
                    style: TextStyle(
                      color: AppColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                Spacer(),
                Container(
                  height: 40,
                  width: 125,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 2.0, left: 12),
                    child: Row(
                      children: [
                        Icon(
                          Icons.remove_red_eye_outlined,
                          size: 16,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          "View Report",
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  color: Colors.green,
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  height: 40,
                  width: 90,
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
                  color: AppColor_yellow,
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 90, left: 430),
            child: Row(
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        RichText(
                          text: TextSpan(
                            text: 'Transaction Date',
                            style: TextStyle(color: Colors.black, fontSize: 14),
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
                          width: 70,
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
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  hintText: _selectedDate != null
                                      ? "${_selectedDate!.day}-${_selectedDate!.month}-${_selectedDate!.year}"
                                      : "Select a date",
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                  ),
                                  suffixIcon: Icon(Icons.calendar_month_sharp,
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
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    )
    : tablet? Container(
      width: 1400,
      height: 300,
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
                    "Daily GL Summary",
                    style: TextStyle(
                      color: AppColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                Spacer(),
                Container(
                  height: 40,
                  width: 125,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 2.0, left: 12),
                    child: Row(
                      children: [
                        Icon(
                          Icons.remove_red_eye_outlined,
                          size: 16,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          "View Report",
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  color: Colors.green,
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  height: 40,
                  width: 90,
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
                  color: AppColor_yellow,
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 90, left: ScreenWidth/7.68),
            child: Row(
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        RichText(
                          text: TextSpan(
                            text: 'Transaction Date',
                            style: TextStyle(color: Colors.black, fontSize: 14),
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
                          width: ScreenWidth/30.72,
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
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  hintText: _selectedDate != null
                                      ? "${_selectedDate!.day}-${_selectedDate!.month}-${_selectedDate!.year}"
                                      : "Select a date",
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                  ),
                                  suffixIcon: Icon(Icons.calendar_month_sharp,
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
      height: 300,
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
                  padding: EdgeInsets.only(left: ScreenWidth/38.4),
                  child: Text(
                    "Daily GL Summary",
                    style: TextStyle(
                      color: AppColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                    ),
                  ),
                ),
                Spacer(),
                Container(
                  height: 30,
                  width: 95,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 2.0, left: 8),
                    child: Row(
                      children: [
                        Icon(
                          Icons.remove_red_eye_outlined,
                          size: 12,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          "View Report",
                          style: TextStyle(color: Colors.white, fontSize: 8),
                        ),
                      ],
                    ),
                  ),
                  color: Colors.green,
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  height: 30,
                  width: 50,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 3.0, left: 10),
                    child: Row(
                      children: [
                        Icon(
                          Icons.clear_all_sharp,
                          color: Colors.white,
                          size: 12,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Clear",
                          style: TextStyle(color: Colors.white, fontSize: 8),
                        ),
                      ],
                    ),
                  ),
                  color: AppColor_yellow,
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 90, left: ScreenWidth/7.68),
            child: Row(
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        RichText(
                          text: TextSpan(
                            text: 'Transaction Date',
                            style: TextStyle(color: Colors.black, fontSize: 8),
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
                                      color: Colors.black, fontSize: 8)),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: ScreenWidth/30.72,
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
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  hintText: _selectedDate != null
                                      ? "${_selectedDate!.day}-${_selectedDate!.month}-${_selectedDate!.year}"
                                      : "Select a date",
                                  hintStyle: TextStyle(
                                    fontSize: 8,
                                    color: Colors.grey,
                                  ),
                                  suffixIcon: Icon(Icons.calendar_month_sharp, size: 10,
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
