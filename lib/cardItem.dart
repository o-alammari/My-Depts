// import 'package:flutter/material.dart';

// class ItemCard extends StatefulWidget {
//   Model model;
//   TextEditingController input1;
//   TextEditingController input2;
//   Function onDeletePress;
//   Function onEditPress;

//   ItemCard(
//       {this.model,
//       this.input1,
//       this.input2,
//       this.onDeletePress,
//       this.onEditPress});

//   @override
//   _ItemCardState createState() => _ItemCardState();
// }

// class _ItemCardState extends State<ItemCard> {
//   final DbManager dbManager = new DbManager();

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Card(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: <Widget>[
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Text(
//                     'Name: ${widget.model.fruitName}',
//                     style: TextStyle(fontSize: 15),
//                   ),
//                   Text(
//                     'Quantity: ${widget.model.quantity}',
//                     style: TextStyle(
//                       fontSize: 15,
//                     ),
//                   ),
//                 ],
//               ),
//               Row(
//                 children: [
//                   CircleAvatar(
//                     backgroundColor: Colors.white,
//                     child: IconButton(
//                       onPressed: widget.onEditPress,
//                       icon: Icon(
//                         Icons.edit,
//                         color: Colors.blueAccent,
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     width: 15,
//                   ),
//                   CircleAvatar(
//                     backgroundColor: Colors.white,
//                     child: IconButton(
//                       onPressed: widget.onDeletePress,
//                       icon: Icon(
//                         Icons.delete,
//                         color: Colors.red,
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


