class User {
  String id, type, pass;
  bool sts;
  DateTime lastlogin, lastlogout;

  User({
    required this.type,
    required this.id,
    required this.pass,
    required this.lastlogin,
    required this.lastlogout,
    required this.sts,
  });

  Map<String, dynamic> toJson() => {
        'ID': id,
        'Password': pass,
        'Type': type,
        'Last Login': lastlogin.toIso8601String(),
        'Last Logout': lastlogout.toIso8601String(),
        'Admin': sts,
      };

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      type: json['Type'],
      id: json['ID'],
      pass: json['Password'],
      lastlogin: DateTime.parse(json['Last Login']),
      lastlogout: DateTime.parse(json['Last Logout']),
      sts: json['Admin'],
    );
  }
}
