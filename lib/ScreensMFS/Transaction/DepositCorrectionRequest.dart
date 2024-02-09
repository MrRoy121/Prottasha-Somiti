import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:prottashasomit/ScreensMFS/Transaction/widget/MemberDeposit.dart';
import '../../Model/member.dart';
import '../../Model/somitee.dart';
import '../Widget/Appbar.dart';
import '../Widget/Appbool.dart';
import '../Widget/NavBoolMFS.dart';
import '../Widget/NavbarScreenMFS.dart';
import '../Widget/SamiteeSelection.dart';

class DepositCorrectionRequest extends StatefulWidget {
  Navbool navbool;
  Appbool appbool;

  DepositCorrectionRequest({required this.appbool, required this.navbool});

  @override
  State<DepositCorrectionRequest> createState() => _DepositCorrectionRequestState();
}

class _DepositCorrectionRequestState extends State<DepositCorrectionRequest> {

  List<Somitee> somitee = [];
  List<String> ssomitee = [];
  var selectedsomiti;
  var sselectedsomiti;
  List<Memberss> allmemberss = [];
  List<Memberss> memberss = [];
  bool memberselection = false;
  var selectedmemberss;
  var sselectedmemberss;
  var selectedDate;
  var conremarks = TextEditingController();
  var conamount = TextEditingController();
  var selectreverce = "Full Reverse";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetch();
  }

  Future<void> fetch() async {
    await FirebaseFirestore.instance
        .collection('Somitee')
        .get()
        .then((querySnapshot) {
      for (var element in querySnapshot.docs) {
        somitee.add(Somitee(
            address: element["Address"],
            id: element.id,
            lastupdated: element["Last Edited"].toDate(),
            closed: element["Closed"],
            name: element["Name"],
            active: element["Active"],
            formation: element["Formation Date"].toDate(),
            phone: element["Phone"],
            branch: element["Branch"],
            sl: 0));
        ssomitee.add(element["Name"]);
      }
    });
    int s = 1;
    try {
      QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection('Member').get();
      for (var element in querySnapshot.docs) {
          if (element["Deposits"].toString() != 'null') {
            var deposits = element["Deposits"];
            allmemberss.add(Memberss.withDepo(
                somiteename: element["Somitee Name"],
                somiteeid: element["Somitee ID"],
                membertype: element["Member Type"],
                deposit: deposits,
                withdraw: [],
                occupation: element["Occupation"],
                firstname: element["First Name"],
                lastname: element["Last Name"],
                dead: element['Dead'],
                fathername: element["Father Name"],
                mothername: element["Mother Name"],
                loanpendingamount: element["Loan Pending Amount"],
                owndepositamount: element["Own deposit Amount"],
                gender: element["Gender"],
                religion: element["Religion"],
                sts: element["Status"],
                nationalid: element["National ID"],
                birthregi: element["Birth Registration"],
                annualincome: element["Annual Income"],
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
                sl: s));
            s++;
            setState(() {});
          } else {
            allmemberss.add(Memberss.withDepo(
                somiteename: element["Somitee Name"],
                somiteeid: element["Somitee ID"],
                membertype: element["Member Type"],
                deposit: [],
                withdraw: [],
                occupation: element["Occupation"],
                firstname: element["First Name"],
                lastname: element["Last Name"],
                dead: element['Dead'],
                fathername: element["Father Name"],
                mothername: element["Mother Name"],
                loanpendingamount: element["Loan Pending Amount"],
                owndepositamount: element["Own deposit Amount"],
                gender: element["Gender"],
                religion: element["Religion"],
                sts: element["Status"],
                nationalid: element["National ID"],
                birthregi: element["Birth Registration"],
                annualincome: element["Annual Income"],
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
                sl: s));
            s++;
            setState(() {});
          }

      }
    } catch (e) {
      print("Error fetching data from Firestore: $e");
    }
  }

  void _onclear() {
    setState(() {
      var ss;
      selectedsomiti = ss;
      sselectedsomiti = ss;
      memberselection = false;
      selectedmemberss= ss;
       sselectedmemberss= ss;
      selectedDate= ss;
      conremarks = TextEditingController(text: '');
      conamount = TextEditingController(text: '');
      selectreverce = "Full Reverse";
    });
  }

  @override
  Widget build(BuildContext context) {
    void _setupsomiti(int ins) {
      setState(() {
        selectedsomiti = somitee[ins];
        memberselection = true;
        memberss = allmemberss
            .where((member) => member.somiteeid == somitee[ins].id)
            .toList();
      });
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
            Container(
              margin: EdgeInsets.only(top: 100, left: 50),
              child: Column(
                children: [

                  SizedBox(
                    height: 50,
                  ),



                  SamiteeSelection(
                      submit: true,
                      selectmember: false,
                      clear: true,
                      ssomitee: ssomitee,
                      close: true,
                      setupsomiti: _setupsomiti,
                      active: true,
                      selectedsomiteeid: selectedsomiti,
                      onsubmit: ,
                      somitee: somitee,
                      onclear: _onclear,
                      selectedsomitee: sselectedsomiti),

                  SizedBox(
                    height: 50,
                  ),

                  // MEMBER DEPOSIT CORRECTION
                  MemberDeposit(
                      allmemberss: allmemberss,
                      setupmemberss: _setupmemberss,
                      memberssselected: memberselection,selectedDate: selectedDate,conremarks: conremarks,conamount: conamount,selectreverce:selectreverce ,
                      selectedmemberssid: sselectedmemberss,
                      selectedmemberss: selectedmemberss,
                      memberss: memberss),




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
