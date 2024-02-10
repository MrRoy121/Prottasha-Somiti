import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import '../../../Constants/Constants.dart';
import '../../../Constants/values.dart';
import '../../../Model/member.dart';

class MemberDeposit extends StatefulWidget {
  List<Memberss> memberss = [];
  List<Memberss> allmemberss = [];
  var selectedmemberss;
  var selectedmemberssid;
  bool memberssselected;
  var conamount, conremarks;
  void Function(int) setupmemberss;
  void Function(BuildContext) selectDate;
  
  var selectreverce;
  var selectedDate;
  double mainamount;
  MemberDeposit(
      {required this.setupmemberss,
      required this.allmemberss,
      required this.memberssselected,
        required this.selectDate,
      required this.memberss,
      required this.conamount,
      required this.conremarks,required this.mainamount,
      required this.selectedDate,
      required this.selectreverce,
      required this.selectedmemberss,
      required this.selectedmemberssid});

  @override
  State<MemberDeposit> createState() => _MemberDepositState();
}

class _MemberDepositState extends State<MemberDeposit> {
  bool amountenable = false;

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
            height: 360,
            // color: Colors.white,
            margin: EdgeInsets.only(bottom: 25),
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
                          "Member Deposit Correction",
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
                                  text: 'Select Member',
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
                                    enabled: widget.memberssselected,
                                    popupProps: PopupProps.menu(
                                      showSearchBox: true,
                                      itemBuilder: (BuildContext context,
                                          Memberss item, bool isSelected) {
                                        return Container(
                                          padding: EdgeInsets.all(15),
                                          child: Text(
                                            item.firstname +
                                                " " +
                                                item.lastname +
                                                " - " +
                                                item.id,
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
                                          item.firstname +
                                              " " +
                                              item.lastname +
                                              " - " +
                                              item.id,
                                        );
                                      }
                                    },
                                    onChanged: (newValue) {
                                      setState(() {
                                        widget.selectedmemberss = newValue;
                                        widget.setupmemberss(
                                            widget.memberss.indexOf(newValue!));
                                        widget.memberssselected = true;
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
                              RichText(
                                text: TextSpan(
                                  text: 'Reverse Type',
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
                                  value: widget.selectreverce,onChanged: (newValue) {
                                  setState(() {
                                    widget.selectreverce = newValue;
                                    if (newValue == ReverseTypeList[1]) {
                                      amountenable = true;
                                    }
                                  });
                                },
                                  items: ReverseTypeList.map((item) {
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
                                  text: 'Transaction Date',
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
                                width: 55,
                              ),
                              SizedBox(
                                width: 300,
                                child: InkWell(
                                  onTap: () => widget.selectDate(context),
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
                            height: 10,
                          ),
                          Row(
                            children: [
                              RichText(
                                text: TextSpan(
                                  text: 'Amount',
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
                                width: 110,
                              ),
                              SizedBox(
                                width: 300,
                                child: TextField(
                                  controller: widget.conamount,
                                  enabled: amountenable,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: AppColor_greyBorder),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              RichText(
                                text: TextSpan(
                                  text: 'Remarks',
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
                                width: 105,
                              ),
                              SizedBox(
                                width: 300,
                                child: TextField(
                                  controller: widget.conremarks,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: AppColor_greyBorder),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 80,
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
                height: 650,
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
                              "Member Deposit Correction",
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
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      text: 'Transaction Date',
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
                                    width: 55,
                                  ),
                                  SizedBox(
                                    width: 300,
                                    child: InkWell(
                                      onTap: () {
                                        if(widget.memberssselected){
                                          widget.selectDate(context);
                                        }
                                      },
                                      child: AbsorbPointer(
                                        child: TextField(
                                          decoration: InputDecoration(
                                            filled: true,
                                            fillColor: Colors.white,
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey),
                                            ),
                                            hintText: widget.selectedDate !=
                                                    null
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
                                  RichText(
                                    text: TextSpan(
                                      text: 'Reverse Type',
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
                                    width: 75,
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
                                      value: widget.selectreverce,
                                      onChanged: (newValue) {
                                        setState(() {
                                          widget.selectreverce = newValue;
                                          if (newValue == ReverseTypeList[1]) {
                                            amountenable = true;
                                          }
                                        });
                                      },
                                      items: ReverseTypeList.map((item) {
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
                                      text: 'Transaction Date',
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
                                    width: 65,
                                  ),
                                  SizedBox(
                                    width: 300,
                                    child: InkWell(
                                      onTap: () => widget.selectDate(context),
                                      child: AbsorbPointer(
                                        child: TextField(
                                          decoration: InputDecoration(
                                            filled: true,
                                            fillColor: Colors.white,
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey),
                                            ),
                                            hintText: widget.selectedDate !=
                                                    null
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
                                  RichText(
                                    text: TextSpan(
                                      text: 'Remarks',
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
                                    width: 110,
                                  ),
                                  SizedBox(
                                    width: 300,
                                    child: TextField(
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white,
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: AppColor_greyBorder),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 80,
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
                height: 650,
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
                            padding: const EdgeInsets.only(left: 40.0),
                            child: Text(
                              "Member Deposit Correction",
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
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      text: 'Transaction Date',
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
                                    width: 45,
                                  ),
                                  SizedBox(
                                    width: 200,
                                    child: InkWell(
                                      onTap: () => widget.selectDate(context),
                                      child: AbsorbPointer(
                                        child: TextField(
                                          decoration: InputDecoration(
                                            filled: true,
                                            fillColor: Colors.white,
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey),
                                            ),
                                            hintText: widget.selectedDate !=
                                                    null
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
                                  RichText(
                                    text: TextSpan(
                                      text: 'Reverse Type',
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
                                      value: widget.selectreverce,
                                      onChanged: (newValue) {},
                                      items: ReverseTypeList.map((item) {
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
                                      text: 'Transaction Date',
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
                                    width: 55,
                                  ),
                                  SizedBox(
                                    width: 200,
                                    child: InkWell(
                                      onTap: () => widget.selectDate(context),
                                      child: AbsorbPointer(
                                        child: TextField(
                                          decoration: InputDecoration(
                                            filled: true,
                                            fillColor: Colors.white,
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey),
                                            ),
                                            hintText: widget.selectedDate !=
                                                    null
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
                                  RichText(
                                    text: TextSpan(
                                      text: 'Remarks',
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
                                    width: 80,
                                  ),
                                  SizedBox(
                                    width: 200,
                                    child: TextField(
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white,
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: AppColor_greyBorder),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 80,
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
