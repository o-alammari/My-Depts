import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_debts/app/function/app_status.dart';
import 'package:my_debts/app/function/custom_snack_bar.dart';
import 'package:my_debts/app/utils/theme.dart';
import 'package:my_debts/app/widgets/custom_button.dart';
import 'package:my_debts/app/widgets/custom_text_field.dart';
import 'package:my_debts/model/model_customer.dart';
import 'package:my_debts/presentation/customer/view-model/bloc/customer_bloc.dart';

class AddCustomerView extends StatelessWidget {
  AddCustomerView({super.key});

  final TextEditingController input1 = TextEditingController();
  final TextEditingController input2 = TextEditingController();
  final TextEditingController input3 = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocListener<CustomerBloc, CustomerState>(
      listener: (context, state) {
        if (state.status.isSuccess) {
          input1.text = input2.text = input3.text = '';
          customSnackBar(context, 'Success ');
          context.read<CustomerBloc>().add(const AllCustomersEvent());
        } else if (state.status.isError) {
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
              color: Colors.white,
            ),
          ),
          title: Text('Add Customer', style: titleAppBarStyle),
          elevation: 0,
          backgroundColor: primaryClr,
        ),
        body: Form(
          key: formKey,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                CustomTextField(
                  title: 'Name Customer',
                  hint: 'Enter Name',
                  onChange: (value) {
                    context
                        .read<CustomerBloc>()
                        .add(CustomerNameChangedEvent(customerName: value));
                  },
                  controller: input1,
                ),
                const SizedBox(height: 8),
                CustomTextField(
                  title: 'Phone',
                  hint: '7_ _ _ _ _ _',
                  onChange: (value) => context
                      .read<CustomerBloc>()
                      .add(CustomerPhoneChangedEvent(customerPhone: value)),
                  controller: input2,
                  textInputType: TextInputType.number,
                ),
                const SizedBox(height: 8),
                CustomTextField(
                  title: 'Credit',
                  hint: '0',
                  onChange: (value) {
                    context
                        .read<CustomerBloc>()
                        .add(CustomerCreditChangedEvent(customerCredit: value));
                  },
                  textInputType: TextInputType.number,
                  controller: input3,
                ),
                const SizedBox(height: 20),
                Center(
                  child: CustomButton(
                    text: 'Save',
                    backgroundColor: Themes.backgroundColorButton,
                    textColor: Colors.white,
                    fontSize: 18,
                    onPressed: () => context.read<CustomerBloc>().add(
                          AddCustomerEvent(
                            addCustomer: ModelCustomer(
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
        ),
      ),
    );
  }
}
