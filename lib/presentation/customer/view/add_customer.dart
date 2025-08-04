import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testing_2/app/function/app_status.dart';
import 'package:testing_2/model/model_customer.dart';
import 'package:testing_2/presentation/customer/view-model/bloc/customer_bloc.dart';

import '../../../theme.dart';
import 'package:testing_2/app/widgets/custom_button.dart';
import 'package:testing_2/app/function/custom_snack_bar.dart';
import '../../../app/widgets/custom_text_field.dart';

class AddCustomerView extends StatelessWidget {
  AddCustomerView({super.key});

  TextEditingController input1 = TextEditingController();

  TextEditingController input2 = TextEditingController();

  TextEditingController input3 = TextEditingController();

  // late ModelCustomer modelCustomer;

  // Future<int> addCustomer() async {
  //   // ModelCustomer modelCustomer = ModelCustomer(
  //   modelCustomer = ModelCustomer(
  //     // idCustomer: 0,
  //     nameCustomer: input1.text,
  //     phoneCustomer: input2.text,
  //     creditCustomer: input3.text,
  //   );
  //   var c1 = CustomerService();
  //   return (await c1.saveCustomer(modelCustomer)) as int;
  // }

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    // final customerBloc = BlocProvider.of<CustomerBloc>(context);
    // final stateB = customerBloc.state;
    // final stateB = BlocProvider.of<CustomerBloc>(context).state;
    return BlocListener<CustomerBloc, CustomerState>(
      listener: (context, state) {
        // if (state is LoadingState) {
        // if (state.status.isLoading) {
        //   customSnackBar(context, 'Loading...');
        //   // } else if (state is SuccessState) {
        // }
        if (state.status.isSuccess) {
          input1.text = input2.text = input3.text = '';
          customSnackBar(context, 'Success ');
          context.read<CustomerBloc>().add(const AllCustomersEvent());
          // } else if (state is ErrorState) {
        } else if (state.status.isError) {
          // customSnackBar(context, 'Type Error ${state.errorMessage}');
          customSnackBar(
              context, 'Type Error => on save Failure Please Enter Value');
        }
      },
      child: Scaffold(
        // backgroundColor: Colors.grey[200],
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
          title: Text('Add Customer', style: titleAppBarStyle),
          elevation: 0,
          // backgroundColor: const Color.fromARGB(255, 233, 112, 13),
          // backgroundColor: const Color.fromRGBO(243, 125, 29, 1),
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
                    // customerBloc
                    //     .add(CustomerNameChangedEvent(customerName: value));
                  },
                  controller: input1,
                  // errorText1: (stateB is ErrorState) ? 'Invalid Name' : null,
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
                  // errorText1: (stateB is ErrorState) ? 'Invalid Phone' : null,
                ),
                const SizedBox(height: 8),
                CustomTextField(
                  title: 'Credit',
                  hint: '0',
                  onChange: (value) {
                    context
                        .read<CustomerBloc>()
                        .add(CustomerCreditChangedEvent(customerCredit: value));
                    // customerBloc
                    //   .add(CustomerCreditChangedEvent(customerCredit: value));
                  },
                  textInputType: TextInputType.number,
                  controller: input3,
                  // errorText1:
                  //     (stateB.creditCustomer == null) ? 'Invalid Credit' : null,
                ),
                const SizedBox(height: 20),
                // StreamBuilder<bool>(
                //   stream: customerBloc.isValidName,
                //   builder: (context, snapshot) {
                //     return TextFormField(
                //       keyboardType: TextInputType.visiblePassword,
                //       controller: _userPasswordController,
                //       decoration: InputDecoration(
                //         hintText: AppStrings.password.tr(),
                //         labelText: AppStrings.password.tr(),
                //         errorText: (snapshot.data ?? true)
                //             ? null
                //             : AppStrings.passwordError.tr(),
                //       ),
                //     );
                //   },
                // ),

                Center(
                  child: CustomButton(
                    text: 'Save',
                    // backgroundColor: const Color.fromARGB(255, 27, 65, 146),
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
