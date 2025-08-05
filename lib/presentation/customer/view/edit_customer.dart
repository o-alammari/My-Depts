import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_debts/app/utils/constant.dart';
import 'package:my_debts/app/function/app_status.dart';
import 'package:my_debts/app/function/custom_snack_bar.dart';
import 'package:my_debts/model/model_customer.dart';
import 'package:my_debts/presentation/customer/view-model/bloc/customer_bloc.dart';
import 'package:my_debts/app/utils/theme.dart';

import '../../../app/widgets/custom_button.dart';
import '../../../app/widgets/custom_text_field.dart';

class EditCustomer extends StatefulWidget {
  const EditCustomer({super.key});

  @override
  State<EditCustomer> createState() => _EditCustomerState();
}

class _EditCustomerState extends State<EditCustomer> {
  // var input1=
  TextEditingController input1 = TextEditingController();
  TextEditingController input2 = TextEditingController();
  TextEditingController input3 = TextEditingController();

  late ModelCustomer model;

  @override
  Widget build(BuildContext context) {
    model = ModalRoute.of(context)!.settings.arguments as ModelCustomer;
    input1 = TextEditingController(text: model.nameCustomer);
    input2 = TextEditingController(text: model.phoneCustomer);
    input3 = TextEditingController(text: model.creditCustomer);
    return BlocListener<CustomerBloc, CustomerState>(
        listener: (context, state) {
          if (state.status.isSuccess) {
            input1.text = input2.text = input3.text = '';
            customSnackBar(
                context, 'The modifications Customer has been saved');
            context.read<CustomerBloc>().add(const AllCustomersEvent());
            Navigator.pushReplacementNamed(context, Name.iDAllCustomer);
          } else if (state.status.isError) {
            customSnackBar(context,
                'An error occurred saving the modifications to Customer');
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
            title: Text('Edit Customer', style: titleAppBarStyle),
            elevation: 0,
            backgroundColor: primaryClr,
          ),
          body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                CustomTextField(
                  title: 'Name Customer',
                  onChange: (value) => context
                      .read<CustomerBloc>()
                      .add(CustomerNameChangedEvent(customerName: value)),
                  controller: input1,
                ),
                const SizedBox(height: 8),
                CustomTextField(
                  title: 'Phone Customer',
                  onChange: (value) => context
                      .read<CustomerBloc>()
                      .add(CustomerPhoneChangedEvent(customerPhone: value)),
                  controller: input2,
                ),
                const SizedBox(height: 8),
                CustomTextField(
                  title: 'Credit',
                  onChange: (value) => context
                      .read<CustomerBloc>()
                      .add(CustomerCreditChangedEvent(customerCredit: value)),
                  textInputType: TextInputType.number,
                  controller: input3,
                ),
                const SizedBox(height: 20),
                Center(
                  child: CustomButton(
                    text: 'Save',
                    textColor: Colors.white,
                    backgroundColor: Themes.backgroundColorButton,
                    fontSize: 18,
                    onPressed: () => context.read<CustomerBloc>().add(
                          UpdateCustomerEvent(
                            updateCustomer: ModelCustomer(
                              idCustomer: model.idCustomer,
                              nameCustomer: input1.text,
                              phoneCustomer: input2.text,
                              creditCustomer: input3.text,
                            ),
                          ),
                        ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
