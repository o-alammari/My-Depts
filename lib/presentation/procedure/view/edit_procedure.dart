import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testing_2/constant.dart';
import 'package:testing_2/app/function/custom_snack_bar.dart';
import 'package:testing_2/model/model_procedures.dart';
import 'package:testing_2/presentation/procedure/view-model/bloc_procedure/procedure_bloc.dart';
import 'package:testing_2/services/procedures_service.dart';
import 'package:testing_2/app/widgets/custom_button.dart';

import '../../../theme.dart';
import '../../../app/widgets/custom_text_field.dart';

class EditProcedure extends StatelessWidget {
  EditProcedure({super.key});

  late TextEditingController input1 = TextEditingController();

  late TextEditingController input2 = TextEditingController();
  
  // late ModelProcedures model;
  @override
  Widget build(BuildContext context) {
    ModelProcedures model =
        ModalRoute.of(context)!.settings.arguments as ModelProcedures;
    input1 = TextEditingController(text: model.nameProcedures);
    input2 = TextEditingController(
        text: model.credit == 0
            ? model.debit.toString()
            : model.debit == 0
                ? model.credit.toString()
                : model.debit.toString());
    print(model.credit == '0' ? '0' : input2.text);
    print(model.debit == '0' ? '0' : input2.text);
    return BlocListener<ProcedureBloc, ProcedureState>(
      listener: (context, state) {
        if (state.status.isSuccess) {
          input1.text = input2.text = '';
          customSnackBar(context, 'The modifications Procedure has been saved');
          context
              .read<ProcedureBloc>()
              .add(AllProceduresEvent(customerId: model.idCustomer));
          Navigator.pushReplacementNamed(context, Name.iDAllProcedures);
        } else if (state.status.isError) {
          customSnackBar(context,
              'An error occurred saving the modifications to Procedure');
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
              CustomTextField(
                title: 'Name Procedure',
                hint: 'Enter Procedure',
                onChange: (value) => context
                    .read<ProcedureBloc>()
                    .add(ProcedureNameChangedEvent(procedureName: value)),
                controller: input1,
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
                  textColor: Colors.white,
                  backgroundColor: Themes.fontColor,
                  fontSize: 18,
                  onPressed: () => context.read<ProcedureBloc>().add(
                        UpdateProcedureEvent(
                          updateProcedure: ModelProcedures(
                            idProcedures: model.idProcedures!,
                            idCustomer: model.idCustomer,
                            nameProcedures: input1.text,
                            dateProcedures: DateTime.now().toString(),
                            credit:
                                model.credit == 0 ? 0 : int.parse(input2.text),
                            debit:
                                model.debit == 0 ? 0 : int.parse(input2.text),
                          ),
                        ),
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
