import 'package:intl/intl.dart';

class Memberss {
  String somiteename,
      somiteeid,
      membertype,
      occupation,
      firstname,
      lastname,
      fathername,
      mothername,
      gender,
      religion,
      nationalid,
      birthregi,
      age,
      education,
      maritalstatus,
      mobilenotype,
      mobilenno,
      presentadd,
      parmaadd,
      livingperiod,
      nomaleearner,
      nofemaleearner,
      annualincome,
      id,
      headfamily,
      ownhomestead,
      relationwithhead,
      landdesc,
      remarks,
      imageurl;
  late List<dynamic> deposit;
  late List<dynamic> withdraw;
  late double totaldeposit,totaldisbursement,totalwithdraw,repayment, totalloan;
  late DateTime lastrepaymentdate;
  bool img, sts, dead;
  DateTime birthdate;
  double loanpendingamount, owndepositamount;
  int sl;
  Memberss.ForReport(
      {required this.somiteename,
        required this.somiteeid,
        required this.membertype,
        required this.occupation,
        required this.totaldeposit,
        required this.totaldisbursement,
        required this.totalwithdraw,
        required this.repayment,
        required this.totalloan,
        required this.lastrepaymentdate,
        required this.loanpendingamount,
        required this.owndepositamount,
        required this.firstname,
        required this.lastname,
        required this.fathername,
        required this.deposit,
        required this.withdraw,
        required this.annualincome,
        required this.mothername,
        required this.gender,
        required this.religion,
        required this.nationalid,
        required this.sts,
        required this.birthregi,
        required this.age,
        required this.education,
        required this.maritalstatus,
        required this.mobilenotype,
        required this.mobilenno,
        required this.presentadd,
        required this.parmaadd,
        required this.livingperiod,
        required this.nomaleearner,
        required this.nofemaleearner,
        required this.id,
        required this.headfamily,
        required this.ownhomestead,
        required this.relationwithhead,
        required this.landdesc,
        required this.remarks,
        required this.imageurl,required this.dead,
        required this.img,
        required this.birthdate,
        required this.sl});
  dynamic getLastDepositInfo(bool returnDate) {
    if (deposit.isNotEmpty) {
      deposit.sort((a, b) {
        var dateA = DateTime.parse(a['date']);
        var dateB = DateTime.parse(b['date']);
        return dateB.compareTo(dateA);
      });

      if (returnDate) {
        return DateFormat.yMMMd().format(
          DateTime.parse(deposit[0]['date']),
        );
      } else {
        return deposit[0]['value'].toString();
      }
    } else {
      return returnDate ? '' : '0';
    }
  }
  Memberss(
      {required this.somiteename,
      required this.somiteeid,
      required this.membertype,
      required this.occupation,
      required this.loanpendingamount,
      required this.owndepositamount,
      required this.firstname,
      required this.lastname,
      required this.fathername,
      required this.annualincome,
      required this.mothername,
      required this.gender,
      required this.religion,
      required this.nationalid,
      required this.sts,
      required this.birthregi,
      required this.age,
      required this.education,
      required this.maritalstatus,
      required this.mobilenotype,
      required this.mobilenno,
      required this.presentadd,
      required this.parmaadd,
      required this.livingperiod,
      required this.nomaleearner,
      required this.nofemaleearner,
      required this.id,
      required this.headfamily,
      required this.ownhomestead,
      required this.relationwithhead,
      required this.landdesc,
      required this.remarks,
      required this.imageurl,required this.dead,
      required this.img,
      required this.birthdate,
      required this.sl});



