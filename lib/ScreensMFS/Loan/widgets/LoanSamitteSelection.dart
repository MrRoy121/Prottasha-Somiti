import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../Constants/Constants.dart';
import '../../../Constants/values.dart';
import '../../../Model/member.dart';
import '../../../Model/scheme.dart';
import '../../../Model/somitee.dart';

class LoanSamitteSelection extends StatefulWidget {
  List<Somitee> somitee;
  List<String> ssomitee;
  var selectedsomitee;
  var selectedsomiteeid;
  var consanctionlimit;
  var conservicecharge;
  var selectedloanpurpose;
  var selectedloantype;
  var selectedscheme;
  double serviceamount;
  var selectedinstalment;
  var coninstallmentno, conremarks, coninstallmentamount, conduratioon;
  List<Memberss> memberss = [];
  List<Memberss> allmemberss = [];
  var selectedmemberss;
  DateTime selectedDate;
  void Function() onsubmit;
  void Function() onclear;
  void Function() resetloanscheme;
  void Function(int) setupsomiti;
  bool memberssselected;
  void Function(int) setupmemberss;
  void Function(int) setuploanpurpose;
  void Function(int) setupinstallment;
  void Function(int) setuplloantype;
  void Function(int) setuplloanscheme;

  LoanSamitteSelection(
      {required this.onclear,
      required this.setupsomiti,
      required this.coninstallmentno,
      required this.setuploanpurpose,
      required this.conduratioon,
      required this.setuplloantype,
      required this.resetloanscheme,
      required this.setupinstallment,
      required this.setuplloanscheme,
      required this.selectedscheme,
      required this.selectedloanpurpose,
      required this.selectedDate,
      required this.conremarks,
      required this.coninstallmentamount,
      required this.setupmemberss,
      required this.selectedloantype,
      required this.conservicecharge,
      required this.serviceamount,
      required this.consanctionlimit,
      required this.selectedinstalment,
      required this.memberssselected,
      required this.allmemberss,
      required this.somitee,
      required this.memberss,
      required this.ssomitee,
      required this.selectedmemberss,
      required this.selectedsomitee,
      required this.selectedsomiteeid,
      required this.onsubmit});

  @override
  State<LoanSamitteSelection> createState() => _LoanSamitteSelectionState();
}

