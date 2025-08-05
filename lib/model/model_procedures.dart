class ModelProcedures {
  final int? idProcedures;
  String nameProcedures;
  final int idCustomer;
  final String dateProcedures;
  int credit;
  int debit;

  ModelProcedures({
    this.idProcedures,
    required this.nameProcedures,
    required this.idCustomer,
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

  Map<String, dynamic> toJson() {
    return {
      'id': idProcedures,
      'nameProcedures': nameProcedures,
      'idCustomer': idCustomer,
      'dateProcedures': dateProcedures,
      'credit': credit,
      'debit': debit,
    };
  }
}