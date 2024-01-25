import 'package:flutter/material.dart';

import '../../../Constants/Constants.dart';

class LedgerTrasactionSelection extends StatefulWidget {


  @override
  State<LedgerTrasactionSelection> createState() => _LedgerTrasactionSelectionState();
}

class _LedgerTrasactionSelectionState extends State<LedgerTrasactionSelection> {
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
      //height: 350,
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
                    "Ledger & Transaction Selection",
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
                  crossAxisAlignment: CrossAxisAlignment.end,
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

                        SizedBox(width: 40,),


                        SizedBox(
                          width: 300,
                          child: TextField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: AppColor_greyBorder,
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColor_greyBorder),
                              ),
                              hintText: "Enter Samitee Name/Code",
                              hintStyle: TextStyle(
                                color: AppColor_greyText,
                              ),
                              suffixIcon: Icon(Icons.search, color: AppColor_greyText),
                            ),
                          ),

                        ),

                      ],
                    ),

                    SizedBox(height: 30,),



                    Row(
                      children: [
                        Text(
                          "Transaction Date :",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),

                        SizedBox(width: 40,),


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
                              hintText: "12-OCT-2021",
                              hintStyle: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,

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
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [

                    Row(
                      children: [
                        RichText(
                          text: TextSpan(
                            text: 'Document No',
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


                        SizedBox(
                          width: 300,
                          child: TextField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: AppColor_greyBorder,
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColor_greyBorder),
                              ),
                              hintText: "Enter Document No",
                              hintStyle: TextStyle(
                                color: AppColor_greyText,
                              ),
                              suffixIcon: Icon(Icons.search, color: AppColor_greyText),
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
                          "Remarks :",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),

                        SizedBox(width: 70,),

                        SizedBox(
                          width: 300,
                          child: TextField(
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(top: 20, bottom: 20),
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColor_greyBorder),

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
    : tablet? Container(
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
                    "Ledger & Transaction Selection",
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
            padding: EdgeInsets.only(top: 50, left: ScreenWidth/10.24),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
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

                        SizedBox(width: 40,),


                        SizedBox(
                          width: 300,
                          child: TextField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: AppColor_greyBorder,
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColor_greyBorder),
                              ),
                              hintText: "Enter Samitee Name/Code",
                              hintStyle: TextStyle(
                                color: AppColor_greyText,
                              ),
                              suffixIcon: Icon(Icons.search, color: AppColor_greyText),
                            ),
                          ),

                        ),

                      ],
                    ),

                    SizedBox(height: 30,),



                    Row(
                      children: [
                        Text(
                          "Transaction Date :",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),

                        SizedBox(width: 40,),


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
                              hintText: "12-OCT-2021",
                              hintStyle: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,

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
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [

                    Row(
                      children: [
                        RichText(
                          text: TextSpan(
                            text: 'Document No',
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


                        SizedBox(
                          width: 300,
                          child: TextField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: AppColor_greyBorder,
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColor_greyBorder),
                              ),
                              hintText: "Enter Document No",
                              hintStyle: TextStyle(
                                color: AppColor_greyText,
                              ),
                              suffixIcon: Icon(Icons.search, color: AppColor_greyText),
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
                          "Remarks :",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),

                        SizedBox(width: 70,),

                        SizedBox(
                          width: 300,
                          child: TextField(
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(top: 20, bottom: 20),
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColor_greyBorder),

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
                    "Ledger & Transaction Selection",
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
            padding: EdgeInsets.only(top: 50, left: ScreenWidth/10.24),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
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

                        SizedBox(width: 40,),


                        SizedBox(
                          width: 200,
                          child: TextField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: AppColor_greyBorder,
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColor_greyBorder),
                              ),
                              hintText: "Enter Samitee Name/Code",
                              hintStyle: TextStyle(
                                color: AppColor_greyText,
                                fontSize: 8,
                              ),
                              suffixIcon: Icon(Icons.search, color: AppColor_greyText),
                            ),
                          ),

                        ),

                      ],
                    ),

                    SizedBox(height: 30,),



                    Row(
                      children: [
                        Text(
                          "Transaction Date :",
                          style: TextStyle(
                            fontSize: 8,
                          ),
                        ),

                        SizedBox(width: 40,),


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
                              hintText: "12-OCT-2021",
                              hintStyle: TextStyle(
                                fontSize: 8,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,

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
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [

                    Row(
                      children: [
                        RichText(
                          text: TextSpan(
                            text: 'Document No',
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
                          child: TextField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: AppColor_greyBorder,
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColor_greyBorder),
                              ),
                              hintText: "Enter Document No",
                              hintStyle: TextStyle(
                                color: AppColor_greyText,
                                fontSize: 8,
                              ),
                              suffixIcon: Icon(Icons.search, color: AppColor_greyText),
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
                          "Remarks :",
                          style: TextStyle(
                            fontSize: 8,
                          ),
                        ),

                        SizedBox(width: 70,),

                        SizedBox(
                          width: 200,
                          child: TextField(
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(top: 20, bottom: 20),
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColor_greyBorder),

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
