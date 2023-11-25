import 'dart:io';
import 'dart:typed_data';

class User {
  int? id;
  String? name;
  String? contact;
  String? description;
  Uint8List? image;

  
// User fromJson(json) {
//     return User(
//       id: json['id'],
//       nameCustomer: json['nameCustomer'],
//       phoneCustomer: json['phoneCustomer'],
//       creditCustomer: json['creditCustomer'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'nameCustomer': nameCustomer,
//       'creditCustomer': creditCustomer,
//     };
//   }
  userMap() {
    var mapping = Map<String, dynamic>();
    mapping['id'] = id;
    mapping['name'] = name!;
    mapping['contact'] = contact!;
    mapping['description'] = description!;
    mapping['image'] = image!;

    return mapping;
  }
}
