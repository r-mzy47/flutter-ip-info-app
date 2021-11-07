class IpDataModel  {
  final String ip;
  final String country;
  final String cc;

  IpDataModel({required this.cc, required this.country, required this.ip});

  IpDataModel.fromJson(Map<String, dynamic> json) : ip = json["ip"], cc = json["cc"], country = json["country"];
}