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
      padding: EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 30),
      margin: EdgeInsets.only(top: 30),
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
          SizedBox(height: 10,),
          Text(
            widget.description,
            style: TextStyle(
              color: AppColor,

            ),
          ),
          SizedBox(
            height: 20,
          ),

          Row(
            children: [
              Icon(Icons.calendar_month_sharp, color: AppColor_green,size: 16,),
              SizedBox(width: 5,),
              Text(
                "Published Date: ",
                style: TextStyle(
                  fontSize: 12,
                  color: AppColor_red,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 5),
              Text(
                widget.data,
                style: TextStyle(
                  fontSize: 12,
                  color: AppColor_green,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),

              Text(
                "Published Time: ",
                style: TextStyle(
                  fontSize: 12,
                  color: AppColor_red,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 5,),
              Text(
                widget.time,
                style: TextStyle(
                  fontSize: 12,
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
