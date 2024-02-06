import 'package:flutter/material.dart';

import '../../../Constants/Constants.dart';

class ImageMember extends StatefulWidget {
  String imgurl;

  ImageMember({required this.imgurl});

  @override
  State<ImageMember> createState() => _ImageMemberState();
}

class _ImageMemberState extends State<ImageMember> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 70),
      height: 450,
      width: 450,
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
            width: 450,
            height: 30,
            color: navbarColor,
            child: Center(
              child: Text(
                "Member Image",
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
            padding: EdgeInsets.only(top: 75),
            height: 380,
            width: 380,
            // color: Colors.red,

            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 0.5,
              ),
              borderRadius: BorderRadius.circular(5.0),
            ),

            child: Column(
              children: [
                widget.imgurl == ''
                    ? Center(
                        child: Icon(
                        Icons.person_2_outlined,
                        size: 200,
                      ))
                    : Image.network(
                        widget.imgurl,
                        width: 200,
                      ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
