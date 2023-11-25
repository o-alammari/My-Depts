// ignore_for_file: public_member_api_docs, sort_constructors_first
class User {
  int id;
  String fruitName;
  String quantity;

  User({required this.id, required this.fruitName, required this.quantity});

  User fromJson(json) {
    return User(
        id: json['id'],
        fruitName: json['fruitName'],
        quantity: json['quantity']);
  }

  Map<String, dynamic> toJson() {
    return {'fruitName': fruitName, 'quantity': quantity};
  }
}

class ModelProcedures {
  final int? idProcedures;
  String nameProcedures;
  // String nameCustomer;
  final int idCustomer;
  final String dateProcedures;
  String credit;
  String debit;

  ModelProcedures({
    this.idProcedures,
    required this.nameProcedures,
    required this.idCustomer,
    // required this.nameCustomer,
    required this.dateProcedures,
    required this.credit,
    required this.debit,
  });

  factory ModelProcedures.fromJson(Map<String, dynamic> json) =>
      ModelProcedures(
        idProcedures: json['id'],
        nameProcedures: json['nameProcedures'],
        idCustomer: json['idCustomer'],
        dateProcedures: json['dateProcedures'] ?? '',
        credit: json['credit'],
        debit: json['debit'],
      );

  // ModelProcedures fromJson(json) {
  //   return ModelProcedures(
  //     idProcedures: json['id'],
  //     nameProcedures: json['nameProcedures'],
  //     idCustomer: json['idCustomer'],
  //     dateProcedures: json['dateProcedures'],
  //     credit: json['credit'],
  //     debit: json['debit'],
  //   );
  // }

  Map<String, dynamic> toJson() {
    return {
      // 'nameCustomer': nameCustomer,
      'id': idProcedures,
      'nameProcedures': nameProcedures,
      'idCustomer': idCustomer,
      'dateProcedures': dateProcedures,
      'credit': credit,
      'debit': debit,
    };
  }
}
