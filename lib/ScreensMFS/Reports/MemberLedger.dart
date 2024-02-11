import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../../../Constants/Constants.dart';
import '../../Constants/values.dart';
import '../../Model/member.dart';
import '../Widget/Appbar.dart';
import '../Widget/Appbool.dart';
import '../Widget/NavBoolMFS.dart';
import '../Widget/NavbarScreenMFS.dart';
import 'Widgets/Ledger.dart';


class MemberLedger extends StatefulWidget {
  Navbool navbool;
  Appbool appbool;

  MemberLedger({required this.appbool, required this.navbool});

  @override
  State<MemberLedger> createState() => _MemberLedgerState();
}

class _MemberLedgerState extends State<MemberLedger> {
  List<Memberss> memberss = [];
  var selectedledgertype;
  var selectedmemberss;
  var selectedStatus;
  var sselectedmemberss;
  DateTime selectedstartDate = DateTime.now();
  DateTime selectedendDate = DateTime.now();
  @override
  void initState() {
    super.initState();
    fetch();
  }

  Future<void> fetch() async {
    await FirebaseFirestore.instance
        .collection('Member')
        .get()
        .then((querySnapshot) {
      for (var element in querySnapshot.docs) {
        if (element["Status"]) {
          memberss.add(Memberss(
              somiteename: element["Somitee Name"],
              somiteeid: element["Somitee ID"],
              membertype: element["Member Type"],
              occupation: element["Occupation"],
              firstname: element["First Name"],dead: element['Dead'],
              lastname: element["Last Name"],
              fathername: element["Father Name"],
              mothername: element["Mother Name"],
              gender: element["Gender"],
              religion: element["Religion"],
              nationalid: element["National ID"],
              loanpendingamount: element["Loan Pending Amount"],
              owndepositamount: element["Own deposit Amount"],
              birthregi: element["Birth Registration"],
              annualincome: element["Annual Income"],
              sts: element["Status"],
              age: element["Age"],
              nodepenndent: element["No of Dependent"],
              education: element["Education"],
              maritalstatus: element["Marital Status"],
              mobilenotype: element["Mobile No Type"],
              mobilenno: element["Mobile No"],
              presentadd: element["Present Address"],
              parmaadd: element["Parmanent Address"],
              livingperiod: element["Living Period"],
              nomaleearner: element["No Female Earner"],
              nofemaleearner: element["No Male Earner"],
              id: element.id,
              headfamily: element["Head Family"],
              ownhomestead: element["Own HomeStead"],
              relationwithhead: element["Relation With Head"],
              landdesc: element["Land Desc"],
              housedesc: element["House Desc"],
              remarks: element["Remarks"],
              imageurl: element["ImageURL"],
              img: element["Image"],
              birthdate: element["Date Of Birth"].toDate(),
              sl: 0));
        }
      }
    });
  }

  void _onclear() {
    setState(() {
      var ss;
      selectedmemberss = ss;
      selectedledgertype = ss;
      sselectedmemberss = ss;
      selectedstartDate = DateTime.now();
      selectedendDate = DateTime.now();
    });
  }

  _save(){

  }

  @override
  Widget build(BuildContext context) {

    void _setupledgertype(int ins) {
      setState(() {
        selectedledgertype = LedgerTypeList[ins];
      });
    }
    Future<void> _selectstartDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedstartDate ?? DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2101),
      );

      if (picked != null && picked != selectedstartDate) {
        setState(() {
          selectedstartDate = picked;
        });
      }
    }

    Future<void> _selectendDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedendDate ?? DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2101),
      );

      if (picked != null && picked != selectedendDate) {
        setState(() {
          selectedendDate = picked;
        });
      }
    }

    void _setupmemberss(int ins) {
      setState(() {
        selectedmemberss = memberss[ins];
      });
    }

    return Scaffold(
      appBar: Appbar(
        navbool: widget.appbool,
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(margin: EdgeInsets.only(top: 100, left: 50),
              child: Column(
                children: [
                  Ledger(selectedstartDate: selectedstartDate,selectstartDate: _selectstartDate,
                      selectedendDate: selectedendDate,selectendDate: _selectendDate,
                      onsubmit: _save,setupmemberss: _setupmemberss,
                      selectedmemberssid: sselectedmemberss,
                      selectedmemberss: selectedmemberss,selectedStatus: selectedStatus,
                      onclear: _onclear,
                      memberss: memberss,selectedledgertype:selectedledgertype,setupledgertype: _setupledgertype, ),
                ],
              ),
            ),
            NavbarScreenMFS(appbool: widget.appbool, navbool: widget.navbool,),
          ],
        ),
      ),

    );
  }
}
