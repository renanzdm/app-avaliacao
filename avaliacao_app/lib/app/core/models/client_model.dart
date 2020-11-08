class ClientModel {
  ClientModel({
    this.id,
    this.primaryName,
    this.surname,
    this.phone,
    this.address,
  });

  int id;
  String primaryName;
  String surname;
  String phone;
  String address;

  factory ClientModel.fromJson(Map<String, dynamic> json) => ClientModel(
        id: json["id"],
        primaryName: json["primary_name"],
        surname: json["surname"],
        phone: json["phone"],
        address: json["address"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "primary_name": primaryName,
        "surname": surname,
        "phone": phone,
        "address": address,
      };

  copyWith(
      {int id,
      String primaryName,
      String surname,
      String phone,
      String address}) {
    return ClientModel(
        primaryName: primaryName ?? this.primaryName,
        surname: surname ?? this.surname,
        phone: phone ?? this.phone,
        address: address ?? this.address);
  }
}
