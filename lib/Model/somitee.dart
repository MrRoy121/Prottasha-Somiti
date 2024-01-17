class Somitee {
  String name, phone, branch, address, id;
  double active, closed;
  int sl;

  Somitee(
      {required this.name,
      required this.phone,
      required this.branch,
      required this.id,
      required this.address,
      required this.closed,
      required this.active,
      required this.sl,
      required this.formation,
      required this.lastupdated});

  DateTime formation, lastupdated;
  bool filterFn(String query) {
    return name.toLowerCase().contains(query.toLowerCase()) ||
        id.toLowerCase().contains(query.toLowerCase());
  }
}
