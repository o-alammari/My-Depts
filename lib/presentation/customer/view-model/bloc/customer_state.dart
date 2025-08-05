part of 'customer_bloc.dart';

class CustomerState extends Equatable {
  final AppStatus status;
  final int idCustomer;
  final String? nameCustomer;
  final String? phoneCustomer;
  final String? creditCustomer;
  final ModelCustomer? addCustomer;
  final ModelCustomer? deleteCustomer;
  final ModelCustomer? updateCustomer;
  final List<ModelCustomer> allCustomer;
  final List<ModelCustomer> searchCustomer;

  const CustomerState({
    this.status = AppStatus.initial,
    this.idCustomer = 0,
    this.nameCustomer,
    this.phoneCustomer,
    this.creditCustomer,
    this.addCustomer,
    this.deleteCustomer,
    this.updateCustomer,
    this.allCustomer = const <ModelCustomer>[],
    this.searchCustomer = const <ModelCustomer>[],
  });
  CustomerState copyWith({
    AppStatus? status,
    int? idCustomer,
    String? nameCustomer,
    String? phoneCustomer,
    String? creditCustomer,
    ModelCustomer? addCustomer,
    ModelCustomer? deleteCustomer,
    ModelCustomer? updateCustomer,
    List<ModelCustomer>? allCustomer,
    List<ModelCustomer>? searchCustomer,
  }) {
    return CustomerState(
      status: status ?? this.status,
      idCustomer: idCustomer ?? this.idCustomer,
      nameCustomer: nameCustomer ?? this.nameCustomer,
      creditCustomer: creditCustomer ?? this.creditCustomer,
      phoneCustomer: phoneCustomer ?? this.phoneCustomer,
      addCustomer: addCustomer ?? this.addCustomer,
      deleteCustomer: deleteCustomer ?? this.deleteCustomer,
      updateCustomer: updateCustomer ?? this.updateCustomer,
      allCustomer: allCustomer ?? this.allCustomer,
      searchCustomer: searchCustomer ?? this.searchCustomer,
    );
  }

  @override
  List<Object?> get props => [
        status,
        idCustomer,
        nameCustomer,
        creditCustomer,
        phoneCustomer,
        addCustomer,
        deleteCustomer,
        updateCustomer,
        allCustomer,
        searchCustomer,
      ];
}
