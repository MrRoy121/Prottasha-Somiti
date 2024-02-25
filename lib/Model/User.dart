class User {
  String name, phone, id,type, pass, details;
  bool sts;
  DateTime lastlogin, lastlogout;
  String user;

  User({
    required this.name,
    required this.phone,
    required this.id,
    required this.pass,
    required this.details,
    required this.user,
    required this.type,
    required this.lastlogin,
    required this.lastlogout,
    required this.sts,
  });

  Map<String, dynamic> toJson() => {
    'Name': name,
    'Phone': phone,
    'ID': id,
    'Password': pass,
    'Details': details,'Type':type,
    'User':user,
    'Last Login': lastlogin.toIso8601String(),
    'Last Logout': lastlogout.toIso8601String(),
    'Admin': sts,
  };

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['Name'],
      phone: json['Phone'],
      id: json['ID'],
      pass: json['Password'],
      details: json['Details'],type: json['Type'],
      user: json['User'],
      lastlogin: DateTime.parse(json['Last Login']),
      lastlogout: DateTime.parse(json['Last Logout']),
      sts: json['Admin'],
    );
  }
}