import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:testing_2/model/model_customer.dart';
import 'package:testing_2/services/customers_service.dart';

part 'customer_event.dart';
part 'customer_state.dart';

class CustomerBloc extends Bloc<CustomerEvents, CustomerState> {
  // bool isValidName = false;
  // bool isValidPhone = false;
  // bool isValidCredit = false;
  //  bool isValidName=false;
  // late bool isValidPhone;
  // late bool isValidCredit;
  CustomerService customerService = CustomerService();
  // List<ModelCustomer> modelCustomerList = <ModelCustomer>[];
  CustomerBloc() : super(const CustomerState()) {
    on<CustomerNameChangedEvent>(_onUsernameChanged);
    on<CustomerPhoneChangedEvent>(_onCustomerPhoneChanged);
    on<CustomerCreditChangedEvent>(_onCustomerCreditChanged);
    on<AddCustomerEvent>(_addCustomerEvent);
    on<UpdateCustomerEvent>(_updateCustomerEvent);
    on<DeleteCustomerEvent>(_deleteCustomerEvent);
    on<AllCustomersEvent>(_allCustomersEvent);
    on<CustomerSearchChangedEvent>(_searchCustomersEvent);
  }
  void _onUsernameChanged(
    CustomerNameChangedEvent event,
    Emitter<CustomerState> emit,
  ) {
    emit(
      state.copyWith(
        nameCustomer: event.customerName,
      ),
    );
    // final String? username = state.nameCustomer;
    // if (_isValid(username)) {
    // } else {
    //   emit(const ErrorState(errorMessage: 'valid customerName'));
    // }
  }

  void _onCustomerPhoneChanged(
    CustomerPhoneChangedEvent event,
    Emitter<CustomerState> emit,
  ) {
    emit(
      state.copyWith(
        phoneCustomer: event.customerPhone,
      ),
    );

    // final String? phoneCustomer = state.phoneCustomer;
    // print(state.phoneCustomer);
    // if (_isValid(phoneCustomer)) {
    // } else {
    //   emit(const ErrorState(errorMessage: 'valid phoneCustomer'));
    // }
  }

  void _onCustomerCreditChanged(
    CustomerCreditChangedEvent event,
    Emitter<CustomerState> emit,
  ) {
    emit(
      state.copyWith(
        creditCustomer: event.customerCredit,
      ),
    );
    // final String? customerCredit = state.creditCustomer;

    // if (_isValid(customerCredit)) {
    // } else {
    //   emit(const ErrorState(errorMessage: 'valid phoneCustomer'));
    // }
  }

  void _addCustomerEvent(
    AddCustomerEvent event,
    Emitter<CustomerState> emit,
  ) async {
    final isValidNameCustomer = _isValid(state.nameCustomer);
    final isValidPhoneCustomer = _isValid(state.phoneCustomer);
    final isValidCreditCustomer = _isValid(state.creditCustomer);
    if (isValidNameCustomer && isValidPhoneCustomer && isValidCreditCustomer) {
      print(
          'True Check value success => ${state.nameCustomer} ${state.phoneCustomer} ${state.creditCustomer}');
      var re = await customerService.saveCustomer(event.addCustomer!);
      print('${re}');
      emit(
        state.copyWith(
            addCustomer: event.addCustomer, status: CustomerStatus.success),
      );
    } else {
      emit(state.copyWith(status: CustomerStatus.error));
    }
  }

  void _updateCustomerEvent(
    UpdateCustomerEvent event,
    Emitter<CustomerState> emit,
  ) async {
    final isValidNameCustomer = _isValid(state.nameCustomer);
    final isValidPhoneCustomer = _isValid(state.phoneCustomer);
    final isValidCreditCustomer = _isValid(state.creditCustomer);
    if (isValidNameCustomer && isValidPhoneCustomer && isValidCreditCustomer) {
      print(
          'True Check value success => ${state.nameCustomer} ${state.phoneCustomer} ${state.creditCustomer}');
      try {
        var re = await customerService.updateCustomer(event.updateCustomer!);
        print('${re}');
        emit(
          state.copyWith(
              updateCustomer: event.updateCustomer,
              status: CustomerStatus.success),
        );
      } on Exception catch (e) {
        print(e);
        emit(state.copyWith(status: CustomerStatus.error));
      }
    } else {
      emit(state.copyWith(status: CustomerStatus.error));
    }
  }

  void _deleteCustomerEvent(
    DeleteCustomerEvent event,
    Emitter<CustomerState> emit,
  ) async {
    try {
      await customerService.deleteCustomer(event.idCustomer);
      emit(
        state.copyWith(
            idCustomer: event.idCustomer, status: CustomerStatus.success),
      );
      // _allCustomersEvent(const AllCustomersEvent(), emit);
    } on Exception catch (_) {
      emit(state.copyWith(status: CustomerStatus.error));
    }
  }

  void _allCustomersEvent(
      AllCustomersEvent event, Emitter<CustomerState> emit) async {
    emit(state.copyWith(status: CustomerStatus.loading));
    try {
      var list = await customerService.readAllCustomers();
      var list2 = <ModelCustomer>[];
      list.forEach((json) {
        list2.add(ModelCustomer.fromJson(json));
      });
      emit(
        state.copyWith(allCustomer: list2, status: CustomerStatus.loaded),
      );
      print(state.allCustomer.length);
    } catch (e) {
      emit(state.copyWith(status: CustomerStatus.error));
    }
  }

