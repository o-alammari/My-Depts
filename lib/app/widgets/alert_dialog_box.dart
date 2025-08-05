import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_debts/app/function/app_status.dart';
import 'package:my_debts/app/function/custom_snack_bar.dart';

import 'package:my_debts/presentation/customer/view-model/bloc/customer_bloc.dart';
import 'package:my_debts/app/utils/theme.dart';

class DialogBox extends StatelessWidget {
  const DialogBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CustomerBloc, CustomerState>(
      listener: (context, state) {
        if (state.status.isError) {
          customSnackBar(context, 'Type Error => sError Not Customer');
        }
      },
      builder: (context, state) {
        return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.9,
              child: SingleChildScrollView(
                child: state.status.isLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : state.status.isLoaded
                        ? Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 16, left: 16, right: 16, bottom: 16),
                                child: Container(
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.grey[400],
                                  ),
                                  child: Row(
                                    children: [
                                      const SizedBox(width: 8),
                                      const Icon(Icons.search,
                                          color: Colors.grey),
                                      const SizedBox(width: 8),
                                      Expanded(
                                        child: TextField(
                                          decoration:
                                              const InputDecoration.collapsed(
                                            hintText: 'Search',
                                          ),
                                          onChanged: (value) =>
                                              context.read<CustomerBloc>().add(
                                                    CustomerSearchChangedEvent(
                                                      customerSearch: value,
                                                    ),
                                                  ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: context
                                    .read<CustomerBloc>()
                                    .state
                                    .searchCustomer
                                    .length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Column(
                                    children: [
                                      ListTile(
                                        leading: const Icon(Icons.person),
                                        title: Text(
                                          context
                                              .read<CustomerBloc>()
                                              .state
                                              .searchCustomer[index]
                                              .nameCustomer,
                                          style: titleStyle,
                                        ),
                                        onTap: () {
                                          Navigator.pop(
                                              context,
                                              context
                                                  .read<CustomerBloc>()
                                                  .state
                                                  .searchCustomer[index]
                                                  .nameCustomer);
                                        },
                                      ),
                                      const Divider(
                                        height: 5,
                                        thickness: 1,
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ],
                          )
                        : Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 16, left: 16, right: 16, bottom: 16),
                                child: Container(
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.grey[400],
                                  ),
                                  child: Row(
                                    children: [
                                      const SizedBox(width: 8),
                                      const Icon(Icons.search,
                                          color: Colors.grey),
                                      const SizedBox(width: 8),
                                      Expanded(
                                        child: TextField(
                                          decoration:
                                              const InputDecoration.collapsed(
                                            hintText: 'Search',
                                          ),
                                          onChanged: (value) => context
                                              .read<CustomerBloc>()
                                              .add(CustomerSearchChangedEvent(
                                                customerSearch: value,
                                              )),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
              ),
            ));
      },
    );
  }
}
