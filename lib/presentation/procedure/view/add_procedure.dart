import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testing_2/app/function/custom_snack_bar.dart';
import 'package:testing_2/model/model_customer.dart';
import 'package:testing_2/model/model_procedures.dart';
import 'package:testing_2/presentation/customer/view-model/bloc/customer_bloc.dart';
import 'package:testing_2/presentation/procedure/view-model/bloc_procedure/procedure_bloc.dart';
import 'package:testing_2/services/customers_service.dart';
import 'package:testing_2/services/procedures_service.dart';
import 'package:testing_2/app/widgets/custom_button.dart';
import 'package:testing_2/app/widgets/select_box.dart';
import 'package:flutter_sms/flutter_sms.dart';
import '../../../theme.dart';
import '../../../app/widgets/custom_text_field.dart';

class AddProcedure extends StatefulWidget {
  const AddProcedure({super.key});

  @override
  State<AddProcedure> createState() => _AddProcedureState();
}

class _AddProcedureState extends State<AddProcedure> {
  TextEditingController input1 = TextEditingController();
  TextEditingController input2 = TextEditingController();
  late int idCustomer;
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    context.read<CustomerBloc>().add(const AllCustomersEvent());
  }

  @override
  Widget build(BuildContext context) {
    var type = ModalRoute.of(context)!.settings.arguments as String;
    return BlocListener<ProcedureBloc, ProcedureState>(
      listener: (context, state) {
        if (state.status.isSuccess) {
          input1.text = input2.text = '';
          customSnackBar(context, 'Success ');
          context
              .read<ProcedureBloc>()
              .add(AllProceduresEvent(customerId: idCustomer));
        } else if (state.status.isError) {
          // customSnackBar(context, 'Type Error ${state.errorMessage}');
          customSnackBar(
              context, 'Type Error => on save Failure Please Enter Value');
        }
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
                  onResult: (result) {
                    idCustomer = context
                        .read<CustomerBloc>()
                        .state
                        .allCustomer
                        .firstWhere((element) => element.nameCustomer == result)
                        .idCustomer!;
                    print(idCustomer);
                  },
                ),
                const SizedBox(height: 5),
                CustomTextField(
                  title: 'Name Procedure',
                  hint: 'Enter Procedure',
                  controller: input1,
                  onChange: (value) => context
                      .read<ProcedureBloc>()
                      .add(ProcedureNameChangedEvent(procedureName: value)),
                ),
                const SizedBox(height: 8),
                CustomTextField(
                  title: 'Amount Procedure',
                  hint: 'Enter Amount',
                  controller: input2,
                  onChange: (value) => context
                      .read<ProcedureBloc>()
                      .add(ProcedureAmountChangedEvent(procedureAmount: value)),
                ),
                const SizedBox(height: 20),
                Center(
                  child: CustomButton(
                    text: 'Save',
                    backgroundColor: const Color.fromARGB(255, 27, 65, 146),
                    textColor: Colors.white,
                    fontSize: 18,
                    onPressed: () async {
                      String message = "This is a test message!";
                      List<String> recipents = [
                        "00967713713392",
                        "+967713713392"
                      ];

                      String result = await sendSMS(
                              message: message,   
                              recipients: recipents,
                              sendDirect: true)
                          .catchError((onError) {
                        print(onError);
                      });
                      print(result);


  //  SmsSender sender = SmsSender();
    String address = "1234567";

    // SmsMessage message = SmsMessage(address, 'Hello flutter!');
    // message.onStateChanged.listen((state) {
    //   if (state == SmsMessageState.Sent) {
    //     print("SMS is sent!");
    //     setState(() {
    //       _message = "SMS is sent";
    //     });
    //   } else if (state == SmsMessageState.Delivered) {
    //     print("SMS is delivered!");
    //     setState(() {
    //       _message = "SMS is delivered!";
    //     });
    //   }
    // });
    // sender.sendSms(message);
                      // var re = await ProceduresServices()
                      //     .readAllProceduresCustomerSum(1);
                      // print(re);
                      // context.read<ProcedureBloc>().add(
                      //       AddProcedureEvent(
                      //         addProcedure: ModelProcedures(
                      //           idCustomer: idCustomer,
                      //           nameProcedures: input1.text,
                      //           dateProcedures: DateTime.now().toString(),
                      //           credit: type == 'Credit'
                      //               ? int.parse(input2.text)
                      //               : 0,
                      //           debit: type == 'Debit'
                      //               ? int.parse(input2.text)
                      //               : 0,
                      //         ),
                      //       ),
                      //     );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
