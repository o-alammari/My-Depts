class ModelCustomer {
  // int idCustomer;
  int? idCustomer;
  String nameCustomer;
  String phoneCustomer;
  String creditCustomer;

  ModelCustomer({
    // required this.idCustomer,
    this.idCustomer,
    required this.nameCustomer,
    required this.phoneCustomer,
    required this.creditCustomer,
  });
  factory ModelCustomer.fromJson(Map<String, dynamic> json) => ModelCustomer(
        idCustomer: json['id'],
        nameCustomer: json['nameCustomer'],
        phoneCustomer: json['phoneCustomer'],
        creditCustomer: json['creditCustomer'],
      );

  // ModelCustomer fromJson(json) {
  //   return ModelCustomer(
  //     idCustomer: json['id'],
  //     nameCustomer: json['nameCustomer'],
  //     phoneCustomer: json['phoneCustomer'],
  //     creditCustomer: json['creditCustomer'],
  //   );
  // }

  Map<String, dynamic> toJson() {
    return {
      'id': idCustomer,
      'nameCustomer': nameCustomer,
      'phoneCustomer': phoneCustomer,
      'creditCustomer': creditCustomer,
    };
  }
}
