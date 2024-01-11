import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import '../../Constants/Constants.dart';
import '../../Model/member.dart';


class LoanGuarantor extends StatefulWidget {


  List<Memberss> allmemberss = [];
  var selectedgrantor1;
  var selectedgrantor2;

  LoanGuarantor(
      {required this.selectedgrantor1,
        required this.selectedgrantor2,
        required this.allmemberss,
  });
  @override
  State<LoanGuarantor> createState() => _LoanGuarantorState();
}

class _LoanGuarantorState extends State<LoanGuarantor> {
  

  @override
  Widget build(BuildContext context) {

    var ScreenWidth =MediaQuery.of(context).size.width;

    double ResponsiveWidth = MediaQuery.of(context as BuildContext).size.width;
    double ResponsiveHeight = MediaQuery.of(context as BuildContext).size.height;

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


    return desktop? Container(
      width: 1400,
      height: 230,
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
                    "Loan Guarantor Information",
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
                            text: 'Select Guarantor',
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
                                  widget.selectedgrantor1 = newValue;
                                });
                              },
                              items: widget.allmemberss,
                              selectedItem: widget.selectedgrantor1,
                            )),


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
                            text: 'Select Guarantor',
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
                                  widget.selectedgrantor2 = newValue;
                                });
                              },
                              items: widget.allmemberss,
                              selectedItem: widget.selectedgrantor2,
                            )),


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
    : tablet? Container(
      width: 1400,
      height: 330,
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
                    "Loan Guarantor Information",
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
            padding: EdgeInsets.only(top: 50, left: ScreenWidth/10.74),
            child: Column(
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        RichText(
                          text: TextSpan(
                            text: 'Select Guarantor',
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
                                  widget.selectedgrantor1 = newValue;
                                });
                              },
                              items: widget.allmemberss,
                              selectedItem: widget.selectedgrantor1,
                            )),


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
                            text: 'Select Guarantor',
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
                                  widget.selectedgrantor2 = newValue;
                                });
                              },
                              items: widget.allmemberss,
                              selectedItem: widget.selectedgrantor2,
                            )),


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
      height: 330,
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
                    "Loan Guarantor Information",
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
            padding: EdgeInsets.only(top: 50, left: ScreenWidth/10.74),
            child: Column(
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        RichText(
                          text: TextSpan(
                            text: 'Select Guarantor',
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

                        SizedBox(width: 50,),


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
                                  widget.selectedgrantor1 = newValue;
                                });
                              },
                              items: widget.allmemberss,
                              selectedItem: widget.selectedgrantor1,
                            )),


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
                            text: 'Select Guarantor',
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

                        SizedBox(width: 50,),


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
                                  widget.selectedgrantor2 = newValue;
                                });
                              },
                              items: widget.allmemberss,
                              selectedItem: widget.selectedgrantor2,
                            )),


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
