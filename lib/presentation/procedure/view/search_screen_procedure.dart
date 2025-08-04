import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testing_2/app/function/custom_snack_bar.dart';
import 'package:testing_2/presentation/procedure/view-model/bloc_procedure/procedure_bloc.dart';
import 'package:testing_2/theme.dart';
import './widgets/all_procedures_items.dart';

class SearchScreenProcedure extends StatelessWidget {
  const SearchScreenProcedure({super.key});
  // final searchFieldKey = GlobalKey<FormFieldState>();
  // WidgetsBinding.instance?.addPostFrameCallback((_) {
  //   searchFieldKey.currentState?.requestFocus();
  // });
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
                      top: 11, left: 0, right: 5, bottom: 6),
                  // height: 30,
                  width: 290,
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
                          // key: searchFieldKey,
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
                    style: TextStyle(fontSize: 18, color: primaryClr),
                  ),
                ),
              ],
              // leading: ,
              backgroundColor:
                  const Color.fromARGB(255, 234, 237, 234), // لون خلفية العنوان
              expandedHeight: 60, // ارتفاع العنوان عندما يتم توسيعه
              pinned:
                  true, // يتم تثبيت العنوان في الجزء العلوي عند التمرير للأسفل
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                // const SizedBox(height: 20),
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
