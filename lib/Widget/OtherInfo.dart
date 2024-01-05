import 'package:flutter/material.dart';

import '../Constants/Constants.dart';

class OtherInfo extends StatefulWidget {


  @override
  State<OtherInfo> createState() => _OtherInfoState();
}

class _OtherInfoState extends State<OtherInfo> {

  String? selectedGender;


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
      height: 580,
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
                    "Other’s Information",
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
                        Text(
                          "Living Period (Pr. Address) :",
                          style: TextStyle(
                            fontSize: 14
                          ),
                        ),

                        SizedBox(width: 35,),


                        SizedBox(
                          width: 300,
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.symmetric(vertical: 2),
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
                          "No of Male Earner :",
                          style: TextStyle(
                              fontSize: 14
                          ),
                        ),

                        SizedBox(width: 90,),


                        SizedBox(
                          width: 300,
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.symmetric(vertical: 2),
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
                          "Head of Family :",
                          style: TextStyle(
                              fontSize: 14
                          ),
                        ),
                        SizedBox(width: 190),
                        Row(
                          children: [
                            Radio(
                              value: 'Yes',
                              groupValue: selectedGender,
                              onChanged: (value) {
                                setState(() {
                                  selectedGender = value.toString();
                                });
                              },
                            ),
                            Text('Yes'),
                            SizedBox(width: 10),
                            Radio(
                              value: 'No',
                              groupValue: selectedGender,
                              onChanged: (value) {
                                setState(() {
                                  selectedGender = value.toString();
                                });
                              },
                            ),
                            Text('No'),
                          ],
                        ),
                      ],
                    ),


                    SizedBox(
                      height: 40,
                    ),

                    Row(
                      children: [
                        Text(
                          "Own Homestead :",
                          style: TextStyle(
                              fontSize: 14
                          ),
                        ),
                        SizedBox(width: 180),
                        Row(
                          children: [
                            Radio(
                              value: 'Yes',
                              groupValue: selectedGender,
                              onChanged: (value) {
                                setState(() {
                                  selectedGender = value.toString();
                                });
                              },
                            ),
                            Text('Yes'),
                            SizedBox(width: 10),
                            Radio(
                              value: 'No',
                              groupValue: selectedGender,
                              onChanged: (value) {
                                setState(() {
                                  selectedGender = value.toString();
                                });
                              },
                            ),
                            Text('No'),
                          ],
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
                            text: 'House Description :',
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
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.symmetric(vertical: 2),
                            ),
                          ),

                        ),


                      ],
                    ),

                  ],
                ),

                SizedBox(
                  width: 100,
                ),

                Column(
                  children: [

                    Row(
                      children: [
                        Text(
                          "Annual Income :",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),

                        SizedBox(width: 90,),


                        SizedBox(
                          width: 300,
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.symmetric(vertical: 2),
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
                          "No of female Earner :",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),

                        SizedBox(width: 70,),


                        SizedBox(
                          width: 300,
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.symmetric(vertical: 2),
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
                          "Relation with Head of Family :",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),

                        SizedBox(width: 15,),


                        SizedBox(
                          width: 300,
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.symmetric(vertical: 2),
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
                          "Land Description :",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),

                        SizedBox(width: 90,),


                        SizedBox(
                          width: 300,
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.symmetric(vertical: 2),
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
                          "Remarks: ",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),

                        SizedBox(width: 145,),


                        SizedBox(
                          width: 300,
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.symmetric(vertical: 2),
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
    : tablet? Container(
      width: 1400,
      height: 1080,
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
                  padding: EdgeInsets.only(left: 40.0),
                  child: Text(
                    "Other’s Information",
                    style: TextStyle(
                      color: AppColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
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
                  children: [

                    Row(
                      children: [
                        Text(
                          "Living Period (Pr. Address) :",
                          style: TextStyle(
                              fontSize: 8
                          ),
                        ),

                        SizedBox(width: 55,),


                        SizedBox(
                          width: 200,
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.symmetric(vertical: 2),
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
                          "No of Male Earner :",
                          style: TextStyle(
                              fontSize: 8
                          ),
                        ),

                        SizedBox(width: 90,),


                        SizedBox(
                          width: 200,
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.symmetric(vertical: 2),
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
                          "Head of Family :",
                          style: TextStyle(
                              fontSize: 8
                          ),
                        ),
                        SizedBox(width: 190),
                        Row(
                          children: [
                            Radio(
                              value: 'Yes',
                              groupValue: selectedGender,
                              onChanged: (value) {
                                setState(() {
                                  selectedGender = value.toString();
                                });
                              },
                            ),
                            Text('Yes', style: TextStyle(
                              fontSize: 8,
                            ),),
                            SizedBox(width: 10),
                            Radio(
                              value: 'No',
                              groupValue: selectedGender,
                              onChanged: (value) {
                                setState(() {
                                  selectedGender = value.toString();
                                });
                              },
                            ),
                            Text('No',  style: TextStyle(
                              fontSize: 8,
                            ),),
                          ],
                        ),
                      ],
                    ),


                    SizedBox(
                      height: 40,
                    ),

                    Row(
                      children: [
                        Text(
                          "Own Homestead :",
                          style: TextStyle(
                              fontSize: 8
                          ),
                        ),
                        SizedBox(width: 180),
                        Row(
                          children: [
                            Radio(
                              value: 'Yes',
                              groupValue: selectedGender,
                              onChanged: (value) {
                                setState(() {
                                  selectedGender = value.toString();
                                });
                              },
                            ),
                            Text('Yes',  style: TextStyle(
                              fontSize: 8,
                            ),),
                            SizedBox(width: 10),
                            Radio(
                              value: 'No',
                              groupValue: selectedGender,
                              onChanged: (value) {
                                setState(() {
                                  selectedGender = value.toString();
                                });
                              },
                            ),
                            Text('No', style: TextStyle(
                              fontSize: 8,
                            ),),
                          ],
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
                            text: 'House Description :',
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

                        SizedBox(width: 80,),


                        SizedBox(
                          width: 200,
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.symmetric(vertical: 2),
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
                        Text(
                          "Annual Income :",
                          style: TextStyle(
                            fontSize: 8,
                          ),
                        ),

                        SizedBox(width: 100,),


                        SizedBox(
                          width: 200,
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.symmetric(vertical: 2),
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
                          "No of female Earner :",
                          style: TextStyle(
                            fontSize: 8,
                          ),
                        ),

                        SizedBox(width: 80,),


                        SizedBox(
                          width: 200,
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.symmetric(vertical: 2),
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
                          "Relation with Head of Family :",
                          style: TextStyle(
                            fontSize: 8,
                          ),
                        ),

                        SizedBox(width: 55,),


                        SizedBox(
                          width: 200,
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.symmetric(vertical: 2),
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
                          "Land Description :",
                          style: TextStyle(
                            fontSize: 8,
                          ),
                        ),

                        SizedBox(width: 110,),


                        SizedBox(
                          width: 200,
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.symmetric(vertical: 2),
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
                          "Remarks: ",
                          style: TextStyle(
                            fontSize: 8,
                          ),
                        ),

                        SizedBox(width: 135,),


                        SizedBox(
                          width: 200,
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.symmetric(vertical: 2),
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
      height: 1080,
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
                  padding: EdgeInsets.only(left: 40.0),
                  child: Text(
                    "Other’s Information",
                    style: TextStyle(
                      color: AppColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
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
                  children: [

                    Row(
                      children: [
                        Text(
                          "Living Period (Pr. Address) :",
                          style: TextStyle(
                              fontSize: 8
                          ),
                        ),

                        SizedBox(width: 5,),


                        SizedBox(
                          width: 200,
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.symmetric(vertical: 2),
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
                          "No of Male Earner :",
                          style: TextStyle(
                              fontSize: 8
                          ),
                        ),

                        SizedBox(width: 40,),


                        SizedBox(
                          width: 200,
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.symmetric(vertical: 2),
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
                          "Head of Family :",
                          style: TextStyle(
                              fontSize: 8
                          ),
                        ),
                        SizedBox(width: 140),
                        Row(
                          children: [
                            Radio(
                              value: 'Yes',
                              groupValue: selectedGender,
                              onChanged: (value) {
                                setState(() {
                                  selectedGender = value.toString();
                                });
                              },
                            ),
                            Text('Yes', style: TextStyle(
                              fontSize: 8,
                            ),),
                            SizedBox(width: 10),
                            Radio(
                              value: 'No',
                              groupValue: selectedGender,
                              onChanged: (value) {
                                setState(() {
                                  selectedGender = value.toString();
                                });
                              },
                            ),
                            Text('No',  style: TextStyle(
                              fontSize: 8,
                            ),),
                          ],
                        ),
                      ],
                    ),


                    SizedBox(
                      height: 40,
                    ),

                    Row(
                      children: [
                        Text(
                          "Own Homestead :",
                          style: TextStyle(
                              fontSize: 8
                          ),
                        ),
                        SizedBox(width: 130),
                        Row(
                          children: [
                            Radio(
                              value: 'Yes',
                              groupValue: selectedGender,
                              onChanged: (value) {
                                setState(() {
                                  selectedGender = value.toString();
                                });
                              },
                            ),
                            Text('Yes',  style: TextStyle(
                              fontSize: 8,
                            ),),
                            SizedBox(width: 10),
                            Radio(
                              value: 'No',
                              groupValue: selectedGender,
                              onChanged: (value) {
                                setState(() {
                                  selectedGender = value.toString();
                                });
                              },
                            ),
                            Text('No', style: TextStyle(
                              fontSize: 8,
                            ),),
                          ],
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
                            text: 'House Description :',
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

                        SizedBox(width: 30,),


                        SizedBox(
                          width: 200,
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.symmetric(vertical: 2),
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
                        Text(
                          "Annual Income :",
                          style: TextStyle(
                            fontSize: 8,
                          ),
                        ),

                        SizedBox(width: 50,),


                        SizedBox(
                          width: 200,
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.symmetric(vertical: 2),
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
                          "No of female Earner :",
                          style: TextStyle(
                            fontSize: 8,
                          ),
                        ),

                        SizedBox(width: 30,),


                        SizedBox(
                          width: 200,
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.symmetric(vertical: 2),
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
                          "Relation with Head of Family :",
                          style: TextStyle(
                            fontSize: 8,
                          ),
                        ),

                        SizedBox(width: 5,),


                        SizedBox(
                          width: 200,
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.symmetric(vertical: 2),
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
                          "Land Description :",
                          style: TextStyle(
                            fontSize: 8,
                          ),
                        ),

                        SizedBox(width: 55,),


                        SizedBox(
                          width: 200,
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.symmetric(vertical: 2),
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
                          "Remarks: ",
                          style: TextStyle(
                            fontSize: 8,
                          ),
                        ),

                        SizedBox(width: 85,),


                        SizedBox(
                          width: 200,
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.symmetric(vertical: 2),
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
