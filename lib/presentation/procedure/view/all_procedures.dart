// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testing_2/presentation/procedure/view-model/bloc_procedure/procedure_bloc.dart';

import 'package:testing_2/presentation/procedure/view/widgets/all_procedures_items.dart';
import 'package:testing_2/constant.dart';
import 'package:testing_2/theme.dart';
import 'package:testing_2/app/function/bottom_sheet.dart';

class AllProcedures extends StatelessWidget {
  const AllProcedures({
    Key? key,
  }) : super(key: key);
  // FocusNode? input1FocusNode;

  // WidgetsBinding.instance.addPostFrameCallback((_) async {
  @override
  Widget build(BuildContext context) {
    final idCustomer = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
      // backgroundColor: Themes.backgroundColor,
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back_ios,
                size: 24,
                color: Colors.white,
              ),
            ),
            backgroundColor: primaryClr,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: const EdgeInsets.only(left: 85, bottom: 16),
              title: Text(
                'All Procedures',
                style: titleAppBarStyle,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () => showBottomSheetSelect(
                  context: context,
                  title: 'Select Type',
                  subTitle1: 'Credit',
                  subTitle2: 'Debit',
                  function1: () {
                    Navigator.of(context).pop();
                    Navigator.of(context)
                        .pushNamed(Name.iDAddProcedure, arguments: 'Credit');
                  },
                  function2: () {
                    Navigator.of(context).pop();
                    Navigator.of(context)
                        .pushNamed(Name.iDAddProcedure, arguments: 'Debit');
                  },
                  iconData1: Icons.arrow_downward_sharp,
                  iconData2: Icons.arrow_upward_sharp,
                ),
                icon: const Icon(Icons.add),
              )
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 16, left: 16, right: 16, bottom: 16),
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey[300],
                  // color: Colors.grey[300],
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
                        onTap: () {
                          context.read<ProcedureBloc>().add(
                              const ProcedureSearchChangedEvent(
                                  procedureSearch: ''));
                          Navigator.pushNamed(
                              context, Name.iDSearchScreenProcedure,
                              arguments: idCustomer);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverFillRemaining(
            child: BlocBuilder<ProcedureBloc, ProcedureState>(
              builder: (context, state) {
                if (state.status.isLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state.status.isLoaded) {
                  return Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(top: 0, left: 16, right: 16),
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      // elevation: 5,
                      // itemCount: proceduresList.length,
                      itemCount: state.allProcedure.length,
                      itemBuilder: (context, index) {
                        // ModelProcedures modelProcedure = proceduresList![index];
                        return AllProceduresItems(
                          modelProcedure: state.allProcedure[index],
                        );
                      },
                    ),
                  );
                } else if (state.status.isError) {
                  return Container(
                    child: const Center(
                      child: Text(
                        'Not Procedures',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  );
                } else {
                  return const Center(
                    child: Text(
                      'Not Procedures',
                      style: TextStyle(color: Colors.black),
                    ),
                  );
                  // return Container();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
