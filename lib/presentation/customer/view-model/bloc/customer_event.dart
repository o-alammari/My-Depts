part of 'customer_bloc.dart';

@immutable
abstract class CustomerEvent extends Equatable {
  const CustomerEvent();
  @override
  List<Object?> get props => [];
}

class CustomerEvents extends CustomerEvent {
  final CustomerEvents? modelCustomer;
  const CustomerEvents({
    this.modelCustomer,
  });

  @override
  List<Object?> get props => [modelCustomer];
}

class AddCustomerEvent extends CustomerEvents {
  final ModelCustomer? addCustomer;

  const AddCustomerEvent({
    this.addCustomer,
  });
  @override
  List<Object?> get props => [addCustomer];
}
class UpdateCustomerEvent extends CustomerEvents {
  final ModelCustomer? updateCustomer;

  const UpdateCustomerEvent({
    this.updateCustomer,
  });
  @override
  List<Object?> get props => [updateCustomer];
}

class DeleteCustomerEvent extends CustomerEvents {
  final int idCustomer;

  const DeleteCustomerEvent({
    required this.idCustomer,
  });

  @override
  List<Object?> get props => [idCustomer];
}

class AllCustomersEvent extends CustomerEvents {
  const AllCustomersEvent();
  @override
  List<Object?> get props => [];

  // final List<ModelCustomer>? allCustomer;

  // const AllCustomersEvent({
  //   this.allCustomer,
  // });
  // @override
  // List<Object?> get props => [allCustomer];
}

class CustomerNameChangedEvent extends CustomerEvents {
  final String customerName;

  const CustomerNameChangedEvent({required this.customerName});
  @override
  List<Object?> get props => [customerName];
}

class CustomerPhoneChangedEvent extends CustomerEvents {
  final String? customerPhone;

  const CustomerPhoneChangedEvent({this.customerPhone});
  @override
  List<Object?> get props => [customerPhone];
}

class CustomerCreditChangedEvent extends CustomerEvents {
  final String? customerCredit;

  const CustomerCreditChangedEvent({this.customerCredit});
  @override
  List<Object?> get props => [customerCredit];
}

class CustomerSearchChangedEvent extends CustomerEvents {
  final String? customerSearch;

  const CustomerSearchChangedEvent({this.customerSearch});
  @override
  List<Object?> get props => [customerSearch];
}

class SaveCustomerButtonPressedEvent extends CustomerEvent {}
