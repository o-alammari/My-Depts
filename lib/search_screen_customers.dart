import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testing_2/function/custom_snack_bar.dart';
import 'package:testing_2/presentation/customer/view-model/bloc/customer_bloc.dart';
import 'theme.dart';
import 'presentation/customer/view/widgets/all_customers_items.dart';

class SearchScreenCustomers extends StatelessWidget {
  const SearchScreenCustomers({super.key});

  // bool showResults = false;

  // List<ModelCustomer> modelList = [];

  // List<ModelCustomer> searchResults = [];

  // final searchFieldKey = GlobalKey<FormFieldState>();

  // void search(String query) {
  @override
  Widget build(BuildContext context) {
    // final customerBloc = BlocProvider.of<CustomerBloc>(context);

    return BlocConsumer<CustomerBloc, CustomerState>(
      listener: (context, state) {
        // if (state is SearchState) {
        if (state.status.isLoaded) {
          // searchResults = state.searchCustomer;
          // searchResults = state.searchCustomerList;
          // setState(() {});
          // } else if (state is ErrorState) {
        } else if (state.status.isError) {
          // setState(() {});
          // searchResults = state.;
          customSnackBar(context, 'Type Error => isError Not Customer');
        }
      },
      builder: (context, state) => Scaffold(
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
                          onChanged: (value) {
                            // search(value);
                            context.read<CustomerBloc>().add(
                                  CustomerSearchChangedEvent(
                                    customerSearch: value,
                                  ),
                                );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {
                    context.read<CustomerBloc>().add(const AllCustomersEvent());
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'Cancel',
                    style: TextStyle(fontSize: 18, color: primaryClr),
                  ),
                ),
              ],
              // leading: ,
              backgroundColor: const Color.fromARGB(255, 234, 237, 234),
              expandedHeight: 60,
              pinned: true,
            ),
            // if (showResults)
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  // ModelCustomer model = modelList[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: AllCustomersItems(
                      // modelCustomer: searchResults[index],
                      modelCustomer: context
                          .read<CustomerBloc>()
                          .state
                          .searchCustomer[index],
                      // modelCustomer: customerBloc.state.allCustomerList,
                      onDeletePress: () {},
                      onEditPress: () {},
                    ),
                  );
                },
                // childCount: searchResults.length,
                childCount:
                    context.read<CustomerBloc>().state.searchCustomer.length,
                // childCount: customerBloc.state.allCustomer.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
