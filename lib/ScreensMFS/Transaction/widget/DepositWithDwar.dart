import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../Constants/Constants.dart';
import '../../../Model/member.dart';

class DepositWithDwar extends StatefulWidget {
  List<Memberss> memberss = [];
  var selectedmemberss;
  var selectedmemberssid;
  bool memberssselected;
  void Function(int) setupmemberss;
  var conwithdrawamount;
  var conremarks;

  DepositWithDwar(
      {required this.conwithdrawamount,
      required this.conremarks,
      required this.setupmemberss,
      required this.memberssselected,
      required this.memberss,
      required this.selectedmemberss,
      required this.selectedmemberssid});

  @override
  State<DepositWithDwar> createState() => _DepositWithDwarState();
}

class _DepositWithDwarState extends State<DepositWithDwar> {
  bool mmems = false;

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
            height: 350,
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
                          "Deposit Withdraw",
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
                                        widget.setupmemberss(
                                            widget.memberss.indexOf(newValue!));
                                        widget.memberssselected = true;
                                        mmems = true;
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
                                text: const TextSpan(
                                  text: 'Withdraw Amount',
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
                                  controller: widget.conwithdrawamount,
                                  enabled: mmems,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                        RegExp(r'[0-9]')),
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  onChanged: (value) {
                                    if (value.isNotEmpty) {
                                      double enteredValue = double.parse(value);
                                      if (enteredValue >=
                                          widget.selectedmemberss
                                              .owndepositamount) {
                                        widget.conwithdrawamount.text = widget
                                            .selectedmemberss.owndepositamount
                                            .toString();
                                      }
                                    }
                                    setState(() {});
                                  },
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
                              Text(
                                "Deposit Amount :",
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
                                child: Text(mmems
                                    ? widget.selectedmemberss.owndepositamount
                                        .toString()
                                    : ""),
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
                                  controller: widget.conremarks,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: AppColor_greyBorder,
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: AppColor_greyBorder),
                                    ),
                                    hintText: "Member Deposit Withdraw",
                                    hintStyle: TextStyle(
                                      color: AppColor_greyText,
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
                              "Deposit Withdraw",
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
                                    width: 30,
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
                                            widget.setupmemberss(widget.memberss
                                                .indexOf(newValue!));
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
                                      text: 'Withdraw Amount',
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
                                    width: 10,
                                  ),
                                  SizedBox(
                                    width: 300,
                                    child: TextField(
                                      controller: widget.conwithdrawamount,
                                      enabled: mmems,
                                      keyboardType: TextInputType.number,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.allow(
                                            RegExp(r'[0-9]')),
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                      onChanged: (value) {
                                        if (value.isNotEmpty) {
                                          double enteredValue =
                                              double.parse(value);
                                          if (enteredValue >=
                                              widget.selectedmemberss
                                                  .owndepositamount) {
                                            widget.conwithdrawamount.text =
                                                widget.selectedmemberss
                                                    .owndepositamount
                                                    .toString();
                                          }
                                        }
                                        setState(() {});
                                      },
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
                                  Text(
                                    "Deposit Amount :",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 25,
                                  ),
                                  SizedBox(
                                    width: 300,
                                    child: Text(mmems
                                        ? widget
                                            .selectedmemberss.owndepositamount
                                            .toString()
                                        : ""),
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
                                    width: 80,
                                  ),
                                  SizedBox(
                                    width: 300,
                                    child: TextField(
                                      controller: widget.conremarks,
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: AppColor_greyBorder,
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: AppColor_greyBorder),
                                        ),
                                        hintText: "Member Deposit Withdraw",
                                        hintStyle: TextStyle(
                                          color: AppColor_greyText,
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
                              "Deposit Withdraw",
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
                                    width: 30,
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
                                            widget.setupmemberss(widget.memberss
                                                .indexOf(newValue!));
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
                                    text: const TextSpan(
                                      text: 'Withdraw Amount',
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
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  SizedBox(
                                    width: 200,
                                    child: TextField(
                                      controller: widget.conwithdrawamount,
                                      enabled: mmems,
                                      keyboardType: TextInputType.number,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.allow(
                                            RegExp(r'[0-9]')),
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                      onChanged: (value) {
                                        if (value.isNotEmpty) {
                                          double enteredValue =
                                              double.parse(value);
                                          if (enteredValue >=
                                              widget.selectedmemberss
                                                  .owndepositamount) {
                                            widget.conwithdrawamount.text =
                                                widget.selectedmemberss
                                                    .owndepositamount
                                                    .toString();
                                          }
                                        }
                                        setState(() {});
                                      },
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
                                          fontSize: 8,
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
                          SizedBox(
                            width: 150,
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Deposit Amount :",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 9,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 25,
                                  ),
                                  SizedBox(
                                    width: 200,
                                    child: Text(mmems
                                        ? widget
                                            .selectedmemberss.owndepositamount
                                            .toString()
                                        : ""),
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
                                    width: 40,
                                  ),
                                  SizedBox(
                                    width: 200,
                                    child: TextField(
                                      controller: widget.conremarks,
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: AppColor_greyBorder,
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: AppColor_greyBorder),
                                        ),
                                        hintText: "Member Deposit Withdraw",
                                        hintStyle: TextStyle(
                                          color: AppColor_greyText,
                                          fontSize: 8,
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
