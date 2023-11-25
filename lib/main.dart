import 'package:flutter/material.dart';
import 'package:testing_2/presentation/customer/view-model/bloc/customer_bloc.dart';

import 'package:testing_2/presentation/customer/view/add_customer.dart';
import 'package:testing_2/presentation/procedure/view-model/bloc_procedure/procedure_bloc.dart';
import 'package:testing_2/presentation/procedure/view/add_procedure.dart';
import 'package:testing_2/presentation/customer/view/all_customers.dart';
import 'package:testing_2/all_procedures.dart';
import 'package:testing_2/constant.dart';
import 'package:testing_2/presentation/customer/view/edit_customer.dart';
import 'package:testing_2/edit_procedure.dart';
import 'package:testing_2/login_screen.dart';
import 'package:testing_2/reports_customer.dart';
import 'package:testing_2/search_screen_customers.dart';
import 'package:testing_2/search_screen_procedure.dart';
// import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CustomerBloc()..add(const AllCustomersEvent())),
        BlocProvider(create: (_) => ProcedureBloc())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // title: 'Flutter Demo',
        themeMode: ThemeMode.light,
        theme: ThemeData(
            // primarySwatch: Colors.blue,
            ),

        routes: {
          Name.iDLoginScreen: (_) => const LoginScreen(),
          Name.iDHomeScreen: (_) => const HomeScreen(),
          Name.iDAllCustomer: (_) => const AllCustomers(),
          Name.iDAllProcedures: (_) => const AllProcedures(),
          Name.iDSearchScreenCustomers: (_) => const SearchScreenCustomers(),
          Name.iDSearchScreenProcedure: (_) => const SearchScreenProcedure(),
          Name.iDAddCustomer: (_) => AddCustomerView(),
          Name.iDAddProcedure: (_) => const AddProcedure(),
          Name.iDEditCustomer: (_) => const EditCustomer(),
          Name.iDEditProcedure: (_) => const EditProcedure(),
          Name.iDReportCustomer: (_) => const ReportCustomer(),
        },

        // initialRoute: Name.iDLoginScreen,
        initialRoute: Name.iDHomeScreen,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
