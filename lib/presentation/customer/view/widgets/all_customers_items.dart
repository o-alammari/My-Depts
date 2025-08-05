import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_debts/app/utils/constant.dart';
import 'package:my_debts/model/model_customer.dart';
import 'package:my_debts/presentation/customer/view-model/bloc/customer_bloc.dart';
import 'package:my_debts/presentation/procedure/view-model/bloc_procedure/procedure_bloc.dart';
import 'package:my_debts/services/customers_service.dart';
import 'package:my_debts/app/utils/theme.dart';

class AllCustomersItems extends StatelessWidget {
  ModelCustomer? modelCustomer;

  AllCustomersItems({required this.modelCustomer, super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          tileColor: Colors.white,
          leading: const Icon(
            Icons.person,
            size: 25,
            color: primaryClr,
          ),
          title: Text(
            modelCustomer!.nameCustomer,
            style: const TextStyle(fontSize: 17, color: Themes.fontColor),
          ),
          subtitle: Text(
            'Credit: ${modelCustomer!.creditCustomer} ${modelCustomer!.idCustomer}',
            style: const TextStyle(fontSize: 12),
          ),
          onTap: () => showBottomSheet(context),
        ),
        Divider(
          height: 0,
          thickness: 1.5,
          indent: MediaQuery.of(context).size.width * .15,
          endIndent: 10,
        ),
      ],
    );
  }

  void showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Themes.backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.5,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            color: Colors.grey[300],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 5, right: 5, top: 10),
                child: ListTile(
                  leading: Text(
                    modelCustomer!.nameCustomer,
                    style: titleBottomSheetStyle,
                  ),
                  trailing: CircleAvatar(
                    backgroundColor: const Color.fromARGB(255, 215, 208, 208),
                    child: IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: const Icon(
                          Icons.close_rounded,
                          color: Colors.grey,
                        )),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    ListTile(
                      title: const Text('All Procedures'),
                      trailing: const Icon(
                        Icons.info_outline,
                        color: Colors.blue,
                      ),
                      onTap: () {
                        context.read<ProcedureBloc>().add(AllProceduresEvent(
                            customerId: modelCustomer!.idCustomer!));

                        Navigator.of(context).pop();
                        Navigator.pushNamed(context, Name.iDAllProcedures,
                            arguments: modelCustomer!.idCustomer);
                      },
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20, top: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    ListTile(
                      title: const Text('Edit Customer'),
                      trailing: const Icon(
                        Icons.edit_sharp,
                        color: Colors.black,
                      ),
                      onTap: () {
                        Navigator.of(context).pop();
                        Navigator.of(context).pushNamed(Name.iDEditCustomer,
                            arguments: modelCustomer);
                      },
                    ),
                    const Divider(),
                    ListTile(
                      title: const Text(
                        'Delete Customer',
                        style: TextStyle(color: Colors.red),
                      ),
                      trailing: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      onTap: () {
                        Navigator.of(context).pop();
                        showBottomSheetDelete(context);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void showBottomSheetDelete(BuildContext context) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      backgroundColor: Themes.backgroundColor,
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.25,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            color: Colors.grey[300],
          ),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 5, right: 5, top: 10),
                child: ListTile(
                  title: Text('Delete Name...?', style: titleBottomSheetStyle),
                  trailing: CircleAvatar(
                    backgroundColor: const Color.fromARGB(255, 215, 208, 208),
                    child: IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: const Icon(
                          Icons.close_rounded,
                          color: Colors.grey,
                        )),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 20, left: 20, top: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    ListTile(
                      title: const Text(
                        'Delete Customer',
                        style: TextStyle(color: Colors.red),
                      ),
                      trailing: const Icon(Icons.delete, color: Colors.red),
                      onTap: () {
                        context.read<CustomerBloc>().add(DeleteCustomerEvent(
                            idCustomer: modelCustomer!.idCustomer!));
                        context
                            .read<CustomerBloc>()
                            .add(const AllCustomersEvent());
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  deleteCustomer() async {
    CustomerService customerService = CustomerService();
    await customerService.deleteCustomer(modelCustomer!.idCustomer);
  }
}
