import 'package:flutter/material.dart';

import '../Constants/Constants.dart';

class NoticeWidget extends StatefulWidget {
  final String noticeTitle;
  final String description;
  final String data;
  final String time;
  const NoticeWidget({required this.noticeTitle, required this.description, required this.data, required this.time});

  @override
  State<NoticeWidget> createState() => _NoticeWidgetState();
}

class _NoticeWidgetState extends State<NoticeWidget> {
  @override
  Widget build(BuildContext context) {

    var ScreenWidth =MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
        color: AppColor_second,
        borderRadius: BorderRadius.circular(10.0),

      ),
      padding: EdgeInsets.only(top: ScreenWidth/51.2, left: ScreenWidth/76.8, right: ScreenWidth/76.8, bottom: ScreenWidth/51.2),
      margin: EdgeInsets.only(top: ScreenWidth/51.2),
      // color: Colors.grey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.noticeTitle,
            style: TextStyle(
              color: AppColor_green,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: ScreenWidth/153.6,),
          Text(
            widget.description,
            style: TextStyle(
              color: AppColor,

            ),
          ),
          SizedBox(
            height: ScreenWidth/76.8,
          ),

          Row(
            children: [
              Icon(Icons.calendar_month_sharp, color: AppColor_green,size: ScreenWidth/96,),
              SizedBox(width: ScreenWidth/307.2,),
              Text(
                "Published Date: ",
                style: TextStyle(
                  fontSize: ScreenWidth/128,
                  color: AppColor_red,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: ScreenWidth/307.2,),
              Text(
                widget.data,
                style: TextStyle(
                  fontSize: ScreenWidth/128,
                  color: AppColor_green,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),

              Text(
                "Published Time: ",
                style: TextStyle(
                  fontSize: ScreenWidth/128,
                  color: AppColor_red,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: ScreenWidth/307.2,),
              Text(
                widget.time,
                style: TextStyle(
                  fontSize: ScreenWidth/128,
                  color: AppColor_green,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          )

        ],
      ),

    );
  }
}
