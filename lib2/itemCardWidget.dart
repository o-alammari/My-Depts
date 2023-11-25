import 'package:flutter/material.dart';
// import 'package:sqflite_flutter/dataBase.dart';
// import 'package:testing_2/dataBase.dart';
import 'model.dart';

class ItemCard extends StatefulWidget {
  // const ItemCard({super.key});
  Model? model;
  TextEditingController input1;
  TextEditingController input2;
  Function() onDeletePress;
  Function() onEditPress;

  ItemCard(
      {required this.model,
      required this.input1,
      required this.input2,
      required this.onDeletePress,
      required this.onEditPress,
      super.key});

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  // final DbManager dbManager = new DbManager();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Name: ${widget.model!.fruitName}',
                    style: const TextStyle(fontSize: 15),
                  ),
                  Text(
                    'Quantity: ${widget.model!.quantity}',
                    style: const TextStyle(fontSize: 15),
                  ),
                ],
              ),
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      onPressed: widget.onEditPress,
                      icon: const Icon(
                        Icons.edit,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      onPressed: widget.onDeletePress,
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  
  }
}

class DialogBox {
  Widget dialog({
    required BuildContext context,
    required Function() onPressed,
    required TextEditingController textEditingController1,
    required TextEditingController textEditingController2,
    // required FocusNode input1FocusNode,
    // required FocusNode input2FocusNode
  }) {
    return AlertDialog(
      title: const Text("Enter Data"),
      content: Container(
        height: 100,
        child: Column(
          children: [
            TextFormField(
              controller: textEditingController1,
              keyboardType: TextInputType.text,
              // focusNode: input1FocusNode,
              decoration: const InputDecoration(hintText: "Fruit Name"),
              autofocus: true,
              onFieldSubmitted: (value) {
                // input1FocusNode.unfocus();
                // FocusScope.of(context).requestFocus(input2FocusNode);
              },
            ),
            TextFormField(
              controller: textEditingController2,
              keyboardType: TextInputType.number,
              // focusNode: input2FocusNode,
              decoration: const InputDecoration(hintText: "Quantity"),
              onFieldSubmitted: (value) {
                // input2FocusNode.unfocus();
              },
            ),
          ],
        ),
      ),
      actions: [
        MaterialButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          color: Colors.blueGrey,
          child: const Text(
            "Cancel",
          ),
        ),
        MaterialButton(
          onPressed: onPressed,
          color: Colors.blue,
          child: const Text("Submit"),
        )
      ],
    );
  }
}
