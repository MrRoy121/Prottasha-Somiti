import 'package:flutter/material.dart';

import '../../Constants/Constants.dart';


class LoanGuarantor extends StatefulWidget {


  @override
  State<LoanGuarantor> createState() => _LoanGuarantorState();
}

class _LoanGuarantorState extends State<LoanGuarantor> {

  String? SelectGuarantor;


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
                            value: SelectGuarantor,
                            onChanged: (newValue) {

                            },
                            items: ['Item1', 'Item2', 'Item3 '].map((item) {
                              return DropdownMenuItem(
                                value: item,
                                child: Text(item),
                              );
                            }).toList(),
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
                            value: SelectGuarantor,
                            onChanged: (newValue) {

                            },
                            items: ['Item1', 'Item2', 'Item3 '].map((item) {
                              return DropdownMenuItem(
                                value: item,
                                child: Text(item),
                              );
                            }).toList(),
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
                            value: SelectGuarantor,
                            onChanged: (newValue) {

                            },
                            items: ['Item1', 'Item2', 'Item3 '].map((item) {
                              return DropdownMenuItem(
                                value: item,
                                child: Text(item),
                              );
                            }).toList(),
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
                            value: SelectGuarantor,
                            onChanged: (newValue) {

                            },
                            items: ['Item1', 'Item2', 'Item3 '].map((item) {
                              return DropdownMenuItem(
                                value: item,
                                child: Text(item),
                              );
                            }).toList(),
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
                            value: SelectGuarantor,
                            onChanged: (newValue) {

                            },
                            items: ['Item1', 'Item2', 'Item3 '].map((item) {
                              return DropdownMenuItem(
                                value: item,
                                child: Text(item),
                              );
                            }).toList(),
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
                            value: SelectGuarantor,
                            onChanged: (newValue) {

                            },
                            items: ['Item1', 'Item2', 'Item3 '].map((item) {
                              return DropdownMenuItem(
                                value: item,
                                child: Text(item),
                              );
                            }).toList(),
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
