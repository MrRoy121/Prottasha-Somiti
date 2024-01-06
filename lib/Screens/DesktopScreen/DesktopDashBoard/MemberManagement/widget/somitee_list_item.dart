import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../../Constants/Constants.dart';
import '../../../../../Model/somitee.dart';

class SomiteeListItem extends StatefulWidget {
  Somitee cst;
  int index;
  final void Function(Somitee) onEditSomitee;
  SomiteeListItem({
    required this.cst,
    required this.index,
    required this.onEditSomitee,

  });

  @override
  State<SomiteeListItem> createState() => _SomiteeListItemState();
}

class _SomiteeListItemState extends State<SomiteeListItem> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Container(
      height: MediaQuery.of(context).size.height / 16,
      padding: EdgeInsets.only(left: 15, right: 15, top: 10),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.only(left: 30),
                  child: Text(
                    (widget.cst.sl + 1).toString(),
                    style: const TextStyle(
                        fontSize: 12,
                        color: AppColor_Black,
                        ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  margin: EdgeInsets.only(left: 7),
                  child: Text(
                    widget.cst.id,
                    style: TextStyle(
                        fontSize: 12,
                        color: AppColor_Black,
                        ),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  margin: EdgeInsets.only(left: 7),
                  child: Text(
                    widget.cst.name,
                    style: TextStyle(
                        fontSize: 12,
                        color: AppColor_Black,
                        ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  margin: EdgeInsets.only(left: 7),
                  child: Text(
                    widget.cst.branch,
                    style: TextStyle(
                        fontSize: 12,
                        color: AppColor_Black,
                        ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  margin: EdgeInsets.only(left: 7),
                  child: Text(
                    widget.cst.phone,
                    style: TextStyle(
                        fontSize: 12,
                        color: AppColor_Black,
                        ),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  margin: EdgeInsets.only(left: 7),
                  child: Text(
                    widget.cst.address,
                    style: const TextStyle(
                        fontSize: 12,
                        color: AppColor_Black,
                        ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  margin: EdgeInsets.only(left: 7),
                  child: Text(
                    DateFormat.yMMMd().format(widget.cst.formation),
                    style: TextStyle(
                        fontSize: 12,
                        color: AppColor_Black,
                        ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  margin: EdgeInsets.only(left: 7),
                  child: Text(
                    DateFormat.yMMMd().format(widget.cst.lastupdated),
                    style: TextStyle(
                        fontSize: 12,
                        color: AppColor_Black,
                        ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.only(left: 7),
                  child: Text(
                    widget.cst.active.toString(),
                    style: TextStyle(
                        fontSize: 12,
                        color: AppColor_Black,
                        ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: InkWell(
                  onTap: () {
                    widget.onEditSomitee(widget.cst);
                  },
                  child: Container(
                    decoration: BoxDecoration(),
                      child: Icon(
                    Icons.edit_outlined,
                    size: _width / 70,
                  )),
                ),
              ),
            ],
          ),
          Container(
            height: .2,
            margin: EdgeInsets.only(top: 10),
            width: double.infinity,
            color: AppColor_Black,
          )
        ],
      ),
    );
  }
}
