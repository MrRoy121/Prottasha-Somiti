import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../Constants/values.dart';
import '../../Model/loanSanction.dart';
import '../../Model/somitee.dart';
import '../../helpers/pdfs_helpers/pdf_sanctoindetails.dart';
import '../Widget/Appbar.dart';
import '../Widget/Appbool.dart';
import '../Widget/NavBoolMFS.dart';
import '../Widget/NavbarScreenMFS.dart';
import 'Widgets/SanctionDetail.dart';

class SanctionDetailInformation extends StatefulWidget {
  Navbool navbool;
  Appbool appbool;

  SanctionDetailInformation({required this.appbool, required this.navbool});

  @override
  State<SanctionDetailInformation> createState() =>
      _SanctionDetailInformationState();
}

class _SanctionDetailInformationState extends State<SanctionDetailInformation> {
  List<String> ssomitee = [];
  var selectedsomiti;
  bool samiteeselected = false;
  List<loanSanction> sanction = [];
  List<Somitee> somitee = [];
  List<loanSanction> allsanction = [];
  List<String> ssanction = [];
  var selectedsanction;

  @override
  void initState() {
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
            name: element["Name"],
            active: element["Active"],
            closed: element["Closed"],
            formation: element["Formation Date"].toDate(),
            phone: element["Phone"],
            branch: element["Branch"],
            sl: 0));
        ssomitee.add(element["Name"]);
      }
    });
    await FirebaseFirestore.instance
        .collection('LoanSanction')
        .get()
        .then((querySnapshot) {
      for (var json in querySnapshot.docs) {
        if (json["Status"] == "Approved") {
          allsanction.add(loanSanction(
              somiteename: json['Somitee Name'],
              somiteeid: json['Somitee ID'],
              membername: json['Member Name'],
              memberid: json['Member ID'],
              loanpurpose: json["Loan Purpose"],
              approvedate: json["Approve Date"].toDate(),
              memberphone: json['Member Phone'],
              scheme: json["Loan Scheme"],
              category: json['Loan Category'],
              sanctionlimit: json["Sanction Limit"],
              installmentfrequency: json["Installment Frequency"],
              sanctiondate: json["Sanction Date"].toDate(),
              servicecharge: json["Service Charge"],
              installmentno: json["Installment No"],
              installmentamount: json["Installment Amount"],
              remarks: json["Remarks"],
              serviceamount: json["Service Amount"],
              grantorfname: json["Grantor F Name"],
              grantorffname: json["Grantor F FatherName"],
              grantorfrelation: json["Grantor F Relation"],
              grantorfmobile: json["Grantor F Mobile"],
              grantorfocupasion: json["Grantor F Occupation"],
              grantorsname: json["Grantor S Name"],
              grantorsfname: json["Grantor S FatherName"],
              grantorsrelation: json["Grantor S Relation"],
              grantorsmobile: json["Grantor S Mobile"],
              grantorsocupasion: json["Grantor S Occupation"],
              grantorpname: json["Grantor P Name"],
              grantorpfname: json["Grantor P FatherName"],
              grantorprelation: json["Grantor P Relation"],
              grantorpmobile: json["Grantor P Mobile"],
              grantorpocupasion: json["Grantor P Occupation"],
              status: json["Status"],
              id: json['ID'],
              sl: json['SL']));
        }
      }
    });

    await FirebaseFirestore.instance
        .collection('LoanDisbursed')
        .get()
        .then((querySnapshot) {
      for (var json in querySnapshot.docs) {
        allsanction.add(loanSanction.fromJson(json['Sanction']));
      }
    });
  }

  void _onclear() {
    setState(() {
      var ss;
      selectedsomiti = ss;
      selectedsomiti = ss;
      samiteeselected = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    void _setupsomiti(int ins) {
      setState(() {
        selectedsomiti = somitee[ins];
        samiteeselected = true;
        sanction = allsanction
            .where((sanction) => sanction.somiteeid == selectedsomiti.id)
            .toList();

      });
    }

    Future<void> _setupsanction(int ins) async {
      selectedsanction = sanction[ins];
    }

    _save() async {
      if (selectedsomiti == null||selectedsanction == null) {
        Get.snackbar("Samitee Wise Member Ledger Report Generation Failed.",
            "Some Required Fields are Empty",
            snackPosition: SnackPosition.BOTTOM,
            colorText: Colors.white,
            backgroundColor: Colors.red,
            margin: EdgeInsets.zero,
            duration: const Duration(milliseconds: 2000),
            boxShadows: [
              BoxShadow(
                  color: Colors.grey, offset: Offset(-100, 0), blurRadius: 20),
            ],
            borderRadius: 0);
      } else {
        PdfSanctionDetails.generate(
            selectedsanction,
            LoanSchemes.firstWhere(
                    (element) => element.name == selectedsanction.scheme));
      }
    }

    return Scaffold(
      appBar: Appbar(
        navbool: widget.appbool,
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: 100, left: 60),
              child: Column(
                children: [
                  SanctionDetail(
                    setupsomiti: _setupsomiti,
                    sanction: sanction,
                    selectedsanction: selectedsanction,
                    setupsanction: _setupsanction,
                    selectedsomitee: selectedsomiti,
                    onsubmit: _save,
                    onclear: _onclear,
                    somitee: somitee,
                    samiteeselected: samiteeselected,
                  ),
                ],
              ),
            ),
            NavbarScreenMFS(
              appbool: widget.appbool,
              navbool: widget.navbool,
            ),
          ],
        ),
      ),
    );
  }
}
