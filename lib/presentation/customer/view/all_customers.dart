import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testing_2/constant.dart';
import 'package:testing_2/presentation/customer/view-model/bloc/customer_bloc.dart';
import 'package:testing_2/theme.dart';
import 'widgets/all_customers_items.dart';

class AllCustomers extends StatelessWidget {
  const AllCustomers({super.key});

  // FocusNode? input1FocusNode;
  @override
  Widget build(BuildContext context) {
    // BlocProvider.of<CustomerBloc>(context).add( AllCustomersEvent());
    return Scaffold(
      backgroundColor: Colors.white,
      // backgroundColor: Themes.backgroundColor,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            leading: IconButton(
              onPressed: () =>
                  Navigator.popAndPushNamed(context, Name.iDHomeScreen),
              icon: const Icon(
                Icons.arrow_back_ios,
                size: 24,
                // color: primaryClr,
                color: Colors.white,
              ),
            ),
            actions: [
              IconButton(
                  onPressed: () =>
                      Navigator.of(context).pushNamed(Name.iDAddCustomer),
                  icon: const Icon(Icons.add))
            ],
            centerTitle: true,
            backgroundColor: primaryClr,
            expandedHeight: 120, // ارتفاع العنوان عندما يتم توسيعه
            pinned: true, //يتم تثبيت العنوان في الجزء العلوي عند التمرير للأسفل
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: const EdgeInsets.only(
                  left: 25, bottom: 16), // تعديل الهوامش الداخلية لعنوان الصفحة
              title: Text(
                'Customer',
                style: titleAppBarStyle,
              ),
            ),
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
                  // color: Colors.white,
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
                          context.read<CustomerBloc>().add(
                              const CustomerSearchChangedEvent(
                                  customerSearch: ''));
                          Navigator.pushNamed(
                              context, Name.iDSearchScreenCustomers);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverFillRemaining(
            // hasScrollBody: false,
            // shape: RoundedRectangleBorder(
            //   borderRadius: BorderRadius.circular(15.0),
            // ),
            child: BlocBuilder<CustomerBloc, CustomerState>(
              builder: (context, state) {
                // if (state is LoadingState) {
                if (state.status.isLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                  // } else if (state is LoadedState) {
                } else if (state.status.isLoaded) {
                  // print(state.allCustomer[0]);
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      // padding: const EdgeInsets.only(top: 10),
                      padding: EdgeInsets.zero,
                      // itemCount: state.allCustomerList.length,
                      itemCount: state.allCustomer.length,
                      itemBuilder: (context, index) {
                        // var model = modelList[index];
                        return AllCustomersItems(
                          // modelCustomer: modelList[index],
                          modelCustomer: state.allCustomer[index],
                          // input1: input1,
                          // input2: input2,
                          // input3: input3,
                          onDeletePress: () {},
                          onEditPress: () {},
                        );
                      },
                    ),
                  );
                  // } else if (state is ErrorState) {
                } else if (state.status.isError) {
                  return const Center();
                  // customSnackBar(context, 'Type Error ${state.errorMessage}');
                  // customSnackBar(context, 'Type Error => Failure all Customers ');
                } else {
                  return Container();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
