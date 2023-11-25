// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:testing_2/all_procedures_items.dart';
import 'package:testing_2/constant.dart';
import 'package:testing_2/model/model_customer.dart';
import 'package:testing_2/model/model_procedures.dart';
import 'package:testing_2/services/customers_service.dart';
import 'package:testing_2/services/procedures_service.dart';
import 'package:testing_2/theme.dart';

class AllProcedures extends StatefulWidget {
  // final ModelProcedures mm;

  const AllProcedures({
    Key? key,
    // required this.mm,
  }) : super(key: key);

  @override
  State<AllProcedures> createState() => _AllProceduresState();
}

class _AllProceduresState extends State<AllProcedures> {
  // ModelProcedures? model;
//   List<ModelProcedures>? proceduresList = [
//     ModelProcedures(
//       idProcedures: 1,
//       nameProcedures: 'break1',
//       // nameCustomer: 'omar',
//       idCustomer: 1,
//       dateProcedures: '2023/11/15',
//       credit: '150',
//       debit: '0',
//     ),
//     ModelProcedures(
//       idProcedures: 2,
//       nameProcedures: 'break2',
//       // nameCustomer: 'omar',
//       idCustomer: 1,
//       dateProcedures: '2023/11/15',
//       credit: '150',
//       debit: '0',
//     ),
//     ModelProcedures(
//       idProcedures: 3,
//       nameProcedures: 'break3',
// // nameCustomer: 'omar',
//       idCustomer: 1, dateProcedures: '2023/11/15',
//       credit: '150',
//       debit: '0',
//     ),
//     ModelProcedures(
//       idProcedures: 4,
//       nameProcedures: 'break4',
// // nameCustomer: 'omar',
//       idCustomer: 1, dateProcedures: '2023/11/15',
//       credit: '150',
//       debit: '0',
//     ),
//     ModelProcedures(
//       idProcedures: 5,
//       nameProcedures: 'break5',
// // nameCustomer: 'omar',
//       idCustomer: 1, dateProcedures: '2023/11/15',
//       credit: '150',
//       debit: '0',
//     ),
//     ModelProcedures(
//       idProcedures: 6,
//       nameProcedures: 'break6',
// // nameCustomer: 'omar',
//       idCustomer: 1, dateProcedures: '2023/11/15',
//       credit: '150',
//       debit: '0',
//     ),
//     ModelProcedures(
//       idProcedures: 7,
//       nameProcedures: 'break7',
// // nameCustomer: 'omar',
//       idCustomer: 1, dateProcedures: '2023/11/15',
//       credit: '150',
//       debit: '0',
//     ),
//     ModelProcedures(
//       idProcedures: 8,
//       nameProcedures: 'break8',
// // nameCustomer: 'omar',
//       idCustomer: 1, dateProcedures: '2023/11/15',
//       credit: '150',
//       debit: '0',
//     ),
//   ];
  TextEditingController input1 = TextEditingController();

  TextEditingController input2 = TextEditingController();
  FocusNode? input1FocusNode;
  FocusNode? input2FocusNode;

  late List<ModelProcedures> proceduresList = <ModelProcedures>[];
  late List<ModelProcedures> modelList = <ModelProcedures>[];
  Future<void> readDataAllProcedures(int idCustomer) async {
    var list = await ProceduresServices().readAllProcedures();
    list.forEach(
      (json) {
        // ModelProcedures.fromJson(json);
        var model = ModelProcedures.fromJson(json);
         ModelProcedures(
          idProcedures: json['id'],
          nameProcedures: json['nameProcedures'],
          idCustomer: json['idCustomer'],
          dateProcedures: json['dateProcedures'] ?? '',
          credit: json['credit'],
          debit: json['debit'],
        );
        modelList.add(model);
        setState(() {});
      },
    );
    proceduresList = modelList
        .where((procedure) => procedure.idCustomer == idCustomer)
        .toList();
    // for (var procedure in modelList) {
    //   if (procedure.idCustomer == idCustomer) {
    //     proceduresList.add(procedure);
    //     setState(() {});
    //   }
    // }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // Provider.of<Contests>(context).fetchAndSetContests();
      ModelCustomer modelCustomer =
          ModalRoute.of(context)!.settings.arguments as ModelCustomer;
      readDataAllProcedures(modelCustomer.idCustomer!);
    });
  }

  @override
  Widget build(BuildContext context) {
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

            // backgroundColor: const Color.fromARGB(255, 233, 112, 13),
            // backgroundColor: const Color.fromARGB(255, 227, 231, 227),
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
                onPressed: () =>
                    Navigator.of(context).pushNamed(Name.iDAddProcedure),
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
                        onTap: () => Navigator.pushNamed(
                            context, Name.iDSearchScreenProcedure),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverFillRemaining(
            child: Container(
              // decoration: BoxDecoration(
              //   borderRadius: BorderRadius.circular(0),
              //   color: Colors.white,
              // ),
              width: double.infinity,
              margin: const EdgeInsets.only(top: 0, left: 16, right: 16),
              child: proceduresList.isEmpty
                  ? const Center(child: Text('No Procedures'))
                  : ListView.builder(
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      // elevation: 5,
                      itemCount: proceduresList.length,
                      itemBuilder: (context, index) {
                        // ModelProcedures modelProcedure = proceduresList![index];
                        return AllProceduresItems(
                          // modelProcedure: modelList[index],
                          // input1: input1,
                          // input2: input2,
                          modelProcedure: proceduresList[index],
                          onDeletePress: () {},
                          onEditPress: () {},
                        );
                      },
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
