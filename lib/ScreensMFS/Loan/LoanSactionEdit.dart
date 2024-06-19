import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:prottashasomit/ScreensMFS/Loan/widgets/LoanGuarantor.dart';
import 'package:prottashasomit/ScreensMFS/Loan/widgets/LoanGuarantor.dart';
import 'package:prottashasomit/ScreensMFS/Loan/widgets/LoanSamitteSelectionUpdate.dart';
import '../../../../Constants/Constants.dart';
import '../../../../Constants/values.dart';
import '../../../../Model/member.dart';
import 'package:get/get.dart';
import '../../../../Model/somitee.dart';
import '../../../../route.dart';
import '../../../Model/loanSanction.dart';
import '../Widget/Appbar.dart';
import '../Widget/Appbool.dart';
import '../Widget/NavBoolMFS.dart';
import '../Widget/NavbarScreenMFS.dart';

class LoanSanctionEdit extends StatefulWidget {
  Navbool navbool;
  Appbool appbool;

  LoanSanctionEdit({required this.appbool, required this.navbool});

  @override
  State<LoanSanctionEdit> createState() => _LoanSanctionEditState();
}

class _LoanSanctionEditState extends State<LoanSanctionEdit> {
  List<Somitee> somitee = [];
  List<String> ssomitee = [];
  List<Memberss> allmemberss = [];
  List<Memberss> memberss = [];
  late loanSanction cst;
  bool memberselection = false;
  var selectedsomiti;
  var selectedloanpurpose;
  var sselectedsomiti;
  var selectedmemberss;
  var _selectedscheme;
  var _selectedloantype;
  var sselectedmemberss;
  var _selectedinstalment;
  var _selectedloanperiod;
  DateTime selectedDate = DateTime.now();
  var congrfname = TextEditingController();
  var congrffname = TextEditingController();
  var congrfrelation = TextEditingController();
  var congrfmobile = TextEditingController();
  var congrfoccupasion = TextEditingController();
  var congrsname = TextEditingController();
  var congrsfname = TextEditingController();
  var congrsrelation = TextEditingController();
  var congrsmobile = TextEditingController();
  var congrsoccupasion = TextEditingController();
  var congrpname = TextEditingController();
  var congrpfname = TextEditingController();
  var congrprelation = TextEditingController();
  var conduratioon = TextEditingController();
  var congrpmobile = TextEditingController();
  var congrpoccupasion = TextEditingController();
  var coninstallmentno = TextEditingController();
  var conremarks = TextEditingController();
  var coninstallmentamount = TextEditingController();
  var consanctionlimit = TextEditingController();
  var conservicecharge = TextEditingController();
  double serviceamount = 0;
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
            closed: element["Closed"],
            lastupdated: element["Last Edited"].toDate(),
            name: element["Name"],
            active: element["Active"],
            formation: element["Formation Date"].toDate(),
            phone: element["Phone"],
            branch: element["Branch"],
            sl: 0));
        ssomitee.add(element["Name"]);
      }
    });
    await FirebaseFirestore.instance
        .collection('Member')
        .get()
        .then((querySnapshot) {
      for (var element in querySnapshot.docs) {
        if (element["Status"]) {
          allmemberss.add(Memberss(
              somiteename: element["Somitee Name"],
              somiteeid: element["Somitee ID"],
              membertype: element["Member Type"],
              occupation: element["Occupation"],dead: element['Dead'],
              firstname: element["First Name"],
              lastname: element["Last Name"],
              fathername: element["Father Name"],
              fee: element["Fee"],
              sts: element["Status"],
              mothername: element["Mother Name"],
              loanpendingamount: element["Loan Pending Amount"],
              owndepositamount: element["Own deposit Amount"],
              gender: element["Gender"],
              religion: element["Religion"],
              nationalid: element["National ID"],
              birthregi: element["Birth Registration"],
              annualincome: element["Annual Income"],
              age: element["Age"],
              education: element["Education"],
              maritalstatus: element["Marital Status"],
              mobilenotype: element["Mobile No Type"],
              mobilenno: element["Mobile No"],
              presentadd: element["Present Address"],
              parmaadd: element["Permanent Address"],
              livingperiod: element["Living Period"],
              nomaleearner: element["No Female Earner"],
              nofemaleearner: element["No Male Earner"],
              id: element.id,
              headfamily: element["Head Family"],
              ownhomestead: element["Own HomeStead"],
              relationwithhead: element["Relation With Head"],
              landdesc: element["Land Desc"],
              remarks: element["Remarks"],
              imageurl: element["ImageURL"],
              img: element["Image"],
              birthdate: element["Date Of Birth"].toDate(),
              sl: 0));
        }
      }
      _addinit();
    });
  }

  void _onclear() {
    setState(() {
      var ss;
      sselectedsomiti = ss;
      selectedsomiti = ss;
      selectedmemberss = ss;
      selectedloanpurpose = ss;
      _selectedinstalment = ss;
      _selectedloanperiod = ss;
      _selectedscheme = ss;
      _selectedloantype = ss;
      conduratioon.text = '';
      consanctionlimit.text = "";
      conservicecharge.text = "";
      coninstallmentno.text = "";
      coninstallmentamount.text = "";
      serviceamount = 0;
      conremarks.text = "";
      congrffname.text = "";
      congrfrelation.text = "";
      congrfmobile.text = "";
      congrfoccupasion.text = "";
      congrsname.text = "";
      congrsfname.text = "";
      congrsrelation.text = "";
      congrsmobile.text = "";
      congrsoccupasion.text = "";
      congrpname.text = "";
      congrpfname.text = "";
      congrprelation.text = "";
      congrpmobile.text = "";
      congrpoccupasion.text = "";
    });
  }

  void _save(loanSanction cst) async {
    if (selectedsomiti == null ||
        selectedmemberss == null ||
        selectedloanpurpose == null ||
        _selectedscheme == null ||
        congrfname.text == "" ||
        congrffname.text == "" ||
        congrfrelation.text == "" ||
        _selectedloantype == null ||
        congrfmobile.text == "" ||
        congrfoccupasion.text == "" ||
        congrsname.text == "" ||
        congrsfname.text == "" ||
        congrsrelation.text == "" ||
        congrsmobile.text == "" ||
        congrsoccupasion.text == "" ||
        congrpname.text == "" ||
        congrpfname.text == "" ||
        congrprelation.text == "" ||
        congrpmobile.text == "" ||
        congrpoccupasion.text == "" ||
        consanctionlimit.text.isEmpty ||
        _selectedinstalment == null) {
      Get.snackbar(
          "Load Sanction Request Failed.", "Some Required Fields are Empty",
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
      FirebaseFirestore.instance.collection('LoanSanction').doc(cst.id).update({
        'Somitee Name': selectedsomiti.name,
        'Somitee ID': selectedsomiti.id,
        'Member Name':
            selectedmemberss.firstname + " " + selectedmemberss.lastname,
        'Member ID': selectedmemberss.id,
        'Member Phone': selectedmemberss.mobilenno,
        "Sanction Limit": double.parse(consanctionlimit.text),
        "Installment Frequency": _selectedinstalment,
        "Sanction Date": selectedDate,
        "Loan Purpose": selectedloanpurpose,
        "Loan Scheme": _selectedscheme.name,
        'Loan Category': _selectedloantype,
        "Loan Period": _selectedloanperiod,
        "Service Charge": double.parse(conservicecharge.text),
        "Installment No": double.parse(coninstallmentno.text),
        "Installment Amount": double.parse(coninstallmentamount.text),
        "Remarks": conremarks.text,
        "Service Amount": serviceamount,
        "Grantor F Name": congrfname.text,
        "Grantor F FatherName": congrffname.text,
        "Grantor F Relation": congrfrelation.text,
        "Grantor F Mobile": congrfmobile.text,
        "Grantor F Occupation": congrfoccupasion.text,
        "Grantor S Name": congrsname.text,
        "Grantor S FatherName": congrsfname.text,
        "Grantor S Relation": congrsrelation.text,
        "Grantor S Mobile": congrsmobile.text,
        "Grantor S Occupation": congrsoccupasion.text,
        "Grantor P Name": congrpname.text,
        "Grantor P FatherName": congrpfname.text,
        "Grantor P Relation": congrprelation.text,
        "Grantor P Mobile": congrpmobile.text,
        "Grantor P Occupation": congrpoccupasion.text,
        "Status": "Requested",
        'ID': cst.id,
      }).then((value) async {
        Get.offNamed(loanrequestlistPageRoute);
        Get.snackbar("Loan Sanction Added Successfully.",
            "Redirecting to Loan Sanction List Page.",
            snackPosition: SnackPosition.BOTTOM,
            colorText: Colors.white,
            backgroundColor: Colors.green,
            margin: EdgeInsets.zero,
            duration: const Duration(milliseconds: 2000),
            boxShadows: [
              const BoxShadow(
                  color: Colors.grey, offset: Offset(-100, 0), blurRadius: 20),
            ],
            borderRadius: 0);
      }).catchError((error) => print("Failed to add user: $error"));
    }
  }

  void _addinit() {
    setState(() {
      print(cst.toJson());
      selectedsomiti = somitee[ssomitee.indexOf(cst.somiteename)];
      sselectedsomiti = cst.somiteename;
      memberselection = true;
      memberss = allmemberss
          .where((member) => member.somiteeid == selectedsomiti.id)
          .toList();
      selectedmemberss =
          memberss.firstWhere((member) => member.id == cst.memberid);
      selectedloanpurpose = cst.loanpurpose;
      _selectedinstalment = cst.installmentfrequency;
      consanctionlimit.text = cst.sanctionlimit.toString();
      conservicecharge.text = cst.servicecharge.toString();
      coninstallmentno.text = cst.installmentno.toString();
      coninstallmentamount.text = cst.installmentamount.toString();
      serviceamount = cst.serviceamount;
      conremarks.text = cst.remarks;
      congrfname.text = cst.grantorfname;

      _selectedscheme =
          LoanSchemes.firstWhere((element) => element.name == cst.scheme);
      conduratioon.text = _selectedscheme.duration.toString();
      _selectedloantype = cst.category;
      congrffname.text = cst.grantorffname;
      congrfrelation.text = cst.grantorfrelation;
      congrfmobile.text = cst.grantorfmobile;
      congrsname.text = cst.grantorsname;
      congrsfname.text = cst.grantorsfname;
      congrsrelation.text = cst.grantorsrelation;
      congrsmobile.text = cst.grantorsmobile;
      congrpname.text = cst.grantorpname;
      congrpfname.text = cst.grantorpfname;
      congrprelation.text = cst.grantorprelation;
      congrpmobile.text = cst.grantorpmobile;
      congrpoccupasion.text = cst.grantorpocupasion;
      congrsoccupasion.text = cst.grantorsocupasion;
      congrfoccupasion.text = cst.grantorfocupasion;
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

    void _setupinstallment(int ins) {
      setState(() {
        _selectedinstalment = InstallmentFrequencyList[ins];
      });
    }

    void _resetloanscheme() {
      var vs;
      setState(() {
        _selectedscheme = vs;
        _selectedinstalment = vs;
        conduratioon.text = '';
        coninstallmentno.text = '';
        coninstallmentamount.text = '';
        conservicecharge.text = '';
        serviceamount = 0;
      });
    }

    void _setuploanscheme(int ins) {
      setState(() {
        _selectedscheme = LoanSchemes[ins];
        _selectedinstalment = InstallmentFrequencyList[0];
        coninstallmentno.text = _selectedscheme.installmentno.toString();
        conduratioon.text = _selectedscheme.duration.toString();
        coninstallmentamount.text =
            _selectedscheme.installmentamount.toString();
        conservicecharge.text = _selectedscheme.servicecharge.toString();
        serviceamount = double.parse(conservicecharge.text) +
            double.parse(coninstallmentamount.text);
      });
    }

    void _setuploanpurpose(int ins) {
      setState(() {
        selectedloanpurpose = LoanPurposeList[ins];
      });
    }

    void _setuplloantype(int ins) {
      setState(() {
        _selectedloantype = LoanType[ins];
      });
    }

    var arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    loanSanction mst = loanSanction(
        somiteename: arguments['LoanSanction']["Somitee Name"],
        somiteeid: arguments['LoanSanction']["Somitee ID"],
        loanpurpose: arguments['LoanSanction']['Loan Purpose'],
        membername: arguments['LoanSanction']['Member Name'],
        memberid: arguments['LoanSanction']['Member ID'],
        memberphone: arguments['LoanSanction']['Member Phone'],
        sanctionlimit: arguments['LoanSanction']["Sanction Limit"],approvedby: arguments['LoanSanction']["Approved By"],requestedby: arguments['LoanSanction']["Requested By"],
        installmentfrequency: arguments['LoanSanction']
            ["Installment Frequency"],
        sanctiondate: arguments['LoanSanction']["Sanction Date"],
        scheme: arguments['LoanSanction']["Loan Scheme"],
        category: arguments['LoanSanction']['Loan Category'],
        servicecharge: arguments['LoanSanction']["Service Charge"],
        installmentno: arguments['LoanSanction']["Installment No"],
        installmentamount: arguments['LoanSanction']["Installment Amount"],
        remarks: arguments['LoanSanction']["Remarks"],
        serviceamount: arguments['LoanSanction']["Service Amount"],
        grantorfname: arguments['LoanSanction']["Grantor F Name"],
        grantorffname: arguments['LoanSanction']["Grantor F FatherName"],
        grantorfrelation: arguments['LoanSanction']["Grantor F Relation"],
        grantorfmobile: arguments['LoanSanction']["Grantor F Mobile"],
        grantorfocupasion: arguments['LoanSanction']["Grantor F Occupation"],
        approvedate: arguments['LoanSanction']["Approve Date"].toDate(),
        grantorsname: arguments['LoanSanction']["Grantor S Name"],
        grantorsfname: arguments['LoanSanction']["Grantor S FatherName"],
        grantorsrelation: arguments['LoanSanction']["Grantor S Relation"],
        grantorsmobile: arguments['LoanSanction']["Grantor S Mobile"],
        grantorsocupasion: arguments['LoanSanction']["Grantor S Occupation"],
        grantorpname: arguments['LoanSanction']["Grantor P Name"],
        grantorpfname: arguments['LoanSanction']["Grantor P FatherName"],
        grantorprelation: arguments['LoanSanction']["Grantor P Relation"],
        grantorpmobile: arguments['LoanSanction']["Grantor P Mobile"],
        grantorpocupasion: arguments['LoanSanction']["Grantor P Occupation"],
        status: arguments['LoanSanction']["Status"],
        id: arguments['LoanSanction']['ID'],
        sl: arguments['LoanSanction']['sl']);
    cst = mst;

    return Scaffold(
      appBar: Appbar(
        navbool: widget.appbool,
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 100, left: 50),
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),

                  LoanSamitteSelectionUpdate(
                      ssomitee: ssomitee,
                      setupsomiti: _setupsomiti,
                      mst: mst,
                      conremarks: conremarks,
                      selectedloantype: _selectedloantype,
                      consanctionlimit: consanctionlimit,
                      coninstallmentamount: coninstallmentamount,
                      conduratioon: conduratioon,
                      coninstallmentno: coninstallmentno,
                      setuplloantype: _setuplloantype,
                      selectedsomiteeid: selectedsomiti,
                      selectedscheme: _selectedscheme,
                      setuploanpurpose: _setuploanpurpose,
                      setuplloanscheme: _setuploanscheme,
                      serviceamount: serviceamount,
                      resetloanscheme: _resetloanscheme,
                      conservicecharge: conservicecharge,
                      selectedloanpurpose: selectedloanpurpose,
                      setupinstallment: _setupinstallment,
                      selectedDate: selectedDate,
                      allmemberss: allmemberss,
                      selectedinstalment: _selectedinstalment,
                      setupmemberss: _setupmemberss,
                      onsubmit: _save,
                      memberssselected: memberselection,
                      selectedmemberssid: sselectedmemberss,
                      somitee: somitee,
                      selectedmemberss: selectedmemberss,
                      onclear: _onclear,
                      memberss: memberss,
                      selectedsomitee: sselectedsomiti),

                  SizedBox(
                    height: 50,
                  ),

                  SizedBox(
                    height: 50,
                  ),
                  // LoanGuarantorFamily(),

                  LoanGuarantor(
                      sss: "Social",
                      congrname: congrsname,
                      congrfname: congrsfname,
                      congrmobile: congrsmobile,
                      congropcupasion: congrsoccupasion,
                      congrrelation: congrsrelation),
                  SizedBox(
                    height: 50,
                  ),
                  LoanGuarantor(
                      sss: "Family",
                      congrname: congrfname,
                      congrfname: congrffname,
                      congrmobile: congrfmobile,
                      congropcupasion: congrfoccupasion,
                      congrrelation: congrfrelation),
                  SizedBox(
                    height: 50,
                  ),
                  LoanGuarantor(
                      sss: "Bussiness",
                      congrname: congrpname,
                      congrfname: congrpfname,
                      congrmobile: congrpmobile,
                      congropcupasion: congrpoccupasion,
                      congrrelation: congrprelation),
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
