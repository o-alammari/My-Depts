// // ignore_for_file: public_member_api_docs, sort_constructors_first
// part of 'customer_bloc.dart';

// enum AppStatus { initial, success, error, loading }

// extension AllGamesStatusX on AppStatus {
//   bool get isInitial => this == AppStatus.initial;
//   bool get isSuccess => this == AppStatus.success;
//   bool get isError => this == AppStatus.error;
//   bool get isLoading => this == AppStatus.loading;
// }

// @immutable
// abstract class CustomerState extends Equatable {
//   const CustomerState();
//   @override
//   List<Object?> get props => [];
// }

// class CustomerStates extends CustomerState {
//   final int idCustomer;
//   final String? nameCustomer;
//   final String? phoneCustomer;
//   final String? creditCustomer;
//   final ModelCustomer? addCustomer;
//   final ModelCustomer? deleteCustomer;
//   final ModelCustomer? updateCustomer;
//   final List<ModelCustomer> allCustomer;
//   final List<ModelCustomer> searchCustomer;

//   const CustomerStates({
//     this.idCustomer = 0,
//     this.nameCustomer,
//     this.phoneCustomer,
//     this.creditCustomer,
//     this.addCustomer,
//     this.deleteCustomer,
//     this.updateCustomer,
//     this.allCustomer = const <ModelCustomer>[],
//     this.searchCustomer = const <ModelCustomer>[],
//   });
//   CustomerStates copyWith({
//     int? idCustomer,
//     String? nameCustomer,
//     String? phoneCustomer,
//     String? creditCustomer,
//     ModelCustomer? addCustomer,
//     ModelCustomer? deleteCustomer,
//     ModelCustomer? updateCustomer,
//     List<ModelCustomer>? allCustomer,
//     List<ModelCustomer>? searchCustomer,
//   }) {
//     return CustomerStates(
//       idCustomer: idCustomer ?? this.idCustomer,
//       nameCustomer: nameCustomer ?? this.nameCustomer,
//       creditCustomer: creditCustomer ?? this.creditCustomer,
//       phoneCustomer: phoneCustomer ?? this.phoneCustomer,
//       addCustomer: addCustomer ?? this.addCustomer,
//       deleteCustomer: deleteCustomer ?? this.deleteCustomer,
//       updateCustomer: updateCustomer ?? this.updateCustomer,
//       allCustomer: allCustomer ?? this.allCustomer,
//       searchCustomer: searchCustomer ?? this.searchCustomer,
//     );
//   }

//   @override
//   List<Object?> get props => [
//         idCustomer,
//         nameCustomer,
//         creditCustomer,
//         phoneCustomer,
//         addCustomer,
//         deleteCustomer,
//         updateCustomer,
//         allCustomer,
//         searchCustomer,
//       ];
// }

// class CustomerInitial extends CustomerStates {}

// class LoadingState extends CustomerStates {
//   @override
//   List<Object?> get props => [];
// }

// class LoadedState extends CustomerStates {
//   final List<ModelCustomer> allCustomerList;

//   const LoadedState({this.allCustomerList = const <ModelCustomer>[]});

//   @override
//   List<Object> get props => [allCustomerList];
// }

// class SearchState extends CustomerStates {
//   final List<ModelCustomer> searchCustomerList;

//   const SearchState({this.searchCustomerList = const <ModelCustomer>[]});

//   @override
//   List<Object> get props => [searchCustomerList];
// }

// class ErrorState extends CustomerStates {
//   final String? errorMessage;

//   const ErrorState({this.errorMessage});
//   @override
//   List<Object?> get props => [errorMessage];
// }

// class SuccessState extends CustomerStates {
//   // final ModelCustomer modelCustomer;
//   // SuccessState({required this.modelCustomer});
//   @override
//   List<Object?> get props => [];
// }
