import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../Constants/Constants.dart';

class MemberImage extends StatefulWidget {
  @override
  State<MemberImage> createState() => _MemberImageState();
}

class _MemberImageState extends State<MemberImage> {
  String? selectedImagePath;


  Future<void> _selectImage() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
    );

    if (result != null && result.files.isNotEmpty) {
      setState(() {
        selectedImagePath = result.files.first.path;
      });
    }
  }


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
      height: 350,
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
                    "Member’s Image",
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
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50, left: 250),
                child: Container(
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
                        width: 295,
                        height: 30,
                        color: navbarColor,
                        child: Center(
                          child: Text(
                            "Choose Image",
                            style: TextStyle(
                              color: AppColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 15),
                        height: 120,
                        width: 295,
                        child: Row(
                          children: [
                            Container(
                              height: 80,
                              width: 265,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: 20,
                                      left: 10,
                                      right: 10,
                                    ),
                                    child: Row(
                                      children: [
                                        Text(
                                          "Select an Image File",
                                          style: TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        SizedBox(
                                          height: 30,
                                          width: 96,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              primary: Colors.white,
                                              shape: RoundedRectangleBorder(
                                                side: BorderSide(color: Colors.blue),
                                                borderRadius: BorderRadius.circular(5.0),
                                              ),
                                            ),
                                            onPressed: _selectImage,
                                            child: Text(
                                              "Select",
                                              style: TextStyle(
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 250,
                      ),
                    ],
                  ),
                ),
              ),
              Spacer(),
              Container(
                margin: EdgeInsets.only(top: 50, right: 250),
                height: 200,
                width: 200,
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
                      width: 200,
                      height: 30,
                      color: navbarColor,
                      child: Center(
                        child: Text(
                          "Preview Image",
                          style: TextStyle(
                            color: AppColor,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 25),
                      padding: EdgeInsets.only(top: 25),
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 0.5,
                        ),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: selectedImagePath != null
                          ? Image.file(
                        File(selectedImagePath!),
                        fit: BoxFit.cover,
                      )
                          : Center(
                        child: Icon(Icons.person_2_outlined, size: 58),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    )
    : tablet ? Container(
      width: 1400,
      height: 650,
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
                    "Member’s Image",
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
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 50, left: ScreenWidth/6.144),
                child: Container(
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
                        width: 295,
                        height: 30,
                        color: navbarColor,
                        child: Center(
                          child: Text(
                            "Choose Image",
                            style: TextStyle(
                              color: AppColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 15),
                        height: 120,
                        width: 295,
                        child: Row(
                          children: [
                            Container(
                              height: 80,
                              width: 265,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: 20,
                                      left: 10,
                                      right: 10,
                                    ),
                                    child: Row(
                                      children: [
                                        Text(
                                          "Select an Image File",
                                          style: TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        SizedBox(
                                          height: 30,
                                          width: 96,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              primary: Colors.white,
                                              shape: RoundedRectangleBorder(
                                                side: BorderSide(color: Colors.blue),
                                                borderRadius: BorderRadius.circular(5.0),
                                              ),
                                            ),
                                            onPressed: _selectImage,
                                            child: Text(
                                              "Select",
                                              style: TextStyle(
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 250,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 50, left: ScreenWidth/11.82),
                child: Container(
                  // margin: EdgeInsets.only(top: 50, right: 250),
                  height: 200,
                  width: 200,
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
                        width: 200,
                        height: 30,
                        color: navbarColor,
                        child: Center(
                          child: Text(
                            "Preview Image",
                            style: TextStyle(
                              color: AppColor,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 25),
                        padding: EdgeInsets.only(top: 25),
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                            width: 0.5,
                          ),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: selectedImagePath != null
                            ? Image.file(
                          File(selectedImagePath!),
                          fit: BoxFit.cover,
                        )
                            : Center(
                          child: Icon(Icons.person_2_outlined, size: 58),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    )
    : Container(
      width: 1400,
      height: 650,
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
                    "Member’s Image",
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
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 50, left: ScreenWidth/6.144),
                child: Container(
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
                        width: 295,
                        height: 30,
                        color: navbarColor,
                        child: Center(
                          child: Text(
                            "Choose Image",
                            style: TextStyle(
                              color: AppColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 15),
                        height: 120,
                        width: 295,
                        child: Row(
                          children: [
                            Container(
                              height: 80,
                              width: 265,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: 20,
                                      left: 10,
                                      right: 10,
                                    ),
                                    child: Row(
                                      children: [
                                        Text(
                                          "Select an Image File",
                                          style: TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        SizedBox(
                                          height: 30,
                                          width: 96,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              primary: Colors.white,
                                              shape: RoundedRectangleBorder(
                                                side: BorderSide(color: Colors.blue),
                                                borderRadius: BorderRadius.circular(5.0),
                                              ),
                                            ),
                                            onPressed: _selectImage,
                                            child: Text(
                                              "Select",
                                              style: TextStyle(
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 250,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 50, left: ScreenWidth/11.82),
                child: Container(
                  // margin: EdgeInsets.only(top: 50, right: 250),
                  height: 200,
                  width: 200,
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
                        width: 200,
                        height: 30,
                        color: navbarColor,
                        child: Center(
                          child: Text(
                            "Preview Image",
                            style: TextStyle(
                              color: AppColor,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 25),
                        padding: EdgeInsets.only(top: 25),
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                            width: 0.5,
                          ),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: selectedImagePath != null
                            ? Image.file(
                          File(selectedImagePath!),
                          fit: BoxFit.cover,
                        )
                            : Center(
                          child: Icon(Icons.person_2_outlined, size: 58),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}