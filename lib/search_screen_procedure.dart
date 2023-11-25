import 'package:flutter/material.dart';
import 'package:testing_2/model/model_procedures.dart';
import 'package:testing_2/theme.dart';
import 'all_procedures_items.dart';

class SearchScreenProcedure extends StatefulWidget {
  const SearchScreenProcedure({super.key});

  @override
  State<SearchScreenProcedure> createState() => _SearchScreenProcedureState();
}

class _SearchScreenProcedureState extends State<SearchScreenProcedure> {
  bool showResults = false;
  List<ModelProcedures>? proceduresList = [
    ModelProcedures(
      idProcedures: 1,
      nameProcedures: 'break1',
      // nameCustomer: 'omar',
      idCustomer: 1,
      dateProcedures: '2023/11/15',
      credit: '150',
      debit: '0',
    ),
    ModelProcedures(
      idProcedures: 2,
      nameProcedures: 'break2',
      // nameCustomer: 'omar',
      idCustomer: 1,
      dateProcedures: '2023/11/15',
      credit: '150',
      debit: '0',
    ),
    ModelProcedures(
      idProcedures: 3,
      nameProcedures: 'break3',
// nameCustomer: 'omar',
      idCustomer: 1, dateProcedures: '2023/11/15',
      credit: '150',
      debit: '0',
    ),
    ModelProcedures(
      idProcedures: 4,
      nameProcedures: 'break4',
// nameCustomer: 'omar',
      idCustomer: 1, dateProcedures: '2023/11/15',
      credit: '150',
      debit: '0',
    ),
    ModelProcedures(
      idProcedures: 5,
      nameProcedures: 'break5',
// nameCustomer: 'omar',
      idCustomer: 1, dateProcedures: '2023/11/15',
      credit: '150',
      debit: '0',
    ),
    ModelProcedures(
      idProcedures: 6,
      nameProcedures: 'break6',
// nameCustomer: 'omar',
      idCustomer: 1, dateProcedures: '2023/11/15',
      credit: '150',
      debit: '0',
    ),
    ModelProcedures(
      idProcedures: 7,
      nameProcedures: 'break7',
// nameCustomer: 'omar',
      idCustomer: 1, dateProcedures: '2023/11/15',
      credit: '150',
      debit: '0',
    ),
    ModelProcedures(
      idProcedures: 8,
      nameProcedures: 'break8',
// nameCustomer: 'omar',
      idCustomer: 1, dateProcedures: '2023/11/15',
      credit: '150',
      debit: '0',
    ),
  ];

  List<ModelProcedures> searchResults = [];
  // List<ModelCustomer> searchResults = modelList;
  TextEditingController input1 = TextEditingController();
  TextEditingController input2 = TextEditingController();
  final searchFieldKey = GlobalKey<FormFieldState>();
  void search(String query) {
    if (query.isEmpty) {
      setState(() {
        showResults = false;
        searchResults.clear();
      });
    } else {
      // List<ModelCustomer> results = modelList!.where((customer) {
      searchResults = proceduresList!.where((customer) {
        return customer.nameProcedures
            .toLowerCase()
            .contains(query.toLowerCase());
      }).toList();
      showResults = true;
      setState(() {
        // searchResults = results;
      });
    }
  }

  @override
  void initState() {
    searchResults = proceduresList as List<ModelProcedures>;
    super.initState();
    // WidgetsBinding.instance?.addPostFrameCallback((_) {
    //   searchFieldKey.currentState?.requestFocus();
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        key: searchFieldKey,
                        decoration: const InputDecoration.collapsed(
                          hintText: 'Search',
                        ),
                        // decoration: const InputDecoration(
                        //   // suffix: ,
                        //   prefixIcon: Icon(Icons.search, color: Colors.grey),
                        //   hintText: 'Search',
                        // ),
                        onChanged: (value) => search(value),
                      ),
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
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
                ModelProcedures model = proceduresList![index];
                return AllProceduresItems(
                  modelProcedure: model,
                  input1: input1,
                  input2: input2,
                  onDeletePress: () {},
                  onEditPress: () {},
                );
              },
              childCount: searchResults.length,
            ),
          ),

          // SliverAppBar(
          //   leading: IconButton(
          //     onPressed: () => Navigator.pop(context),
          //     icon: const Icon(
          //       Icons.arrow_back_ios,
          //       size: 24,
          //       color: primaryClr,
          //     ),
          //   ),
          //   backgroundColor: Colors.green, // لون خلفية العنوان
          //   expandedHeight: 70, // ارتفاع العنوان عندما يتم توسيعه
          //   pinned:
          //       true, // يتم تثبيت العنوان في الجزء العلوي عند التمرير للأسفل
          //   flexibleSpace: const FlexibleSpaceBar(
          //     titlePadding: EdgeInsets.only(
          //         left: 25, bottom: 16), // تعديل الهوامش الداخلية لعنوان الصفحة
          //     title: Text(
          //       'WhatsApp',
          //       style: TextStyle(
          //         fontSize: 24,
          //         fontWeight: FontWeight.bold,
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
    // return Container(
    //   // height: 50,
    //   decoration: BoxDecoration(
    //     borderRadius: BorderRadius.circular(8),
    //     color: Colors.grey[200],
    //   ),
    //   child: Row(
    //     children: [
    //       const SizedBox(width: 8),
    //       const Icon(Icons.search),
    //       const SizedBox(width: 8),
    //       Expanded(
    //         child: TextField(
    //           decoration: const InputDecoration.collapsed(
    //             hintText: 'Search',
    //           ),
    //           // onChanged: (value) => Navigator.of(context).pushNamed(Name.iDSearchScreen),
    //           // onTap: () =>
    //               // Navigator.of(context).pushNamed(Name.iDSearchScreen),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
