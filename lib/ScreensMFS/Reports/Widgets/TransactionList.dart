import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import '../../../Constants/Constants.dart';
import '../../../Constants/values.dart';
import '../../../Model/somitee.dart';


class TransactionList extends StatefulWidget {

  List<Somitee> somitee;
  List<String> ssomitee;
  var selectedsomitee;
  DateTime selectedDate;
  String selectedtransactiontype;
  var selectedsomiteeid;
  void Function() onsubmit;
  void Function() onclear;
  void Function(int) setuptransactionType;
  Future<void> Function(BuildContext) selectDate;
  void Function(int) setupsomiti;
  TransactionList(
      {required this.setupsomiti,
        required this.somitee,required this.selectDate,
        required this.selectedDate,required this.selectedtransactiontype,
        required this.ssomitee,required this.setuptransactionType,
        required this.selectedsomitee,
        required this.onsubmit,
        required this.onclear,
        required this.selectedsomiteeid});
  @override
  State<TransactionList> createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  

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
                Padding(
                  padding: const EdgeInsets.only(left: 40.0),
                  child: Text(
                    "Daily Transaction List",
                    style: TextStyle(
                      color: AppColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),

                Spacer(),

                InkWell(onTap: ()=>widget.onsubmit(),
                  child: Container(
                    height: 40,
                    width: 125,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 2.0, left: 12),
                      child: Row(
                        children: [
                          Icon(Icons.remove_red_eye_outlined, size: 16, color: Colors.white,),
                          SizedBox(width: 3,),
                          Text("View Report", style: TextStyle(color: Colors.white, fontSize: 14),),
                        ],
                      ),
                    ),
                    color: Colors.green,
                  ),
                ),

                SizedBox(width: 10,),

