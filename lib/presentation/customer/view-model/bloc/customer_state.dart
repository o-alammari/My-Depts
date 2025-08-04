part of 'customer_bloc.dart';



class CustomerState extends Equatable {
  // final CustomerStatus status;
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
    // this.status = CustomerStatus.initial,
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
    // CustomerStatus? status,
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

// class CustomerInitial extends CustomerState {}

// class LoadingState extends CustomerState {
//   @override
//   List<Object?> get props => [];
// }

// class LoadedState extends CustomerState {
//   final List<ModelCustomer> allCustomerList;

//   const LoadedState({this.allCustomerList = const <ModelCustomer>[]});

//   @override
//   List<Object> get props => [allCustomerList];
// }

// class SearchState extends CustomerState {
//   final List<ModelCustomer> searchCustomerList;

//   const SearchState({this.searchCustomerList = const <ModelCustomer>[]});

//   @override
//   List<Object> get props => [searchCustomerList];
// }

// class ErrorState extends CustomerState {
//   final String? errorMessage;

//   const ErrorState({this.errorMessage});
//   @override
//   List<Object?> get props => [errorMessage];
// }

// class SuccessState extends CustomerState {
//   // final ModelCustomer modelCustomer;
//   // SuccessState({required this.modelCustomer});
//   @override
//   List<Object?> get props => [];
// }