class _LoanSamitteSelectionState extends State<LoanSamitteSelection> {
  bool somiteeselected = false;
  bool schemeselection = false;
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: widget.selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
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
            height: 630,
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
                      const Padding(
                        padding: EdgeInsets.only(left: 40.0),
                        child: Text(
                          "Samitee Selection",
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
                                text: TextSpan(
                                  text: 'Select Samitee',
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
                            height: 10,
                          ),
                          Row(
                            children: [
                              RichText(
                                text: TextSpan(
                                  text: 'Sanction Limit',
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
                                child: TextFormField(
                                  controller: widget.consanctionlimit,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.allow(
                                        RegExp(r'[0-9]')),
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  onChanged: (val) {
                                    setState(() {
                                      if (val.length == 0) {
                                        schemeselection = false;
                                      } else {
                                        schemeselection = true;
                                      }
                                      widget.resetloanscheme();
                                    });
                                  },
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.zero,
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.zero,
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                    ),
                                    hintText: "Sanction Value",
                                    fillColor: Colors.grey.shade200,
                                    filled: true,
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
                              Text(
                                "Mobile Number :",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(
                                width: 90,
                              ),
                              Container(
                                width: 300,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 7, vertical: 15),
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    border: Border.all(
                                        width: 1, color: Colors.black)),
                                child: Text(
                                  widget.selectedmemberss != null
                                      ? widget.selectedmemberss.mobilenno
                                      : '',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
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
                              Text(
                                "Duration :",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(
                                width: 130,
                              ),
                              SizedBox(
                                width: 300,
                                child: TextFormField(
                                  controller: widget.conduratioon,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.allow(
                                        RegExp(r'[0-9]')),
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.zero,
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.zero,
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                    ),
                                    hintText: "Installment No",
                                    fillColor: Colors.white,
                                    filled: true,
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
                              Text(
                                "Service Charge :",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(
                                width: 90,
                              ),
                              SizedBox(
                                width: 300,
                                child: TextFormField(
                                  controller: widget.conservicecharge,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.allow(
                                        RegExp(r'[0-9]')),
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.zero,
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.zero,
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                    ),
                                    hintText: "Service Charge (%)",
                                    fillColor: Colors.white,
                                    filled: true,
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
                                  text: 'Installment Frequency',
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
                              SizedBox(
                                width: 300,
                                child: DropdownButtonFormField<String>(
                                  decoration: const InputDecoration(
                                    filled: true,
                                    fillColor: AppColor_greyBorder,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.zero,
                                      borderSide: BorderSide(
                                          color: AppColor_greyBorder),
                                    ),
                                    hintText: "Select",
                                    hintStyle: TextStyle(
                                      color: AppColor_greyText,
                                    ),
                                  ),
                                  value: widget.selectedinstalment,
                                  onChanged: (newValue) {
                                    widget.setupinstallment(
                                        InstallmentFrequencyList.indexOf(
                                            newValue!));
                                  },
                                  items: InstallmentFrequencyList.map((item) {
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
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                "Installment No :",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(
                                width: 90,
                              ),
                              SizedBox(
                                width: 300,
                                child: TextFormField(
                                  controller: widget.coninstallmentno,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.allow(
                                        RegExp(r'[0-9]')),
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.zero,
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.zero,
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                    ),
                                    hintText: "Installment No",
                                    fillColor: Colors.white,
                                    filled: true,
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
                                  text: 'Sanction Date',
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
                                child: InkWell(
                                  onTap: () => _selectDate(context),
                                  child: AbsorbPointer(
                                    child: TextField(
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white,
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.zero,
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
                            height: 10,
                          ),
                          Row(
                            children: [
                              const Text(
                                "Loan Category",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(
                                width: 55,
                              ),
                              SizedBox(
                                width: 300,
                                child: DropdownButtonFormField<String>(
                                  isDense: true,
                                  decoration: const InputDecoration(
                                    fillColor: AppColor_greyBorder,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.zero,
                                      borderSide: BorderSide(
                                          color: AppColor_greyBorder),
                                    ),
                                    hintText: "Select",
                                    hintStyle: TextStyle(
                                      color: AppColor_greyText,
                                    ),
                                  ),
                                  padding: EdgeInsets.symmetric(vertical: 0),
                                  value: widget.selectedloantype,
                                  onChanged: (newValue) {
                                    widget.setuplloantype(
                                        LoanType.indexOf(newValue!));
                                  },
                                  items: LoanType.map((item) {
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
                            height: 10,
                          ),
                          Row(
                            children: [
                              const Text(
                                "Select Scheme",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(
                                width: 55,
                              ),
                              Container(
                                  width: 300,
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  decoration: BoxDecoration(
                                    color: AppColor_greyBorder,
                                    border: Border.all(color: AppColor_Black),
                                  ),
                                  child: DropdownSearch<Scheme>(
                                    filterFn: (Scheme item, String query) {
                                      return item.filterFn(query);
                                    },
                                    enabled: schemeselection,
                                    popupProps: PopupProps.menu(
                                      showSearchBox: true,
                                      itemBuilder: (BuildContext context,
                                          Scheme item, bool isSelected) {
                                        return Container(
                                          padding: EdgeInsets.all(15),
                                          child: Text(
                                            item.name,
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
                                          item.name,
                                        );
                                      }
                                    },
                                    onChanged: (newValue) {
                                      setState(() {
                                        widget.setuplloanscheme(
                                            LoanSchemes.indexOf(newValue!));
                                      });
                                    },
                                    items: LoanSchemes,
                                    selectedItem: widget.selectedscheme,
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              RichText(
                                text: TextSpan(
                                  text: "Loan Purpose ",
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
                                          "Enter Loan Purpose",
                                        );
                                      } else {
                                        return Text(
                                          item,
                                        );
                                      }
                                    },
                                    onChanged: (newValue) {
                                      setState(() {
                                        widget.selectedloanpurpose = newValue;
                                        widget.setuploanpurpose(
                                            LoanPurposeList.indexOf(newValue!));
                                      });
                                    },
                                    items: LoanPurposeList,
                                    selectedItem: widget.selectedloanpurpose,
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                "Amount :",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(
                                width: 90,
                              ),
                              Container(
                                width: 300,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 7, vertical: 15),
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    border: Border.all(
                                        width: 1, color: Colors.black)),
                                child: Text(
                                  widget.serviceamount.toString(),
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
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
                              Text(
                                "Installment Amount :",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              SizedBox(
                                width: 300,
                                child: TextFormField(
                                  controller: widget.coninstallmentamount,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.allow(
                                        RegExp(r'[0-9]')),
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.zero,
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.zero,
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                    ),
                                    hintText: "Amount Value",
                                    fillColor: Colors.white,
                                    filled: true,
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
                              Text(
                                "Remarks :",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(
                                width: 85,
                              ),
                              SizedBox(
                                width: 300,
                                child: TextFormField(
                                  controller: widget.conremarks,
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.zero,
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.zero,
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                    ),
                                    hintText: "Remarks",
                                    fillColor: Colors.white,
                                    filled: true,
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
                            padding: const EdgeInsets.only(left: 40.0),
                            child: Text(
                              "Samitee Selection",
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
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 10.0, left: 15),
                                child: Text(
                                  "✓ Submit",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14),
                                ),
                              ),
                              color: Colors.green,
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
                                padding:
                                    const EdgeInsets.only(top: 3.0, left: 15),
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
                                padding:
                                    const EdgeInsets.only(top: 10.0, left: 20),
                                child: Text(
                                  "X",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14),
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
                                      text: 'Select Samitee',
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
                                height: 10,
                              ),
                              Row(
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      text: 'Sanction Limit',
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
                                    child: TextFormField(
                                      controller: widget.consanctionlimit,
                                      keyboardType: TextInputType.number,
                                      inputFormatters: <TextInputFormatter>[
                                        FilteringTextInputFormatter.allow(
                                            RegExp(r'[0-9]')),
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                      onChanged: (val) {
                                        setState(() {
                                          print(val);
                                          if (val.length == 0) {
                                            schemeselection = false;
                                          } else {
                                            schemeselection = true;
                                          }
                                        });
                                      },
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.zero,
                                          borderSide:
                                              BorderSide(color: Colors.black),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.zero,
                                          borderSide:
                                              BorderSide(color: Colors.black),
                                        ),
                                        hintText: "Sanction Value",
                                        fillColor: Colors.grey.shade200,
                                        filled: true,
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
                                  Text(
                                    "Mobile Number :",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 80,
                                  ),
                                  Container(
                                    width: 300,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 7, vertical: 15),
                                    decoration: BoxDecoration(
                                        color: Colors.grey.shade200,
                                        border: Border.all(
                                            width: 1, color: Colors.black)),
                                    child: Text(
                                      widget.selectedmemberss != null
                                          ? widget.selectedmemberss.mobilenno
                                          : '',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
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
                                  Text(
                                    "Service Charge :",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 80,
                                  ),
                                  SizedBox(
                                    width: 300,
                                    child: TextField(
                                      readOnly: true,
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white,
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
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
                                      text: 'Installment Frequency',
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
                                  SizedBox(
                                    width: 300,
                                    child: DropdownButtonFormField<String>(
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: AppColor_greyBorder,
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.zero,
                                          borderSide: BorderSide(
                                              color: AppColor_greyBorder),
                                        ),
                                        hintText: "Select",
                                        hintStyle: TextStyle(
                                          color: AppColor_greyText,
                                        ),
                                      ),
                                      value: widget.selectedinstalment,
                                      onChanged: (newValue) {
                                        widget.setupinstallment(
                                            InstallmentFrequencyList.indexOf(
                                                newValue!));
                                      },
                                      items:
                                          InstallmentFrequencyList.map((item) {
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
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Installment No :",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 75,
                                  ),
                                  SizedBox(
                                    width: 300,
                                    child: TextFormField(
                                      controller: widget.coninstallmentno,
                                      keyboardType: TextInputType.number,
                                      inputFormatters: <TextInputFormatter>[
                                        FilteringTextInputFormatter.allow(
                                            RegExp(r'[0-9]')),
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.zero,
                                          borderSide:
                                              BorderSide(color: Colors.black),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.zero,
                                          borderSide:
                                              BorderSide(color: Colors.black),
                                        ),
                                        hintText: "Installment No",
                                        fillColor: Colors.white,
                                        filled: true,
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
                                      text: 'Sanction Date',
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
                                    child: InkWell(
                                      onTap: () => _selectDate(context),
                                      child: AbsorbPointer(
                                        child: TextField(
                                          decoration: InputDecoration(
                                            filled: true,
                                            fillColor: Colors.white,
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.zero,
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
                                    width: 60,
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
                                        hintText: "Enter Somiti Name/ Code",
                                        hintStyle: TextStyle(
                                          color: AppColor_greyText,
                                        ),
                                        suffixIcon: Icon(Icons.search_sharp,
                                            color: AppColor_greyText),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 50,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Amount :",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 80,
                                  ),
                                  Container(
                                    width: 300,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 7, vertical: 15),
                                    decoration: BoxDecoration(
                                        color: Colors.grey.shade200,
                                        border: Border.all(
                                            width: 1, color: Colors.black)),
                                    child: Text(
                                      widget.serviceamount.toString(),
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
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
                                  Text(
                                    "Installment Amount :",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 40,
                                  ),
                                  SizedBox(
                                    width: 300,
                                    child: TextFormField(
                                      controller: widget.coninstallmentamount,
                                      keyboardType: TextInputType.number,
                                      inputFormatters: <TextInputFormatter>[
                                        FilteringTextInputFormatter.allow(
                                            RegExp(r'[0-9]')),
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.zero,
                                          borderSide:
                                              BorderSide(color: Colors.black),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.zero,
                                          borderSide:
                                              BorderSide(color: Colors.black),
                                        ),
                                        hintText: "Amount Value",
                                        fillColor: Colors.white,
                                        filled: true,
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
                                  Text(
                                    "Remarks :",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 110,
                                  ),
                                  SizedBox(
                                    width: 300,
                                    child: TextFormField(
                                      controller: widget.conremarks,
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.zero,
                                          borderSide:
                                              BorderSide(color: Colors.black),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.zero,
                                          borderSide:
                                              BorderSide(color: Colors.black),
                                        ),
                                        hintText: "Remarks",
                                        fillColor: Colors.white,
                                        filled: true,
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
              )
            : Container(
                width: 1400,
                height: 1350,
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
                              "Samitee Selection",
                              style: TextStyle(
                                color: AppColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 10,
                              ),
                            ),
                          ),
                          Spacer(),
                          InkWell(
                            onTap: () {
                              widget.onsubmit();
                            },
                            child: Container(
                              height: 30,
                              width: 90,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 10.0, left: 15),
                                child: Text(
                                  "✓ Submit",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 8),
                                ),
                              ),
                              color: Colors.green,
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
                              height: 30,
                              width: 90,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 3.0, left: 15),
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
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 8),
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
                              height: 30,
                              width: 50,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 10.0, left: 20),
                                child: Text(
                                  "X",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 8),
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
                      padding:
                          EdgeInsets.only(top: 50, left: ScreenWidth / 10.24),
                      child: Column(
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  RichText(
                                    text: const TextSpan(
                                      text: 'Select Samitee',
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
                                height: 10,
                              ),
                              Row(
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      text: 'Sanction Limit',
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
                                    child: TextFormField(
                                      controller: widget.consanctionlimit,
                                      keyboardType: TextInputType.number,
                                      inputFormatters: <TextInputFormatter>[
                                        FilteringTextInputFormatter.allow(
                                            RegExp(r'[0-9]')),
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.zero,
                                          borderSide:
                                              BorderSide(color: Colors.black),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.zero,
                                          borderSide:
                                              BorderSide(color: Colors.black),
                                        ),
                                        hintText: "Sanction Value",
                                        fillColor: Colors.grey.shade200,
                                        filled: true,
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
                                  Text(
                                    "Mobile Number :",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 8,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 40,
                                  ),
                                  Container(
                                    width: 300,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 7, vertical: 15),
                                    decoration: BoxDecoration(
                                        color: Colors.grey.shade200,
                                        border: Border.all(
                                            width: 1, color: Colors.black)),
                                    child: Text(
                                      widget.selectedmemberss != null
                                          ? widget.selectedmemberss.mobilenno
                                          : '',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
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
                                  Text(
                                    "Service Charge :",
                                    style: TextStyle(
                                      color: Colors.black,
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
                                        filled: true,
                                        fillColor: Colors.white,
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
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
                                      text: 'Installment Frequency',
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
                                    width: 30,
                                  ),
                                  SizedBox(
                                    width: 200,
                                    child: DropdownButtonFormField<String>(
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: AppColor_greyBorder,
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.zero,
                                          borderSide: BorderSide(
                                              color: AppColor_greyBorder),
                                        ),
                                        hintText: "Select",
                                        hintStyle: TextStyle(
                                          color: AppColor_greyText,
                                          fontSize: 8,
                                        ),
                                      ),
                                      value: widget.selectedinstalment,
                                      onChanged: (newValue) {
                                        widget.setupinstallment(
                                            InstallmentFrequencyList.indexOf(
                                                newValue!));
                                      },
                                      items:
                                          InstallmentFrequencyList.map((item) {
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
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Installment No :",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 8,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 35,
                                  ),
                                  SizedBox(
                                    width: 200,
                                    child: TextFormField(
                                      controller: widget.coninstallmentno,
                                      keyboardType: TextInputType.number,
                                      inputFormatters: <TextInputFormatter>[
                                        FilteringTextInputFormatter.allow(
                                            RegExp(r'[0-9]')),
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.zero,
                                          borderSide:
                                              BorderSide(color: Colors.black),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.zero,
                                          borderSide:
                                              BorderSide(color: Colors.black),
                                        ),
                                        hintText: "Installment No",
                                        fillColor: Colors.white,
                                        filled: true,
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
                                      text: 'Sanction Date',
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
                                    width: 35,
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
                                              borderRadius: BorderRadius.zero,
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
                                    width: 20,
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
                                        hintText: "Enter Somiti Name/ Code",
                                        hintStyle: TextStyle(
                                          color: AppColor_greyText,
                                          fontSize: 8,
                                        ),
                                        suffixIcon: Icon(Icons.search_sharp,
                                            color: AppColor_greyText),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 50,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Amount :",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 8,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Container(
                                    width: 300,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 7, vertical: 15),
                                    decoration: BoxDecoration(
                                        color: Colors.grey.shade200,
                                        border: Border.all(
                                            width: 1, color: Colors.black)),
                                    child: Text(
                                      widget.serviceamount.toString(),
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
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
                                  Text(
                                    "Installment Amount :",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 8,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 40,
                                  ),
                                  SizedBox(
                                    width: 200,
                                    child: TextFormField(
                                      controller: widget.coninstallmentamount,
                                      keyboardType: TextInputType.number,
                                      inputFormatters: <TextInputFormatter>[
                                        FilteringTextInputFormatter.allow(
                                            RegExp(r'[0-9]')),
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.zero,
                                          borderSide:
                                              BorderSide(color: Colors.black),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.zero,
                                          borderSide:
                                              BorderSide(color: Colors.black),
                                        ),
                                        hintText: "Amount Value",
                                        fillColor: Colors.white,
                                        filled: true,
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
                                  Text(
                                    "Remarks :",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 8,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 70,
                                  ),
                                  SizedBox(
                                    width: 200,
                                    child: TextFormField(
                                      controller: widget.conremarks,
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.zero,
                                          borderSide:
                                              BorderSide(color: Colors.black),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.zero,
                                          borderSide:
                                              BorderSide(color: Colors.black),
                                        ),
                                        hintText: "Amount Value",
                                        fillColor: Colors.white,
                                        filled: true,
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
  }
}
