import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_debts/app/function/custom_snack_bar.dart';
import 'package:my_debts/app/utils/theme.dart';
import 'package:my_debts/presentation/procedure/view-model/bloc_procedure/procedure_bloc.dart';

import './widgets/all_procedures_items.dart';

class SearchScreenProcedure extends StatelessWidget {
  const SearchScreenProcedure({super.key});

  @override
  Widget build(BuildContext context) {
    final idCustomer = ModalRoute.of(context)!.settings.arguments as int;
    return BlocConsumer<ProcedureBloc, ProcedureState>(
      listener: (context, state) {
        if (state.status.isLoaded) {
        } else if (state.status.isError) {
          customSnackBar(context, 'Type Error => isError Not Procedures');
        }
      },
      builder: (context, state) => Scaffold(
        backgroundColor: Colors.grey[300],
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              automaticallyImplyLeading: false,
              actions: [
                Container(
                  margin: const EdgeInsets.only(
                      top: 11, left: 10, right: 0, bottom: 6),
                  height: 40,
                  width: 280,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color.fromARGB(255, 215, 208, 208),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(width: 8),
                      const Icon(Icons.search, color: Colors.grey),
                      const SizedBox(width: 8),
                      Expanded(
                        child: TextField(
                          decoration: const InputDecoration.collapsed(
                            hintText: 'Search',
                          ),
                          onChanged: (value) =>
                              context.read<ProcedureBloc>().add(
                                    ProcedureSearchChangedEvent(
                                      procedureSearch: value,
                                    ),
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {
                    context
                        .read<ProcedureBloc>()
                        .add(AllProceduresEvent(customerId: idCustomer));
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'Cancel',
                    style: TextStyle(fontSize: 12, color: primaryClr),
                  ),
                ),
              ],
              backgroundColor: const Color.fromARGB(255, 234, 237, 234),
              expandedHeight: 60,
              pinned: true,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return AllProceduresItems(
                    modelProcedure: context
                        .read<ProcedureBloc>()
                        .state
                        .searchProcedure[index],
                  );
                },
                childCount:
                    context.read<ProcedureBloc>().state.searchProcedure.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
