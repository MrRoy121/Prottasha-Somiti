import 'package:flutter/material.dart';

class CustomProgressBar extends StatelessWidget {
  final int totalCheckpoints;
  final int currentCheckpoint;

  CustomProgressBar(
      {required this.totalCheckpoints, required this.currentCheckpoint});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(
            top: 7,
            left: 120,
            right: 120,
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
              index: index,
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
  List<String> ssss = [
    "Selection",
    'Basic Info',
    'Customer Photo',
    'Address\nInformation',
    'Contact\nInformation',
    'Related\nDocuments',
    'Bank\nA/C Info',
    'Know Your\nCustomer',
    'Review'
  ];
  Checkpoint(
      {required this.index,
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
            ssss[index],
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
