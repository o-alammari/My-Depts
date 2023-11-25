class Model {
  int id;
  String fruitName;
  String quantity;

  Model({required this.id,required this.fruitName,required this.quantity});

  Model fromJson(json) {
    return Model(
        id: json['id'], fruitName: json['fruitName'], quantity: json['quantity']);
  }
  Map<String, dynamic> toJson() {
    return {'fruitName': fruitName, 'quantity': quantity};
  }

}
