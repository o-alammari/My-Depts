import 'package:flutter/material.dart';
import 'package:testing_2/function/custom_snack_bar.dart';
import 'package:testing_2/model/model_procedures.dart';
import 'package:testing_2/services/procedures_service.dart';
import 'package:testing_2/widgets/custom_button.dart';

import './theme.dart';
import 'widgets/input_field.dart';

class EditProcedure extends StatefulWidget {
  const EditProcedure({super.key});

  @override
  State<EditProcedure> createState() => _EditProcedureState();
}

class _EditProcedureState extends State<EditProcedure> {
  late ModelProcedures model;
  late TextEditingController input1 = TextEditingController();
  late TextEditingController input2 = TextEditingController();
  // TextEditingController input3 = TextEditingController();

  Future<int> editProcedures() async {
    ModelProcedures modelProcedures = ModelProcedures(
      idProcedures: model.idProcedures,
      nameProcedures: input1.text,
      idCustomer: model.idCustomer,
      dateProcedures: model.dateProcedures,
      // credit: model.credit,
      credit: input2.text,
      debit: '0',
      // debit: model.debit,
    );
    return (await ProceduresServices().updateProcedures(modelProcedures))
        as int;
  }

  @override
  Widget build(BuildContext context) {
    // final List<TextEditingController> myControllers = ModalRoute.of(context)!
    model = ModalRoute.of(context)!.settings.arguments as ModelProcedures;
    input1 = TextEditingController(text: model.nameProcedures);
    input2 = TextEditingController(text: model.credit);
    return Scaffold(
      backgroundColor: Themes.backgroundColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 24,
            color: Colors.white,
          ),
        ),
        title: Text('Edit Procedure', style: titleAppBarStyle),
        elevation: 0.1,
        backgroundColor: primaryClr,
        // backgroundColor: const Color.fromARGB(255, 233, 112, 13),
        // backgroundColor: const Color(0xFFEFEBEB).withOpacity(.2),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InputField1(
              title: 'Name Procedure',
              hint: 'Enter Procedure',
              onChange: (p0) {},
              // controller: TextEditingController(text: model.nameProcedures),
              controller: input1,
            ),
            const SizedBox(height: 8),
            InputField1(
              title: 'Amount Procedure',
              hint: 'Enter Amount',
              // controller: TextEditingController(text: model.credit),
              controller: input2,
              onChange: (p0) {},
            ),
            const SizedBox(height: 20),
            Center(
              child: CustomButton(
                text: 'Save',
                textColor: Colors.white,
                backgroundColor: Themes.fontColor,
                fontSize: 18,
                onPressed: () async {
                  var result = await editProcedures();
                  customSnackBar(
                      context, 'Edit to Procedure Success ${result}');
                      
                  setState(() {});
                },
              ),
            ),
            // const SizedBox(height: 15),
            // Text('title', style: titleStyle),
            // const SizedBox(height: 12),
            // Padding(
            //   padding: const EdgeInsets.only(left: 16, right: 16),
            //   child: Container(
            //     height: 100,
            //     decoration: BoxDecoration(
            //       boxShadow: [
            //         BoxShadow(
            //           blurRadius: 40,
            //           color: Colors.grey.withOpacity(.6),
            //           spreadRadius: 0,
            //           offset: const Offset(10, 10),
            //         ),
            //       ],
            //       // color: Colors.grey,
            //       // color: Color.fromARGB(255, 227, 231, 227),
            //       color: const Color.fromARGB(255, 227, 231, 227),
            //       borderRadius: BorderRadius.circular(12),
            //     ),
            //     child: ListView.builder(
            //       itemCount: nameCustomer.length,
            //       itemBuilder: (context, index) => Column(
            //         children: [
            //           ListTile(
            //             title: Text(
            //               nameCustomer[index],
            //             ),
            //           ),
            //           const Divider()
            //         ],
            //       ),
            //     ),
            //   ),
            // ),

            // const SizedBox(height: 12),
            // MyButton(
            //   lable: 'Save',
            //   onTap: () {},
            // ),
          ],
        ),
      ),
    );
  }
}
