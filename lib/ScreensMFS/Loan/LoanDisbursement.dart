import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:prottashasomit/ScreensMFS/Loan/widgets/LoanDetailsWidget.dart';
import 'package:prottashasomit/ScreensMFS/Loan/widgets/LoanInformation.dart';
import 'package:prottashasomit/ScreensMFS/Loan/widgets/LoanOtherInfo.dart';
import '../../../Model/LoanSanction.dart';
import '../Widget/Appbar.dart';
import '../Widget/Appbool.dart';
import '../Widget/NavBoolMFS.dart';
import '../Widget/NavbarScreenMFS.dart';
import '../Widget/TransactionWidget/Image.dart';
import '../Widget/TransactionWidget/LinkACinfo.dart';

class LoanDisbursement extends StatefulWidget {
  Navbool navbool;
  Appbool appbool;

  LoanDisbursement({required this.appbool, required this.navbool});

  @override
  State<LoanDisbursement> createState() => _LoanDisbursementState();
}

class _LoanDisbursementState extends State<LoanDisbursement> {
  List<LoanSanction> sanction = [];
  List<String> ssanction = [];
  bool bsanction = false;
  String imgurl = '';
  var selectedsanction;
  var selectedsanctionid;
  @override
  void initState() {
    super.initState();
    fetch();
  }

  Future<void> fetch() async {
    await FirebaseFirestore.instance
        .collection('LoanSanction')
        .get()
        .then((querySnapshot) {
      for (var json in querySnapshot.docs) {
        if (json["Status"] == "Approved") {
          sanction.add(LoanSanction(
              somiteename: json['Somitee Name'],
              somiteeid: json['Somitee ID'],
              membername: json['Member Name'],
              memberid: json['Member ID'],
              loanpurpose: json["Loan Purpose"],
              memberphone: json['Member Phone'],
              sanctionlimit: json["Sanction Limit"],
              installmentfrequency: json["Installment Frequency"],
              sanctiondate: json["Sanction Date"].toDate(),
              loanperiod: json["Loan Period"],
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
              sl: 0));
          ssanction.add(json['ID']);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var ScreenWidth = MediaQuery.of(context).size.width;

    double ResponsiveWidth = MediaQuery.of(context as BuildContext).size.width;
    double ResponsiveHeight =
        MediaQuery.of(context as BuildContext).size.height;

    bool desktop = false;
    bool tablet = false;
    bool mobile = false;

    if (ResponsiveWidth > 1400) {
      desktop = true;
      tablet = false;
      mobile = false;
    } else if (ResponsiveWidth > 540) {
      tablet = true;
      desktop = false;
      mobile = false;
    } else {
      mobile = true;
      desktop = false;
      tablet = false;
    }
    void _setupsanction(int ins) {
      selectedsanction = sanction[ins];
      bsanction = true;

      FirebaseFirestore.instance
          .collection('Member')
          .doc(selectedsanction.memberid)
          .get()
          .then((element) {
        if (element["Image"]) {
          imgurl = element["ImageURL"];
          setState(() {});
        }
      });
      setState(() {});
    }

    return Scaffold(
      appBar: Appbar(
        navbool: widget.appbool,
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: 100),
              child: Column(
                children: [
                  LoanDetailsWidget(
                    title: 'Loan Disbursement Details',
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  // Loan information
                  LoanInformation(
                      sanction: sanction,
                      bsanction: bsanction,
                      selectedsanction: selectedsanction,
                      selectedsanctionid: selectedsanctionid,
                      setupsanction: _setupsanction,
                      ssanction: ssanction),

                  SizedBox(
                    height: 30,
                  ),

                  // Loan Other imformation
                  LoanOtherInfo(
                      bsanction: bsanction, selectedsanction: selectedsanction),

                  SizedBox(
                    height: 30,
                  ),

                  // Link A/c Information
                  Padding(
                    padding: EdgeInsets.only(left: ScreenWidth / 21.94),
                    child: desktop
                        ? Row(
                            children: [
                              LinkACinfo(),
                              Spacer(),
                              ImageMember(imgurl: imgurl),
                            ],
                          )
                        : Column(
                            children: [
                              LinkACinfo(),

                              // Spacer(),
                              SizedBox(
                                height: 50,
                              ),

                              ImageMember(imgurl: imgurl),
                            ],
                          ),
                  ),

                  SizedBox(
                    height: 50,
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
