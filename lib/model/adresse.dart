class AdresseModel {
  int? id;
  String? fullName;
  String? adresse;
  String? state;
  String? city;
  int? zipCode;

  AdresseModel({
    required this.id,
    required this.fullName,
    required this.adresse,
    required this.state,
    required this.city,
    required this.zipCode,
  });

  AdresseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    adresse = json['adresse'];
    fullName = json['fullName'];
    state = json['state'];
    city = json['city'];
    zipCode = json['zipCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['adresse'] = this.adresse;
    data['fullName'] = this.fullName;
    data['state'] = this.state;
    data['city'] = this.city;
    data['zipCode'] = this.zipCode;

    return data;
  }
}
