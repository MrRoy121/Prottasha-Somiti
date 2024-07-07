import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import '../../../Constants/Constants.dart';
import '../../../Constants/values.dart';
import '../../../Model/member.dart';


class Ledger extends StatefulWidget {

  var selectedledgertype;
  void Function(int) setupledgertype;
  void Function(String) changestatus;
  DateTime selectedendDate, selectedstartDate;
  void Function() onsubmit;
  void Function() onclear;
  List<Memberss> memberss = [];
  var selectedStatus;
  var selectedmemberss;
  void Function(int) setupmemberss;
  var selectedmemberssid;
  void Function(BuildContext) selectendDate;
  void Function(BuildContext) selectstartDate;
  
  Ledger(
      {required this.onclear,
        required this.setupledgertype,
        required this.selectendDate,required this.selectedStatus,
        required this.setupmemberss,
        required this.selectstartDate,
        required this.selectedledgertype,
        required this.changestatus,
        required this.selectedendDate,required this.selectedstartDate,
        required this.memberss,
        required this.selectedmemberss,
        required this.selectedmemberssid,
        required this.onsubmit});
  
  @override
  State<Ledger> createState() => _LedgerState();
}

class _LedgerState extends State<Ledger> {


  @override
  Widget build(BuildContext context) {

    var ScreenWidth =MediaQuery.of(context).size.width;

    double ResponsiveWidth = MediaQuery.of(context).size.width;
    double ResponsiveHeight = MediaQuery.of(context).size.height;

    bool desktop = false;
    bool tablet = false;
    bool mobile = false;

    if(ResponsiveWidth > 1400){
      desktop = true;
      tablet = false;
      mobile = false;
    } else if (ResponsiveWidth > 540){
      tablet = true;
      desktop = false;
      mobile = false;
    }else{
      mobile = true;
      desktop = false;
      tablet = false;
    }

    String? selectLedger;
    if (desktop) {
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
                Padding(
                  padding: const EdgeInsets.only(left: 40.0),
                  child: Text(
                    "Member Ledger",
                    style: TextStyle(
                      color: AppColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),

                Spacer(),

                InkWell(onTap: (){
                  widget.onsubmit();
                },
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

                InkWell(onTap: (){
                  widget.onclear();
                },
                  child: Container(
                    height: 40,
                    width: 90,
                    color: AppColor_yellow,
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
                            text: 'Ledger Type',
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

                        SizedBox(width: 70,),


                        SizedBox(
                          width: 300,
                          child:  DropdownSearch<String>(
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
                                  "Select",
                                );
                              } else {
                                return Text(
                                  item,
                                );
                              }
                            },
                            onChanged: (newValue) {
                              setState(() {
                                widget.selectedledgertype = newValue;
                                widget.setupledgertype(
                                    LedgerTypeList.indexOf(newValue!));
                              });
                            },
                            items: LedgerTypeList,
                            selectedItem: widget.selectedledgertype,
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
                            text: 'From Date',
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
                            onTap: () => widget.selectstartDate(context),
                            child: AbsorbPointer(
                              child: TextField(
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  hintText: widget.selectedstartDate != null
                                      ? "${widget.selectedstartDate!.day}-${widget.selectedstartDate!.month}-${widget.selectedstartDate!.year}"
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


                    const SizedBox(
                      height: 40,
                    ),

                    Row(
                      children: [
                        const Text(
                            "Active A/c Only:",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(width: 180),
                        Row(
                          children: [
                            Radio(
                              value: 'yes',
                              groupValue: widget.selectedStatus,
                              onChanged: (value) {
                                
                                widget.changestatus(value.toString());
                              },
                            ),
                            Text('Yes'),
                            SizedBox(width: 10),
                            Radio(
                              value: 'no',
                              groupValue: widget.selectedStatus,
                              onChanged: (value) {
                                
                                widget.changestatus(value.toString());
                              },
                            ),
                            Text('No'),
                          ],
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
                            text: 'Ledger No',
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
                        RichText(
                          text: TextSpan(
                            text: 'To Date',
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
                            onTap: () => widget.selectendDate(context),
                            child: AbsorbPointer(
                              child: TextField(
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  hintText: widget.selectedendDate != null
                                      ? "${widget.selectedendDate!.day}-${widget.selectedendDate!.month}-${widget.selectedendDate!.year}"
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
    } else {
      return tablet? Container(
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
                    "Member Ledger",
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
                        Icon(Icons.remove_red_eye_outlined, size: 16, color: Colors.white,),
                        SizedBox(width: 3,),
                        Text("View Report", style: TextStyle(color: Colors.white, fontSize: 14),),
                      ],
                    ),
                  ),
                  color: Colors.green,
                ),

                SizedBox(width: 10,),

                Container(
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
                            text: 'Ledger Type',
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

                        SizedBox(width: 70,),


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
                            value: selectLedger,
                            onChanged: (newValue) {

                            },
                            items: ['Item1', 'Item2', 'Item3',].map((item) {
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
                            text: 'From Date',
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
                            onTap: () => widget.selectstartDate(context),
                            child: AbsorbPointer(
                              child: TextField(
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  hintText: widget.selectedstartDate != null
                                      ? "${widget.selectedstartDate!.day}-${widget.selectedstartDate!.month}-${widget.selectedstartDate!.year}"
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

                    Row(
                      children: [
                        Text(
                          "Active A/c Only:",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(width: 180),
                        Row(
                          children: [
                            Radio(
                              value: 'yes',
                              groupValue: widget.selectedStatus,
                              onChanged: (value) {
                                
                                widget.changestatus(value.toString());
                              },
                            ),
                            Text('Yes'),
                            SizedBox(width: 10),
                            Radio(
                              value: 'no',
                              groupValue: widget.selectedStatus,
                              onChanged: (value) {
                                
                                widget.changestatus(value.toString());
                              },
                            ),
                            Text('No'),
                          ],
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
                            text: 'Ledger No',
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
                        RichText(
                          text: TextSpan(
                            text: 'To Date',
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
                            onTap: () => widget.selectendDate(context),
                            child: AbsorbPointer(
                              child: TextField(
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  hintText: widget.selectedendDate != null
                                      ? "${widget.selectedendDate!.day}-${widget.selectedendDate!.month}-${widget.selectedendDate!.year}"
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
                  padding: const EdgeInsets.only(left: 40.0),
                  child: Text(
                    "Member Ledger",
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
                  width: 125,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 2.0, left: 8),
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

                SizedBox(width: 10,),

                Container(
                  height: 30,
                  width: 90,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 3.0, left: 8),
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
                            text: 'Ledger Type',
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

                        SizedBox(width: 70,),


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
                                fontSize: 8,
                                color: AppColor_greyText,
                              ),
                            ),
                            value: selectLedger,
                            onChanged: (newValue) {

                            },
                            items: ['Item1', 'Item2', 'Item3',].map((item) {
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
                            text: 'From Date',
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

                        SizedBox(width: 70,),


                        SizedBox(
                          width: 200,
                          child: InkWell(
                            onTap: () => widget.selectstartDate(context),
                            child: AbsorbPointer(
                              child: TextField(
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  hintText: widget.selectedstartDate != null
                                      ? "${widget.selectedstartDate!.day}-${widget.selectedstartDate!.month}-${widget.selectedstartDate!.year}"
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


                    SizedBox(
                      height: 40,
                    ),

                    Row(
                      children: [
                        Text(
                          "Active A/c Only:",
                          style: TextStyle(
                            fontSize: 8,
                          ),
                        ),
                        SizedBox(width: 150),
                        Row(
                          children: [
                            Radio(
                              value: 'yes',
                              groupValue: widget.selectedStatus,
                              onChanged: (value) {
                                
                                widget.changestatus(value.toString());
                              },
                            ),
                            Text('Yes', style: TextStyle(
                              fontSize: 8,
                            ),),
                            SizedBox(width: 10),
                            Radio(
                              value: 'no',
                              groupValue: widget.selectedStatus,
                              onChanged: (value) {
                                
                                widget.changestatus(value.toString());
                              },
                            ),
                            Text('No', style: TextStyle(
                              fontSize: 8,
                            ),),
                          ],
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
                            text: 'Ledger No',
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

                        SizedBox(width: 65,),


                        Container(
                            width: 200,
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
                                      item.id+
                                          " - " +
                                          item.firstname +
                                          " " +
                                          item.lastname,
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

                                    item.id+
                                        " - " +
                                        item.firstname +
                                        " " +
                                        item.lastname,
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
                        RichText(
                          text: TextSpan(
                            text: 'To Date',
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

                        SizedBox(width: 70,),


                        SizedBox(
                          width: 200,
                          child: InkWell(
                            onTap: () => widget.selectendDate(context),
                            child: AbsorbPointer(
                              child: TextField(
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  hintText: widget.selectedendDate != null
                                      ? "${widget.selectedendDate!.day}-${widget.selectedendDate!.month}-${widget.selectedendDate!.year}"
                                      : "Select a date",
                                  hintStyle: TextStyle(
                                    fontSize: 8,
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
}
