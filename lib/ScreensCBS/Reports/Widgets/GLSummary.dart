import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import '../../../Constants/Constants.dart';
import '../../../Model/somitee.dart';

class GLSummary extends StatefulWidget {
  List<Somitee> somitee;
  List<String> ssomitee;
  var selectedsomitee;
  var selectedsomiteeid;
  void Function() onsubmit;
  void Function() onclear;
  DateTime selectedDate;
  Future<void> Function(BuildContext) selectDate;
  DateTime selectedDate1;
  Future<void> Function(BuildContext) selectDate1;
  void Function(int) setupsomiti;
  GLSummary(
      {required this.setupsomiti,
      required this.somitee,
      required this.selectDate,
      required this.selectedDate,
      required this.selectDate1,
      required this.selectedDate1,
      required this.ssomitee,
      required this.selectedsomitee,
      required this.onsubmit,
      required this.onclear,
      required this.selectedsomiteeid});
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
    return Container(
      width: 1400,
      height: 400,
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
                    "GL Summary",
                    style: TextStyle(
                      color: AppColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                Spacer(),
                InkWell(
                  onTap: () => widget.onsubmit(),
                  child: Container(
                    height: 40,
                    width: 125,
                    color: Colors.green,
                    child: const Padding(
                      padding: EdgeInsets.only(top: 2.0, left: 12),
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
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () => widget.onclear(),
                  child: Container(
                    height: 40,
                    width: 90,
                    color: AppColor_yellow,
                    child: const Padding(
                      padding: EdgeInsets.only(top: 3.0, left: 15),
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
                            text: 'Samitee Name',
                            style: TextStyle(color: Colors.black, fontSize: 14),
                            children: <TextSpan>[
                              TextSpan(
                                  text: ' *',
                                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red, fontSize: 14)),
                              TextSpan(text: ' :', style: TextStyle(color: Colors.black, fontSize: 14)),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 60,
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
                                itemBuilder: (BuildContext context, Somitee item, bool isSelected) {
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
                              dropdownDecoratorProps: const DropDownDecoratorProps(
                                dropdownSearchDecoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.transparent),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.transparent),
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
                                  widget.selectedsomiteeid = widget.somitee[widget.ssomitee.indexOf(newValue!.name)];
                                  widget.setupsomiti(widget.ssomitee.indexOf(newValue.name));
                                });
                              },
                              items: widget.somitee,
                              selectedItem: widget.selectedsomiteeid,
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
                            text: 'Report Date',
                            style: TextStyle(color: Colors.black, fontSize: 14),
                            children: <TextSpan>[
                              TextSpan(
                                  text: ' *',
                                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red, fontSize: 14)),
                              TextSpan(text: ' :', style: TextStyle(color: Colors.black, fontSize: 14)),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 80,
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
                                  border: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  hintText: widget.selectedDate != null
                                      ? "${widget.selectedDate.day}-${widget.selectedDate.month}-${widget.selectedDate!.year}"
                                      : "Select End date",
                                  hintStyle: const TextStyle(
                                    color: Colors.grey,
                                  ),
                                  suffixIcon: const Icon(Icons.calendar_month_sharp, color: Colors.grey),
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
                    SizedBox(
                      width: 300,
                      child: InkWell(
                        onTap: () => widget.selectDate1(context),
                        child: AbsorbPointer(
                          child: TextField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              hintText: widget.selectedDate1 != null
                                  ? "${widget.selectedDate1!.day}-${widget.selectedDate1!.month}-${widget.selectedDate1!.year}"
                                  : "Select Start date",
                              hintStyle: TextStyle(
                                color: Colors.grey,
                              ),
                              suffixIcon: const Icon(Icons.calendar_month_sharp, color: Colors.grey),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 90,
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
