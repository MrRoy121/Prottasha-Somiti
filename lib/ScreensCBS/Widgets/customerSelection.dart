import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../Constants/Constants.dart';
import '../../../Model/member.dart';
import 'package:get/get.dart';

class CustomerSelection extends StatefulWidget {
  List<Memberss> memberss = [];
  var selectedmemberss;
  var selectedmemberssid;
  var selectedsamitee;
  void Function(int) setupmemberss;
  void Function() onsubmit;
  void Function() onclear;
  bool mmems;

  CustomerSelection(
      {required this.onsubmit,
      required this.onclear,
      required this.setupmemberss,
        required this.mmems,
      required this.memberss,
        required this.selectedsamitee,
      required this.selectedmemberss,
      required this.selectedmemberssid});

  @override
  State<CustomerSelection> createState() => _CustomerSelectionState();
}

class _CustomerSelectionState extends State<CustomerSelection> {

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
            height: 280,
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
                      const Padding(
                        padding: EdgeInsets.only(left: 40.0),
                        child: Text(
                          "Customer Selection",
                          style: TextStyle(
                            color: AppColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () {
                          widget.onsubmit();
                        },
                        child: Container(
                          height: 40,
                          width: 90,
                          color: Colors.green,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10.0, left: 15),
                            child: Text(
                              "✓ Submit",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {
                          widget.onclear();
                        },
                        child: Container(
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
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                          color: AppColor_yellow,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          height: 40,
                          width: 50,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10.0, left: 20),
                            child: Text(
                              "X",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
                          ),
                          color: Colors.red,
                        ),
                      ),
                      SizedBox(
                        width: 10,
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
                                        widget.setupmemberss(
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
                                "Samitee Name :",
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
                                    ? "${widget.selectedmemberss.somiteeid} - ${widget.selectedmemberss.somiteename}"
                                    .toString()
                                    : ""),
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
                              // RichText(
                              //   text: TextSpan(
                              //     text: 'National ID/ Birth Certificate No',
                              //     style: TextStyle(
                              //         color: Colors.black,
                              //         fontSize: ScreenWidth / 109.71),
                              //     children: <TextSpan>[
                              //       TextSpan(
                              //           text: ' *',
                              //           style: TextStyle(
                              //               fontWeight: FontWeight.bold,
                              //               color: Colors.red,
                              //               fontSize: ScreenWidth / 109.71)),
                              //       TextSpan(
                              //           text: ' :',
                              //           style: TextStyle(
                              //               color: Colors.black,
                              //               fontSize: ScreenWidth / 109.71)),
                              //     ],
                              //   ),
                              // ),
                              // SizedBox(
                              //   width: 22,
                              // ),
                            ],
                          ),
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
                                    ? widget.selectedsamitee.branch
                                        .toString()
                                    : ""),
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
                                    "Samitee Name :",
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
                                        ? "${widget.selectedmemberss.somiteeid} - ${widget.selectedmemberss.somiteename}"
                                        .toString()
                                        : ""),
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
                              SizedBox(
                                height: 140,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Branch Name :",
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
                                    child: Text(widget.mmems
                                        ? widget
                                            .selectedsamitee.branch
                                            .toString()
                                        : ""),
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
                                    "Samitee Name :",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 65,
                                  ),
                                  SizedBox(
                                    width: 200,
                                    child: Text(widget.mmems
                                        ? "${widget.selectedmemberss.somiteeid} - ${widget.selectedmemberss.somiteename}"
                                        .toString()
                                        : ""),
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
                              SizedBox(
                                height: 130,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Branch Name :",
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
                                    child: Text(widget.mmems
                                        ? widget
                                            .selectedsamitee.branch
                                            .toString()
                                        : ""),
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
