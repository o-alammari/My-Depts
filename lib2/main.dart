import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../lib2/model.dart';
// import 'package:sqflite_flutter/model.dart';
import 'dataBase.dart';
import 'itemCardWidget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.blue,
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // final DbManager dbManager = new DbManager();

  Model? model;
  List<Model>? modelList;
  TextEditingController input1 = TextEditingController();
  TextEditingController input2 = TextEditingController();
  FocusNode? input1FocusNode;
  FocusNode? input2FocusNode;

  @override
  void initState() {
    input1FocusNode = FocusNode();
    input2FocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    input1FocusNode!.dispose();
    input2FocusNode!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sqlite Demo'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return DialogBox().dialog(
                  context: context,
                  onPressed: () {
                    model = Model(
                        id: 0, fruitName: input1.text, quantity: input2.text);
                    // dbManager.insertModel(model);
                    setState(() {
                      input1.text = "";
                      input2.text = "";
                    });
                    Navigator.of(context).pop();
                  },
                  textEditingController1: input1,
                  textEditingController2: input2,
                  // input1FocusNode: input1FocusNode!,
                  // input2FocusNode: input2FocusNode!,
                );
              });
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: FutureBuilder(
        // future: dbManager.getModelList(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // modelList = snapshot.data;
            return ListView.builder(
              itemCount: modelList!.length,
              itemBuilder: (context, index) {
                Model model = modelList![index];
                return ItemCard(
                  model: model,
                  input1: input1,
                  input2: input2,
                  onDeletePress: () {
                    // dbManager.deleteModel(model);
                    setState(() {});
                  },
                  onEditPress: () {
                    input1.text = model.fruitName;
                    input2.text = model.quantity;
                    showDialog(
                      context: context,
                      builder: (context) {
                        return DialogBox().dialog(
                          context: context,
                          onPressed: () {
                            Model model1 = Model(
                                id: model.id,
                                fruitName: input1.text,
                                quantity: input2.text);
                            // dbManager.updateModel(model1);

                            setState(() {
                              input1.text = "";
                              input2.text = "";
                            });
                            Navigator.of(context).pop();
                          },
                          textEditingController2: input2,
                          textEditingController1: input1,
                        );
                      },
                    );
                  },
                );
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
