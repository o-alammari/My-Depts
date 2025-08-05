import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:my_debts/app/function/reports.dart';
import 'package:my_debts/app/widgets/custom_button.dart';
import 'package:my_debts/presentation/customer/view-model/bloc/customer_bloc.dart';
import 'package:my_debts/services/procedures_service.dart';
import 'package:my_debts/app/utils/theme.dart';

import '../../../app/widgets/select_box.dart';
import '../../../app/widgets/select_date.dart';

class ReportCustomer extends StatefulWidget {
  const ReportCustomer({super.key});

  @override
  State<ReportCustomer> createState() => _ReportCustomerState();
}

class _ReportCustomerState extends State<ReportCustomer> {
  late int idCustomer;
  late String fromDate = DateTime.now().toString();
  late String toDate = DateTime.now().toString();

  @override
  void initState() {
    super.initState();
    context.read<CustomerBloc>().add(const AllCustomersEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Themes.backgroundColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 24,
            color: Colors.white,
          ),
        ),
        title: Text('Report Customer', style: titleAppBarStyle),
        elevation: 0.1,
        backgroundColor: primaryClr,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
            Text('Customer', style: titleStyle),
            SelectBox(onResult: (result) {
              idCustomer = context
                  .read<CustomerBloc>()
                  .state
                  .allCustomer
                  .firstWhere((element) => element.nameCustomer == result)
                  .idCustomer!;
            }),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SelectDate(
                  title: 'From Date',
                  onResult: (result) {
                    if (result != null) {
                      fromDate = result;
                    }
                  },
                ),
                SelectDate(
                  title: 'To Date',
                  onResult: (result) {
                    if (result != null) {
                      toDate = result;
                    }
                  },
                ),
              ],
            ),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      text: 'view',
                      backgroundColor: const Color.fromARGB(255, 27, 65, 146),
                      textColor: Colors.white,
                      fontSize: 17,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16),
                        bottomLeft: Radius.circular(16),
                      ),
                      onPressed: () async {
                        List<Map<String, dynamic>> result =
                            await ProceduresServices()
                                .readAllProceduresCustomer(
                                    idCustomer, fromDate, toDate);
                        setState(() {});
                        await generateAndPrintArabicPdf(
                            fromDate, toDate, result);
                      },
                    ),
                  ),
                  Expanded(
                    child: CustomButton(
                      text: 'Share',
                      backgroundColor: primaryClr,
                      textColor: Colors.white,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(16),
                        bottomRight: Radius.circular(16),
                      ),
                      fontSize: 17,
                      onPressed: () async {},
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
