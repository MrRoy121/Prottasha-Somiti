import 'package:flutter/material.dart';

import '../../Constants/values.dart';

class CustomProgressBar extends StatelessWidget {
  final int totalCheckpoints;
  final int currentCheckpoint;
  bool customeregi;

  CustomProgressBar(
      {required this.totalCheckpoints, required this.customeregi, required this.currentCheckpoint});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(
            top: 7,
            left: 130,
            right: 140,
          ),
          child: LinearProgressIndicator(
            backgroundColor: Colors.grey,
            value: 0,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
            totalCheckpoints,
            (index) => Checkpoint(
              index: index,customeregi: customeregi,
              isCompleted: index < currentCheckpoint,
              isprevious: index == currentCheckpoint,
            ),
          ),
        ),
      ],
    );
  }
}

class Checkpoint extends StatelessWidget {
  final int index;
  final bool isCompleted;
  final bool isprevious;
  bool customeregi;


  Checkpoint(
      {required this.index,required this.customeregi,
      required this.isCompleted,
      required this.isprevious});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Column(
        children: [
          Container(
            width: 20.0,
            height: 20.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isCompleted
                  ? Colors.green
                  : isprevious
                      ? Colors.blueAccent
                      : Colors.grey,
            ),
            child: isCompleted
                ? Icon(
                    Icons.check,
                    size: 16,
                    color: Colors.white,
                  )
                : null,
          ),
          SizedBox(height: 4.0),
          Text(
            customeregi?  CustomerRegi[index]: RegularAccopen[index],
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
