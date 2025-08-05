import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:my_debts/app/function/app_status.dart';
import 'package:my_debts/model/model_customer.dart';
import 'package:my_debts/services/customers_service.dart';
import 'package:my_debts/app/function/valid.dart';

part 'customer_event.dart';
part 'customer_state.dart';

class CustomerBloc extends Bloc<CustomerEvents, CustomerState> {
  CustomerService customerService = CustomerService();
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
  }

  void _addCustomerEvent(
    AddCustomerEvent event,
    Emitter<CustomerState> emit,
  ) async {
    final isValidNameCustomer = isValid(state.nameCustomer);
    final isValidPhoneCustomer = isValid(state.phoneCustomer);
    final isValidCreditCustomer = isValid(state.creditCustomer);
    if (isValidNameCustomer && isValidPhoneCustomer && isValidCreditCustomer) {
      await customerService.saveCustomer(event.addCustomer!);
      emit(
        state.copyWith(
            addCustomer: event.addCustomer, status: AppStatus.success),
      );
    } else {
      emit(state.copyWith(status: AppStatus.error));
    }
  }

  void _updateCustomerEvent(
    UpdateCustomerEvent event,
    Emitter<CustomerState> emit,
  ) async {
    final isValidNameCustomer = isValid(state.nameCustomer);
    final isValidPhoneCustomer = isValid(state.phoneCustomer);
    final isValidCreditCustomer = isValid(state.creditCustomer);
    if (isValidNameCustomer && isValidPhoneCustomer && isValidCreditCustomer) {
      try {
        customerService.updateCustomer(event.updateCustomer!);
        emit(
          state.copyWith(
              updateCustomer: event.updateCustomer, status: AppStatus.success),
        );
      } on Exception {
        emit(state.copyWith(status: AppStatus.error));
      }
    } else {
      emit(state.copyWith(status: AppStatus.error));
    }
  }

  void _deleteCustomerEvent(
    DeleteCustomerEvent event,
    Emitter<CustomerState> emit,
  ) async {
    try {
      await customerService.deleteCustomer(event.idCustomer);
      emit(
        state.copyWith(idCustomer: event.idCustomer, status: AppStatus.success),
      );
    } on Exception catch (_) {
      emit(state.copyWith(status: AppStatus.error));
    }
  }

  void _allCustomersEvent(
      AllCustomersEvent event, Emitter<CustomerState> emit) async {
    emit(state.copyWith(status: AppStatus.loading));
    try {
      var list = await customerService.readAllCustomers();
      var list2 = <ModelCustomer>[];
      list.forEach((json) {
        list2.add(ModelCustomer.fromJson(json));
      });
      emit(
        state.copyWith(allCustomer: list2, status: AppStatus.loaded),
      );
    } catch (e) {
      emit(state.copyWith(status: AppStatus.error));
    }
  }

  void _searchCustomersEvent(
      CustomerSearchChangedEvent event, Emitter<CustomerState> emit) async {
    if (event.customerSearch == '') {
      emit(state.copyWith(
          searchCustomer: state.allCustomer, status: AppStatus.loaded));
    } else {
      var list = state.allCustomer
          .where((customer) => customer.nameCustomer
              .toLowerCase()
              .contains(event.customerSearch!.toLowerCase()))
          .toList();
      if (event.customerSearch == null) {
        emit(state.copyWith(status: AppStatus.error));
      } else {
        if (list.isEmpty) {
          emit(state.copyWith(searchCustomer: [], status: AppStatus.error));
        } else {
          emit(
            state.copyWith(searchCustomer: list, status: AppStatus.loaded),
          );
        }
      }
    }
  }

  @override
  void onTransition(Transition<CustomerEvents, CustomerState> transition) {
    super.onTransition(transition);
  }

  Stream<CustomerState> fetchAllCustomers() async* {}
}
