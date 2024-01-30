import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../../../Constants/Constants.dart';
import '../../../Model/member.dart';
import '../../../Model/somitee.dart';

class LoanRepaymentWidget extends StatefulWidget {
  List<Somitee> somitee;
  List<String> ssomitee;
  var selectedsomitee;
  var selectedsomiteeid;
  var connarrarion;
  var conpayamount;
  List<Memberss> memberss = [];
  List<Memberss> allmemberss = [];
  var selectedmemberss;
  var selectedmemberssid;
  void Function(int) setupsomiti;
  bool memberssselected;
  void Function(int) setupmemberss;

  LoanRepaymentWidget({
    required this.conpayamount,
    required this.connarrarion,
    required this.setupsomiti,
    required this.setupmemberss,
    required this.memberssselected,
    required this.allmemberss,
    required this.somitee,
    required this.memberss,
    required this.ssomitee,
    required this.selectedmemberss,
    required this.selectedmemberssid,
    required this.selectedsomitee,
    required this.selectedsomiteeid,
  });
  @override
  State<LoanRepaymentWidget> createState() => _LoanRepaymentWidgetState();
}

class _LoanRepaymentWidgetState extends State<LoanRepaymentWidget> {
  bool somiteeselected = false;
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
            //height: 350,
            height: 450,
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
                          "Loan Repayment",
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
                                  text: 'Samitee Code',
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
                                  child: DropdownSearch<Somitee>(
                                    filterFn: (Somitee item, String query) {
                                      return item.filterFn(query);
                                    },
                                    popupProps: PopupProps.menu(
                                      showSearchBox: true,
                                      itemBuilder: (BuildContext context,
                                          Somitee item, bool isSelected) {
                                        return Container(
                                          padding: EdgeInsets.all(15),
                                          child: Text(
                                            item.name + " - " + item.id,
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
                                          "Enter Somitee/Code",
                                        );
                                      } else {
                                        return Text(
                                          item.name + " - " + item.id,
                                        );
                                      }
                                    },
                                    onChanged: (newValue) {
                                      setState(() {
                                        widget.selectedsomitee = newValue;
                                        widget.selectedsomiteeid =
                                            widget.somitee[widget.ssomitee
                                                .indexOf(newValue!.name)];
                                        widget.setupsomiti(widget.ssomitee
                                            .indexOf(newValue.name));
                                        somiteeselected = true;
                                      });
                                    },
                                    items: widget.somitee,
                                    selectedItem: widget.selectedsomiteeid,
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: [
                              Text(
                                "Transaction Date :",
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(
                                width: 40,
                              ),
                              SizedBox(
                                width: 300,
                                child: Text(
                                    DateFormat.yMMMMd().format(DateTime.now())),
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
                                  text: 'Narration',
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
                                width: 70,
                              ),
                              SizedBox(
                                width: 300,
                                child: TextField(
                                  controller: widget.connarrarion,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: AppColor_greyBorder,
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: AppColor_greyBorder),
                                    ),
                                    hintText: "Loan Repayment",
                                    hintStyle: TextStyle(
                                      color: AppColor_greyText,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 200,
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 60,
                          ),
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
                                        widget.selectedmemberssid = widget
                                                .somitee[
                                            widget.memberss.indexOf(newValue!)];
                                        widget.setupmemberss(
                                            widget.memberss.indexOf(newValue));
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
                              Text(
                                "Pay Amount :",
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(
                                width: 70,
                              ),
                              SizedBox(
                                width: 300,
                                child: TextField(
                                  controller: widget.conpayamount,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.allow(
                                        RegExp(r'[0-9]')),
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  decoration: const InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: AppColor_greyBorder),
                                    ),
                                    hintText: "Enter Amount",
                                    hintStyle: TextStyle(
                                      color: AppColor_greyText,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        : tablet
            ? Container(
                width: 1400,
                //height: 350,
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
                              "Loan Repayment",
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
                                      text: 'Samitee Code',
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
                                    width: 40,
                                  ),
                                  Container(
                                      width: 300,
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 20),
                                      decoration: BoxDecoration(
                                        color: AppColor_greyBorder,
                                        border:
                                            Border.all(color: AppColor_Black),
                                      ),
                                      child: DropdownSearch<Somitee>(
                                        filterFn: (Somitee item, String query) {
                                          return item.filterFn(query);
                                        },
                                        popupProps: PopupProps.menu(
                                          showSearchBox: true,
                                          itemBuilder: (BuildContext context,
                                              Somitee item, bool isSelected) {
                                            return Container(
                                              padding: EdgeInsets.all(15),
                                              child: Text(
                                                item.name + " - " + item.id,
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
                                              "Enter Somitee/Code",
                                            );
                                          } else {
                                            return Text(
                                              item.name + " - " + item.id,
                                            );
                                          }
                                        },
                                        onChanged: (newValue) {
                                          setState(() {
                                            widget.selectedsomitee = newValue;
                                            widget.selectedsomiteeid =
                                                widget.somitee[widget.ssomitee
                                                    .indexOf(newValue!.name)];
                                            widget.setupsomiti(widget.ssomitee
                                                .indexOf(newValue.name));
                                            somiteeselected = true;
                                          });
                                        },
                                        items: widget.somitee,
                                        selectedItem: widget.selectedsomiteeid,
                                      )),
                                ],
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Transaction Date :",
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 40,
                                  ),
                                  SizedBox(
                                    width: 300,
                                    child: TextField(
                                      readOnly: true,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
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
                                      text: 'Narration',
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
                                    width: 70,
                                  ),
                                  SizedBox(
                                    width: 300,
                                    child: TextField(
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: AppColor_greyBorder,
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: AppColor_greyBorder),
                                        ),
                                        hintText: "Loan Repayment",
                                        hintStyle: TextStyle(
                                          color: AppColor_greyText,
                                        ),
                                      ),
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
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 20),
                                      decoration: BoxDecoration(
                                        color: AppColor_greyBorder,
                                        border:
                                            Border.all(color: AppColor_Black),
                                      ),
                                      child: DropdownSearch<Memberss>(
                                        filterFn:
                                            (Memberss item, String query) {
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
                                            widget.selectedmemberssid =
                                                widget.somitee[widget.memberss
                                                    .indexOf(newValue!)];
                                            widget.setupmemberss(widget.memberss
                                                .indexOf(newValue));
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
                                  Text(
                                    "Pay Amount :",
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 70,
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
                                        hintText: "Enter Amount",
                                        hintStyle: TextStyle(
                                          color: AppColor_greyText,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            : Container(
                width: 1400,
                //height: 350,
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
                              "Loan Repayment",
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
                                      text: 'Samitee Code',
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
                                    width: 40,
                                  ),
                                  Container(
                                      width: 200,
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 20),
                                      decoration: BoxDecoration(
                                        color: AppColor_greyBorder,
                                        border:
                                            Border.all(color: AppColor_Black),
                                      ),
                                      child: DropdownSearch<Somitee>(
                                        filterFn: (Somitee item, String query) {
                                          return item.filterFn(query);
                                        },
                                        popupProps: PopupProps.menu(
                                          showSearchBox: true,
                                          itemBuilder: (BuildContext context,
                                              Somitee item, bool isSelected) {
                                            return Container(
                                              padding: EdgeInsets.all(15),
                                              child: Text(
                                                item.name + " - " + item.id,
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
                                              "Enter Somitee/Code",
                                            );
                                          } else {
                                            return Text(
                                              item.name + " - " + item.id,
                                            );
                                          }
                                        },
                                        onChanged: (newValue) {
                                          setState(() {
                                            widget.selectedsomitee = newValue;
                                            widget.selectedsomiteeid =
                                                widget.somitee[widget.ssomitee
                                                    .indexOf(newValue!.name)];
                                            widget.setupsomiti(widget.ssomitee
                                                .indexOf(newValue.name));
                                            somiteeselected = true;
                                          });
                                        },
                                        items: widget.somitee,
                                        selectedItem: widget.selectedsomiteeid,
                                      )),
                                ],
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Transaction Date :",
                                    style: TextStyle(
                                      fontSize: 8,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 40,
                                  ),
                                  SizedBox(
                                    width: 200,
                                    child: TextField(
                                      readOnly: true,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
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
                                      text: 'Narration',
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
                                    width: 70,
                                  ),
                                  SizedBox(
                                    width: 200,
                                    child: TextField(
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: AppColor_greyBorder,
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: AppColor_greyBorder),
                                        ),
                                        hintText: "Loan Repayment",
                                        hintStyle: TextStyle(
                                          fontSize: 8,
                                          color: AppColor_greyText,
                                        ),
                                      ),
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
                                      text: 'Select Member',
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
                                    width: 40,
                                  ),
                                  Container(
                                      width: 200,
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 20),
                                      decoration: BoxDecoration(
                                        color: AppColor_greyBorder,
                                        border:
                                            Border.all(color: AppColor_Black),
                                      ),
                                      child: DropdownSearch<Memberss>(
                                        filterFn:
                                            (Memberss item, String query) {
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
                                            widget.selectedmemberssid =
                                                widget.somitee[widget.memberss
                                                    .indexOf(newValue!)];
                                            widget.setupmemberss(widget.memberss
                                                .indexOf(newValue));
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
                                  Text(
                                    "Pay Amount :",
                                    style: TextStyle(
                                      fontSize: 8,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 50,
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
                                        hintText: "Enter Amount",
                                        hintStyle: TextStyle(
                                          fontSize: 8,
                                          color: AppColor_greyText,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
  }
}
