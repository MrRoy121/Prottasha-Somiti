import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ShareholderButton extends StatefulWidget {
  final String memberId;

  ShareholderButton({required this.memberId});

  @override
  _ShareholderButtonState createState() => _ShareholderButtonState();
}

class _ShareholderButtonState extends State<ShareholderButton> {
  bool? isShareholder;
  late DocumentReference<Map<String, dynamic>> docRef;

  @override
  void initState() {
    super.initState();
    docRef = FirebaseFirestore.instance.collection('Share Holder').doc(widget.memberId);
    _fetchShareholderStatus();
  }

  Future<void> _fetchShareholderStatus() async {
    try {
      DocumentSnapshot<Map<String, dynamic>> docSnapshot = await docRef.get();
      if (docSnapshot.exists) {
        setState(() {
          isShareholder = docSnapshot.data()?['enable'] ?? false;
        });
      } else {
        setState(() {
          isShareholder = false;
        });
      }
    } catch (e) {
      print('Error fetching shareholder status: $e');
    }
  }

  Future<void> _toggleShareholderStatus() async {
    try {
      if (isShareholder == true) {
        await docRef.update({'enable': false});
      } else {
        await docRef.set({'enable': true}, SetOptions(merge: true));
      }
      setState(() {
        isShareholder = !isShareholder!;
      });
    } catch (e) {
      print('Error updating shareholder status: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isShareholder == null
          ? null
          : () async {
              await _toggleShareholderStatus();
            },
      child: Container(
        height: 40,
        width: 150,
        color: isShareholder == true ? Colors.red : Colors.blue,
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0, left: 15),
          child: Text(
            isShareholder == true ? 'Disable Shareholder' : 'Make Shareholder',
            style: const TextStyle(color: Colors.white, fontSize: 14),
          ),
        ),
      ),
    );
  }
}