                InkWell(onTap: ()=>widget.onclear(),
                  child: Container(
                    height: 40,
                    width: 90,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 3.0, left: 15),
                      child: Row(
                        children: [
                          Icon(Icons.clear_all_sharp, color: Colors.white, size: 18,),
                          SizedBox(width: 5,),
                          Text("Clear", style: TextStyle(color: Colors.white, fontSize: 14),),
                        ],
                      ),
                    ),
                    color: AppColor_yellow,
                  ),
                ),


                SizedBox(width: 10,),

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
                            text: 'Samitee Name',
                            style: TextStyle(color: Colors.black, fontSize: 14),
                            children: <TextSpan>[
                              TextSpan(
                                  text: ' *', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red, fontSize: 14)),
                              TextSpan(
                                  text: ' :',
                                  style: TextStyle(color: Colors.black, fontSize: 14)),

                            ],
                          ),
                        ),

                        SizedBox(width: 60,),


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
                                  text: ' *', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red, fontSize: 14)),
                              TextSpan(
                                  text: ' :',
                                  style: TextStyle(color: Colors.black, fontSize: 14)),

                            ],
                          ),
                        ),

                        SizedBox(width: 80,),


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
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  hintText: widget.selectedDate != null
                                      ? "${widget.selectedDate!.day}-${widget.selectedDate!.month}-${widget.selectedDate!.year}"
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
                            text: 'Transaction Type',
                            style: TextStyle(color: Colors.black, fontSize: 14),
                            children: <TextSpan>[
                              TextSpan(
                                  text: ' *', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red, fontSize: 14)),
                              TextSpan(
                                  text: ' :',
                                  style: TextStyle(color: Colors.black, fontSize: 14)),

                            ],
                          ),
                        ),

                        SizedBox(width: 65,),


                        SizedBox(
                          width: 300,
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: AppColor_greyBorder,
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColor_greyBorder),
                              ),
                              hintText: "Select",
                              hintStyle: TextStyle(
                                color: AppColor_greyText,
                              ),
                            ),
                            value: widget.selectedtransactiontype,
                            onChanged: (newValue) {
                              widget.selectedtransactiontype = newValue!;
                              widget.setuptransactionType(
                                  TranTypeList.indexOf(newValue));
                            },
                            items: TranTypeList.map((item) {
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
                      height: 90,
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
      height: 600,
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
                    "Daily Transaction List",
                    style: TextStyle(
                      color: AppColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),

                Spacer(),

                InkWell(onTap: ()=>widget.onsubmit(),
                  child: Container(
                    height: 40,
                    width: 125,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 2.0, left: 12),
                      child: Row(
                        children: [
                          Icon(Icons.remove_red_eye_outlined, size: 16, color: Colors.white,),
                          SizedBox(width: 3,),
                          Text("View Report", style: TextStyle(color: Colors.white, fontSize: 14),),
                        ],
                      ),
                    ),
                    color: Colors.green,
                  ),
                ),

                SizedBox(width: 10,),

                InkWell(onTap: ()=>widget.onclear(),
                  child: Container(
                    height: 40,
                    width: 90,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 3.0, left: 15),
                      child: Row(
                        children: [
                          Icon(Icons.clear_all_sharp, color: Colors.white, size: 18,),
                          SizedBox(width: 5,),
                          Text("Clear", style: TextStyle(color: Colors.white, fontSize: 14),),
                        ],
                      ),
                    ),
                    color: AppColor_yellow,
                  ),
                ),


                SizedBox(width: 10,),

              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.only(top: 50, left: ScreenWidth/10.24),
            child: Column(
              children: [
                Column(
                  children: [

                    Row(
                      children: [
                        RichText(
                          text: TextSpan(
                            text: 'Samitee Name',
                            style: TextStyle(color: Colors.black, fontSize: 14),
                            children: <TextSpan>[
                              TextSpan(
                                  text: ' *', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red, fontSize: 14)),
                              TextSpan(
                                  text: ' :',
                                  style: TextStyle(color: Colors.black, fontSize: 14)),

                            ],
                          ),
                        ),

                        SizedBox(width: 40,),



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
                                  text: ' *', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red, fontSize: 14)),
                              TextSpan(
                                  text: ' :',
                                  style: TextStyle(color: Colors.black, fontSize: 14)),

                            ],
                          ),
                        ),

                        SizedBox(width: 60,),


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
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  hintText: widget.selectedDate != null
                                      ? "${widget.selectedDate!.day}-${widget.selectedDate!.month}-${widget.selectedDate!.year}"
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
                            text: 'Transaction Type',
                            style: TextStyle(color: Colors.black, fontSize: 14),
                            children: <TextSpan>[
                              TextSpan(
                                  text: ' *', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red, fontSize: 14)),
                              TextSpan(
                                  text: ' :',
                                  style: TextStyle(color: Colors.black, fontSize: 14)),

                            ],
                          ),
                        ),

                        SizedBox(width: 25,),


                        SizedBox(
                          width: 300,
                          child: DropdownButtonFormField<String>(
                            decoration: const InputDecoration(
                              filled: true,
                              fillColor: AppColor_greyBorder,
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColor_greyBorder),
                              ),
                              hintText: "Select",
                              hintStyle: TextStyle(
                                color: AppColor_greyText,
                              ),
                            ),
                            value: widget.selectedtransactiontype,
                            onChanged: (newValue) {

                              widget.selectedtransactiontype = newValue!;
                              widget.setuptransactionType(
                                  TranTypeList.indexOf(newValue));
                            },
                            items: TranTypeList.map((item) {
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
                      height: 90,
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
      height: 600,
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
                    "Daily Transaction List",
                    style: TextStyle(
                      color: AppColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                    ),
                  ),
                ),

                Spacer(),

                InkWell(onTap: ()=>widget.onsubmit(),
                  child: Container(
                    height: 30,
                    width: 95,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 1.0, left: 8),
                      child: Row(
                        children: [
                          Icon(Icons.remove_red_eye_outlined, size: 12, color: Colors.white,),
                          SizedBox(width: 3,),
                          Text("View Report", style: TextStyle(color: Colors.white, fontSize: 8),),
                        ],
                      ),
                    ),
                    color: Colors.green,
                  ),
                ),

                SizedBox(width: 10,),

                InkWell(onTap: ()=>widget.onclear(),
                  child: Container(
                    height: 30,
                    width: 70,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 3.0, left: 10),
                      child: Row(
                        children: [
                          Icon(Icons.clear_all_sharp, color: Colors.white, size: 12,),
                          SizedBox(width: 5,),
                          Text("Clear", style: TextStyle(color: Colors.white, fontSize: 8),),
                        ],
                      ),
                    ),
                    color: AppColor_yellow,
                  ),
                ),


                SizedBox(width: 10,),

              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.only(top: 50, left: ScreenWidth/10.24),
            child: Column(
              children: [
                Column(
                  children: [

                    Row(
                      children: [
                        RichText(
                          text: TextSpan(
                            text: 'Samitee Name',
                            style: TextStyle(color: Colors.black, fontSize: 8),
                            children: <TextSpan>[
                              TextSpan(
                                  text: ' *', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red, fontSize: 8)),
                              TextSpan(
                                  text: ' :',
                                  style: TextStyle(color: Colors.black, fontSize: 8)),

                            ],
                          ),
                        ),

                        SizedBox(width: 40,),



                        Container(
                            width: 200,
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
                            style: TextStyle(color: Colors.black, fontSize: 8),
                            children: <TextSpan>[
                              TextSpan(
                                  text: ' *', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red, fontSize: 8)),
                              TextSpan(
                                  text: ' :',
                                  style: TextStyle(color: Colors.black, fontSize: 8)),

                            ],
                          ),
                        ),

                        SizedBox(width: 40,),


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
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  hintText: widget.selectedDate != null
                                      ? "${widget.selectedDate!.day}-${widget.selectedDate!.month}-${widget.selectedDate!.year}"
                                      : "Select a date",
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 8,
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
                            text: 'Transaction Type',
                            style: TextStyle(color: Colors.black, fontSize: 8),
                            children: <TextSpan>[
                              TextSpan(
                                  text: ' *', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red, fontSize: 8)),
                              TextSpan(
                                  text: ' :',
                                  style: TextStyle(color: Colors.black, fontSize: 8)),

                            ],
                          ),
                        ),

                        SizedBox(width: 25,),


                        SizedBox(
                          width: 200,
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: AppColor_greyBorder,
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColor_greyBorder),
                              ),
                              hintText: "Select",
                              hintStyle: TextStyle(
                                color: AppColor_greyText,
                                fontSize: 8,
                              ),
                            ),
                            value: widget.selectedtransactiontype,
                            onChanged: (newValue) {
                              widget.selectedtransactiontype = newValue!;
                              widget.setuptransactionType(
                                  TranTypeList.indexOf(newValue));
                            },
                            items:TranTypeList.map((item) {
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
