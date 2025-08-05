import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_debts/app/utils/constant.dart';
import 'package:my_debts/app/function/app_status.dart';
import 'package:my_debts/presentation/customer/view-model/bloc/customer_bloc.dart';
import 'package:my_debts/app/utils/theme.dart';
import 'widgets/all_customers_items.dart';

class AllCustomers extends StatelessWidget {
  const AllCustomers({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
            expandedHeight: 120,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: const EdgeInsets.only(left: 25, bottom: 16),
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
            child: BlocBuilder<CustomerBloc, CustomerState>(
              builder: (context, state) {
                if (state.status.isLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state.status.isLoaded) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      itemCount: state.allCustomer.length,
                      itemBuilder: (context, index) {
                        return AllCustomersItems(
                          modelCustomer: state.allCustomer[index],
                        );
                      },
                    ),
                  );
                } else if (state.status.isError) {
                  return const Center();
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