  void _searchCustomersEvent(
      CustomerSearchChangedEvent event, Emitter<CustomerState> emit) async {
    if (event.customerSearch == '') {
      emit(state.copyWith(
          searchCustomer: state.allCustomer, status: CustomerStatus.loaded));
    } else {
      var list = state.allCustomer
          .where((customer) => customer.nameCustomer
              .toLowerCase()
              .contains(event.customerSearch!.toLowerCase()))
          .toList();
      if (event.customerSearch == null) {
        emit(state.copyWith(status: CustomerStatus.error));
      } else {
        if (list.isEmpty) {
          print('isEmpty');
          emit(
              state.copyWith(searchCustomer: [], status: CustomerStatus.error));
        } else {
          print('True search');
          emit(
            state.copyWith(searchCustomer: list, status: CustomerStatus.loaded),
          );
        }
      }
    }
  }

  Stream<CustomerState> fetchAllCustomers() async* {
    // // yield LoadingState();
    // // modelCustomerList = await customerService.readAllCustomers();
    // var list = await customerService.readAllCustomers();
    // // print(list);
    // list.forEach((json) {
    //   modelCustomerList.add(ModelCustomer.fromJson(json));
    // });
    // yield state.copyWith(allCustomer: modelCustomerList);
    // // print(state.allCustomer);
    // // emit(state.copyWith(allCustomer: list));
  }

  // yield SuccessState();
  // CustomerService customerService = CustomerService();
  // customerService = CustomerService();
  //  customerService.open();
  // on<CustomerEvent>((event, emit) {
  // });

  // on<AddCustomerEvent>((event, emit) async {
  //   emit(LoadingState());
  //   try {
  //     await customerService.saveCustomer(event.modelCustomer);
  //     emit(SuccessState());
  //     // emit(SuccessState(modelCustomer: event.modelCustomer));
  //   } catch (e) {
  //     emit(ErrorState(errorMessage: 'errorMessage'));
  //   }
  //   // }
  // });

  // on<CustomerEvent>((event, emit) async {
  //   if (event is CustomerNameChangedEvent) {
  //     emit(LoadingState());
  //     isValidName = _isValid(event.customerName);
  //     if (isValidName) {
  //       emit(SuccessState());
  //     } else {
  //       emit(ErrorState(errorMessage: 'errorMessage'));
  //     }
  //   } else if (event is CustomerPhoneChangedEvent) {
  //     emit(LoadingState());
  //     isValidPhone = _isValid(event.customerPhone);
  //     if (isValidPhone) {
  //       emit(SuccessState());
  //     } else {
  //       emit(ErrorState(errorMessage: 'errorMessage'));
  //     }
  //   } else if (event is CustomerCreditChangedEvent) {
  //     emit(LoadingState());
  //     isValidCredit = _isValid(event.customerCredit);
  //     if (isValidCredit) {
  //       emit(SuccessState());
  //     } else {
  //       emit(ErrorState(errorMessage: 'errorMessage'));
  //     }
  //   } else if (event is AddCustomerEvent) {
  //     emit(LoadingState());
  //     try {
  //       if (isValidCredit && isValidPhone && isValidCredit) {
  //         await customerService.saveCustomer(event.modelCustomer);
  //         emit(SuccessState());
  //       }
  //     } catch (e) {
  //       emit(ErrorState(errorMessage: 'errorMessage '));
  //     }
  //   }

  // else if (event is AddCustomerEvent) {
  //   emit(LoadingState());
  //   try {
  //     await customerService.saveCustomer(event.modelCustomer);
  //     emit(SuccessState());
  //   } catch (e) {
  //     emit(ErrorState(errorMessage: 'errorMessage'));
  //   }
  // }
  // });

  // Stream<CustomerState> mapEventToState(CustomerEvent event) async* {
  //   if (event is CustomerNameChangedEvent) {
  //     // emit(LoadingState());
  //     yield LoadingState();
  //     final isValid = _isValid(event.customerName);
  //     final isValid1 = _isValid(event.customerName);
  //     if (isValid) {
  //       yield SuccessState();
  //     } else {
  //       yield ErrorState(errorMessage: 'error customerName');
  //     }
  //   } else if (event is SaveCustomerButtonPressedEvent) {
  //     yield LoadingState();
  //   }
  // }

  // on<AddCustomerEvent>((event, emit) async {
  //   emit(LoadingState());
  //   try {
  //     emit(SuccessState(modelCustomer: event.modelCustomer));
  //     await customerService.saveCustomer(event.modelCustomer);
  //   } catch (e) {
  //     emit(ErrorState(errorMessage: 'errorMessage'));
  //   }
  //   }
  // });

  // Stream<CustomerState> mapEventToState(CustomerEvent event) async* {
  //   if (event is CustomerNameChangedEvent) {

  //     final newUsername = event.customerName;
  // yield state.copyWith(username: newUsername);
  //     }
  //     else if(event is SaveCustomerButtonPressedEvent){
  //     yield LoadingState();

  //     try {

  //       final userModel = ModelCustomer(nameCustomer: event.customerName, phoneCustomer: phoneCustomer, creditCustomer: creditCustomer)
  //       await _userRepository.addUser(userModel);
  //       await customerService.saveCustomer();

  //       yield SuccessState(modelCustomer: );
  //     } catch (error) {
  //       yield ErrorState();
  //     }
  //   }
  //       yield ErrorState(errorMessage: '');

  // }

  bool _isValid(String? text) {
    if (text == null) {
      return false;
    }
    return text.isNotEmpty;
  }
}
