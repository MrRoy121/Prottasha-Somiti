import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:prottashasomit/ScreensMFS/Loan/widgets/LoanDetailsWidget.dart';
import 'package:prottashasomit/ScreensMFS/Loan/widgets/LoanInformation.dart';
import 'package:prottashasomit/ScreensMFS/Loan/widgets/LoanOtherInfo.dart';
import '../../../Model/loanSanction.dart';
import '../../Constants/values.dart';
import '../../Model/account.dart';
import '../../Model/member.dart';
import '../../Model/scheme.dart';
import '../../helpers/auth_service.dart';
import '../../route.dart';
import '../Transaction/widget/Image.dart';
import '../Transaction/widget/LinkACinfo.dart';
import '../Widget/Appbar.dart';
import '../Widget/Appbool.dart';
import '../Widget/NavBoolMFS.dart';
import '../Widget/NavbarScreenMFS.dart';
import 'package:get/get.dart';

class LoanDisbursement extends StatefulWidget {
  Navbool navbool;
  Appbool appbool;

  LoanDisbursement({required this.appbool, required this.navbool});

  @override
  State<LoanDisbursement> createState() => _LoanDisbursementState();
}

class _LoanDisbursementState extends State<LoanDisbursement> {
  List<loanSanction> sanction = [];
  List<String> ssanction = [];
  bool bsanction = false;
  List<Accountss> accounts = [];
  var selectedaccount;
  var ssscheme;
  var memberss;
  var selectedsanction;
  var condisbursed = TextEditingController();
  var conpincode = TextEditingController();
  var connarration = TextEditingController(text: "Loan Disbursement");
  String deathrisk = '';
  double deathriskamount = 0;
  bool mmems = false;
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
          sanction.add(loanSanction(
              somiteename: json['Somitee Name'],
              somiteeid: json['Somitee ID'],
              membername: json['Member Name'],
              memberid: json['Member ID'],
              loanpurpose: json["Loan Purpose"],
              approvedate: json["Approve Date"].toDate(),
              memberphone: json['Member Phone'],
              scheme: json["Loan Scheme"],
              approvedby: json["Approved By"],
              requestedby: json["Requested By"],
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
          ssanction.add(json['ID']);
        }
      }
    });
    int s = 0;
    await FirebaseFirestore.instance
        .collection('Account')
        .get()
        .then((querySnapshot) {
      for (var element in querySnapshot.docs) {
        accounts.add(Accountss(
            introducertype: element["Introducer Type"],
            member: element["Member"],
            introducerno: element["Introducer No"],
            nomineename: element["Nominee Name"],
            nomineepercentage: element["Nominee Percentage"],
            accounttype: element["Account Type"],
            nomineeimage: element["Nominee Image"],
            relation: element["Relation"],
            introducername: element["Introducer Name"],
            requestdate: element["Request Date"].toDate(),
            requestedby: element["Requested By"],
            approvedby: element["Approve By"],
            sector: element["Sector"],
            documenttype: element["Document Type"],
            fathername: element["Father Name"],
            documentno: element["Document No"],
            docmentfront: element["Document Front"],
            documentback: element["Document Back"],
            dateofbirth: element["Date Of Birth"].toDate(),
            mothername: element["Mother Name"],
            id: element.id,
            approvedate: element["Approve Date"].toDate(),
            status: element["Status"],
            approve: element["Approve"],
            sl: s));
        s++;
      }
    });
  }

  void _onclear() {
    setState(() {
      var ss;
      deathriskamount = 0;
      deathrisk = "";
      selectedsanction = ss;
      bsanction = false;
      ssscheme = ss;
      memberss = ss;
      condisbursed.text = "";
      connarration.text = "Loan Disbursement";
      conpincode.text = "";
    });
  }

  void _save() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('LoanDisbursed').get();

    int numberOfItems = querySnapshot.size;
    if (selectedsanction == null ||
        selectedaccount == null ||
        condisbursed.text == "" ||
        connarration.text == "") {
      Get.snackbar(
          "Load Disbursement Request Failed.", "Some Required Fields are Empty",
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
      FirebaseFirestore.instance
          .collection('LoanDisbursed')
          .doc(selectedsanction.id)
          .set({
        'Sanction': selectedsanction.toJson(),
        'Somitee Name': selectedsanction.somiteename,
        'Somitee ID': selectedsanction.somiteeid,
        'Member Name': selectedsanction.membername,
        'Member ID': selectedsanction.memberid,
        "Requested By":
            "${AuthService.to.user!.id}-(*)-${AuthService.to.user!.name}",
        "Approved By": '',
        "Approve": false,
        'Status': false,
        'Death Risk Amount': deathriskamount,
        'SL': numberOfItems + 1,
        'Disbursed Amount': double.parse(condisbursed.text),
        'Pin Code': conpincode.text,
        'Disbursed Date': DateTime.now(),
        'Approve Date': selectedsanction.approvedate,
        'Narration': connarration.text,
      }).then((value) async {
        FirebaseFirestore.instance
            .collection('LoanSanction')
            .doc(selectedsanction.id)
            .delete()
            .then((value) {
          Get.offNamed(loandisbursementlistPageRoute);
          Get.snackbar("Loan Sanction Added Successfully.",
              "Redirecting to Loan Sanction List Page.",
              snackPosition: SnackPosition.BOTTOM,
              colorText: Colors.white,
              backgroundColor: Colors.green,
              margin: EdgeInsets.zero,
              duration: const Duration(milliseconds: 2000),
              boxShadows: [
                const BoxShadow(
                    color: Colors.grey,
                    offset: Offset(-100, 0),
                    blurRadius: 20),
              ],
              borderRadius: 0);
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    void updatedeath() {
      if (double.parse(condisbursed.text.toString()) >= 10000 &&
          double.parse(condisbursed.text.toString()) <= 500000) {
        deathriskamount = double.parse(condisbursed.text.toString()) * 0.0060;
        deathrisk = "0.60%";
      } else if (double.parse(condisbursed.text.toString()) >= 500001 &&
          double.parse(condisbursed.text.toString()) <= 1000000) {
        deathriskamount = double.parse(condisbursed.text.toString()) * 0.0065;
        deathrisk = "0.65%";
      } else if (double.parse(condisbursed.text.toString()) >= 1000001 &&
          double.parse(condisbursed.text.toString()) <= 2000000) {
        deathriskamount = double.parse(condisbursed.text.toString()) * 0.0070;
        deathrisk = "0.70%";
      } else if (double.parse(condisbursed.text.toString()) >= 2000001 &&
          double.parse(condisbursed.text.toString()) <= 3000000) {
        deathriskamount = double.parse(condisbursed.text.toString()) * 0.0075;
        deathrisk = "0.75%";
      } else if (double.parse(condisbursed.text.toString()) >= 3000001 &&
          double.parse(condisbursed.text.toString()) <= 5000000) {
        deathriskamount = double.parse(condisbursed.text.toString()) * 0.0080;
        deathrisk = "0.80%";
      } else if (double.parse(condisbursed.text.toString()) >= 5000001 &&
          double.parse(condisbursed.text.toString()) <= 10000000) {
        deathriskamount = double.parse(condisbursed.text.toString()) * 0.0090;
        deathrisk = "0.90%";
      } else if (double.parse(condisbursed.text.toString()) >= 10000001 &&
          double.parse(condisbursed.text.toString()) <= 30000000) {
        deathriskamount = double.parse(condisbursed.text.toString()) * 0.010;
        deathrisk = "1.00%";
      }
      setState(() {});
    }

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
    Future<void> _setupsanction(int ins) async {
      selectedsanction = sanction[ins];
      bsanction = true;
      condisbursed.text = selectedsanction.sanctionlimit.toString();
      ssscheme = LoanSchemes.firstWhere(
          (element) => element.name == selectedsanction.scheme);
      await FirebaseFirestore.instance
          .collection('Member')
          .doc(selectedsanction.memberid)
          .get()
          .then((element) {
        memberss = Memberss(
            somiteename: element["Somitee Name"],
            somiteeid: element["Somitee ID"],
            membertype: element["Member Type"],
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
            sl: 0);
      });
      updatedeath();
    }

    Future<void> _setupaccount(int ins) async {
     setState(() {
       selectedaccount = accounts[ins];
       mmems = true;
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
              margin: EdgeInsets.only(top: 100),
              child: Column(
                children: [
                  LoanDetailsWidget(
                    title: 'Loan Disbursement Details',
                    onsubmit: _save,
                    onfine: () {},
                    showfine: false,
                    onclear: _onclear,
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  // Loan information
                  LoanInformation(
                      sanction: sanction,
                      scheme: ssscheme,
                      bsanction: bsanction,
                      deathriskamount: deathriskamount,
                      selectedsanction: selectedsanction,
                      condisbursed: condisbursed,
                      conpincode: conpincode,
                      connarration: connarration,
                      setupsanction: _setupsanction,
                      ssanction: ssanction),

                  SizedBox(
                    height: 30,
                  ),

                  // Loan Other imformation
                  LoanOtherInfo(
                      bsanction: bsanction,
                      condisburse: condisbursed,
                      scheme: ssscheme,
                      deathrisk: deathrisk,
                      selectedsanction: selectedsanction),

                  SizedBox(
                    height: 30,
                  ),

                  // Link A/c Information
                  Padding(
                    padding: EdgeInsets.only(left: ScreenWidth / 21.94),
                    child: desktop
                        ? Row(
                            children: [
                              LinkACinfo(
                                  memberss: memberss,
                                  accounts: accounts,setupaccount: _setupaccount,
                                  selectedaccount: selectedaccount,
                                  selectedsanction: selectedsanction,
                                  bsanction: bsanction,
                                  scheme: ssscheme),
                              Spacer(),
                              memberss == null
                                  ? ImageMember(imgurl: '')
                                  : ImageMember(imgurl: memberss.imageurl),
                            ],
                          )
                        : Column(
                            children: [
                              LinkACinfo(
                                  memberss: memberss,
                                  accounts: accounts,setupaccount: _setupaccount,
                                  selectedaccount: selectedaccount,
                                  selectedsanction: selectedsanction,
                                  bsanction: bsanction,
                                  scheme: ssscheme),

                              // Spacer(),
                              SizedBox(
                                height: 50,
                              ),

                              memberss == null
                                  ? ImageMember(imgurl: '')
                                  : ImageMember(imgurl: memberss.imageurl),
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