  Memberss.withDepo(
      {required this.somiteename,
        required this.somiteeid,
        required this.membertype,
        required this.occupation,
        required this.loanpendingamount,
        required this.owndepositamount,
        required this.firstname,
        required this.lastname,
        required this.fathername,
        required this.deposit,
        required this.withdraw,
        required this.annualincome,
        required this.mothername,
        required this.gender,
        required this.religion,
        required this.nationalid,
        required this.sts,
        required this.birthregi,
        required this.age,
        required this.education,
        required this.maritalstatus,
        required this.mobilenotype,
        required this.mobilenno,
        required this.presentadd,
        required this.parmaadd,
        required this.livingperiod,
        required this.nomaleearner,
        required this.nofemaleearner,
        required this.id,
        required this.headfamily,
        required this.ownhomestead,
        required this.relationwithhead,
        required this.landdesc,
        required this.remarks,
        required this.imageurl,required this.dead,
        required this.img,
        required this.birthdate,
        required this.sl});

  Map toJson() => {
        'Somitee Name': somiteename,
        'Somitee ID': somiteeid,
        'Member Type': membertype,
        'Occupation': occupation,
        'First Name': firstname,
        'Last Name': lastname,
        'Father Name': fathername,
        'Mother Name': mothername,
        'Gender': gender,
        'Religion': religion,
        'National ID': nationalid,
        'Birth Registration': birthregi,
        'Age': age,
        'Date Of Birth': birthdate,'Dead':dead,
        'Education': education,
        'Marital Status': maritalstatus,
        'Mobile No Type': mobilenotype,
        'Mobile No': mobilenno,
        'Present Address': presentadd,
        'Permanent Address': parmaadd,
        'Living Period': livingperiod,
        'Annual Income': annualincome,
        'Loan Pending Amount': loanpendingamount,
        'Own deposit Amount': owndepositamount,
        'No Female Earner': nofemaleearner,
        'No Male Earner': nomaleearner,
        'ID': id,
        'Head Family': headfamily,
        'Own HomeStead': ownhomestead,
        'Relation With Head': relationwithhead,
        'Land Desc': landdesc,
        'Remarks': remarks,
        'Image': img,
        'Status': sts,
        'ImageURL': imageurl,
        'sl': sl
      };

  factory Memberss.fromJson(Map<String, dynamic> json) {
    return Memberss(
        somiteename: json['Somitee Name'].toString(),
        somiteeid: json['Somitee ID'].toString(),
        membertype: json['Member Type'].toString(),
        sts: json['Status'],
        occupation: json['Occupation'].toString(),
        firstname: json['First Name'].toString(),
        lastname: json['Last Name'].toString(),dead: json['Dead'],
        fathername: json['Father Name'].toString(),
        mothername: json['Mother Name'].toString(),
        gender: json['Gender'].toString(),
        religion: json['Religion'].toString() ?? '',
        nationalid: json['National ID'].toString(),
        birthregi: json['Birth Registration'].toString(),
        age: json['Age'].toString(),
        education: json['Education'].toString(),
        maritalstatus: json['Marital Status'].toString(),
        mobilenotype: json['Mobile No Type'].toString(),
        mobilenno: json['Mobile No'].toString(),
        loanpendingamount: json['Loan Pending Amount'],
        owndepositamount: json['Own deposit Amount'],
        presentadd: json['Present Address'].toString(),
        parmaadd: json['Permanent Address'].toString(),
        livingperiod: json['Living Period'].toString(),
        nomaleearner: json['No Male Earner'].toString(),
        nofemaleearner: json['No Female Earner'].toString(),
        id: json['ID'].toString(),
        headfamily: json['Head Family'].toString(),
        ownhomestead: json['Own HomeStead'].toString(),
        annualincome: json['Annual Income'].toString(),
        relationwithhead: json['Relation With Head'].toString(),
        landdesc: json['Land Desc'].toString(),
        remarks: json['Remarks'].toString(),
        imageurl: json['ImageURL'].toString(),
        img: json['Image'],
        birthdate: json['Date Of Birth'],
        sl: json['sl']);
  }
  bool filterFn(String query) {
    return firstname.toLowerCase().contains(query.toLowerCase()) ||
        lastname.toLowerCase().contains(query.toLowerCase()) ||
        id.toLowerCase().contains(query.toLowerCase());
  }
}
