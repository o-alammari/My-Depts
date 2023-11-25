import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testing_2/function/custom_snack_bar.dart';
import 'package:testing_2/model/model_customer.dart';
import 'package:testing_2/model/model_procedures.dart';
import 'package:testing_2/presentation/procedure/view-model/bloc_procedure/procedure_bloc.dart';
import 'package:testing_2/services/customers_service.dart';
import 'package:testing_2/services/procedures_service.dart';
import 'package:testing_2/widgets/custom_button.dart';
import 'package:testing_2/widgets/select_box.dart';

import '../../../theme.dart';
import '../../../widgets/input_field.dart';

class AddProcedure extends StatefulWidget {
  const AddProcedure({super.key});

  @override
  State<AddProcedure> createState() => _AddProcedureState();
}

class _AddProcedureState extends State<AddProcedure> {
  late List<ModelCustomer> nameCustomer = <ModelCustomer>[];
  TextEditingController input1 = TextEditingController();
  TextEditingController input2 = TextEditingController();
  late int idCustomer;
  late String type;
  // bool isLoading = false;
  GlobalKey<FormState> formKey = GlobalKey();
  // int idCustomer
  Future<int> addProcedure() async {
    print(type);
    ModelProcedures modelProcedure = ModelProcedures(
      idCustomer: idCustomer,
      dateProcedures: DateTime.now().toString(),
      nameProcedures: input1.text,
      credit: type == 'Credit' ? input2.text : '0',
      debit: type == 'Debit' ? input2.text : '0',
    );
    return (await ProceduresServices().saveProcedures(modelProcedure)) as int;
  }

  Future<void> readDataAllCustomers() async {
    var list = await CustomerService().readAllCustomers();
    list.forEach(
      (json) {
        var model = ModelCustomer(
          idCustomer: json['id'],
          nameCustomer: json['nameCustomer'],
          phoneCustomer: json['phoneCustomer'],
          creditCustomer: json['creditCustomer'],
        );
        nameCustomer.add(model);
        setState(() {});
      },
    );
  }

  @override
  void initState() {
    super.initState();
    readDataAllCustomers();
  }

  // List<String> nameCustomer = ['omar', 'omar2'];
  @override
  Widget build(BuildContext context) {
    type = ModalRoute.of(context)!.settings.arguments as String;
    return BlocListener<ProcedureBloc, ProcedureState>(
      listener: (context, state) {
          if (state is LoadingState) {
            
          }
          else if (state is SuccessState) {
            
          }
          // else if()
        },
      
      child: Scaffold(
        backgroundColor: Themes.backgroundColor,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 24,
              // color: primaryClr,
              color: Colors.white,
            ),
          ),
          title: Text('Add Procedure', style: titleAppBarStyle),
          elevation: 0.1,
          // backgroundColor: const Color(0xFFEFEBEB).withOpacity(.2),
          // backgroundColor: const Color.fromARGB(255, 233, 112, 13),
          backgroundColor: primaryClr,
          // backgroundColor: primaryClr,
        ),
        body: Form(
          key: formKey,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 12),
                Text('Customer', style: titleStyle),
                SelectBox(
                  nameCustomer: nameCustomer,
                  onResult: (result) {
                    // print(result);
                    idCustomer = nameCustomer
                        .firstWhere((element) => element.nameCustomer == result)
                        .idCustomer!;
                    // print(idCustomer);
                  },
                ),
                const SizedBox(height: 5),
                InputField1(
                  title: 'Name Procedure',
                  hint: 'Enter Procedure',
                  onChange: (p0) {},
                  controller: input1,
                ),
                const SizedBox(height: 8),
                InputField1(
                  title: 'Amount Procedure',
                  hint: 'Enter Amount',
                  onChange: (p0) {},
                  controller: input2,
                ),
                const SizedBox(height: 20),
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

                // const SizedBox(height: 15),
                Center(
                  child: CustomButton(
                    text: 'Save',
                    backgroundColor: const Color.fromARGB(255, 27, 65, 146),
                    textColor: Colors.white,
                    fontSize: 18,
                    onPressed: () async {
                      var result = await addProcedure();
                      customSnackBar(
                          context, 'Add to Customer Success ${result}');
                    },
                  ),
                )
                // const SizedBox(height: 12),
                // MyButton(
                //   lable: 'Save',
                //   onTap: () {},
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
