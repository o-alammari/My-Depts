import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:my_debts/app/utils/constant.dart';
import 'package:my_debts/presentation/customer/view-model/bloc/customer_bloc.dart';
import 'package:my_debts/presentation/customer/view/add_customer.dart';
import 'package:my_debts/presentation/customer/view/all_customers.dart';
import 'package:my_debts/presentation/customer/view/edit_customer.dart';
import 'package:my_debts/presentation/customer/view/search_screen_customers.dart';
import 'package:my_debts/presentation/home/view/home_screen.dart';
import 'package:my_debts/presentation/login/view-model/bloc-sign/sign_bloc.dart';
import 'package:my_debts/presentation/login/view/sign_in_screen.dart';
import 'package:my_debts/presentation/login/view/sign_up_screen.dart';
import 'package:my_debts/presentation/procedure/view-model/bloc_procedure/procedure_bloc.dart';
import 'package:my_debts/presentation/procedure/view/add_procedure.dart';
import 'package:my_debts/presentation/procedure/view/all_procedures.dart';
import 'package:my_debts/presentation/procedure/view/edit_procedure.dart';
import 'package:my_debts/presentation/procedure/view/search_screen_procedure.dart';
import 'package:my_debts/presentation/reports/view/reports_customer.dart';

import 'app/utils/simple_bloc_observer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = SimpleBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => SignBloc()),
        BlocProvider(
            create: (_) => CustomerBloc()..add(const AllCustomersEvent())),
        BlocProvider(create: (_) => ProcedureBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        theme: ThemeData(),
        routes: {
          Name.iDSignUpScreen: (_) => SignUpScreen(),
          Name.iDSignInScreen: (_) => SignInScreen(),
          Name.iDHomeScreen: (_) => HomeScreen(),
          Name.iDAllCustomer: (_) => const AllCustomers(),
          Name.iDAllProcedures: (_) => const AllProcedures(),
          Name.iDSearchScreenCustomers: (_) => const SearchScreenCustomers(),
          Name.iDSearchScreenProcedure: (_) => const SearchScreenProcedure(),
          Name.iDAddCustomer: (_) => AddCustomerView(),
          Name.iDAddProcedure: (_) => const AddProcedure(),
          Name.iDEditCustomer: (_) => const EditCustomer(),
          Name.iDEditProcedure: (_) => EditProcedure(),
          Name.iDReportCustomer: (_) => const ReportCustomer(),
        },
        // initialRoute: Name.iDLoginScreen,
        initialRoute: Name.iDSignInScreen,
        // initialRoute: Name.iDHomeScreen,
      ),
    );
  }
}
