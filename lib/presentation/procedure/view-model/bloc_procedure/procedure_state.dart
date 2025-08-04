part of 'procedure_bloc.dart';

// @immutable
// abstract class ProcedureState {}

enum ProcedureStatus { initial, success, error, loading, loaded }

extension ProcedureStatusX on ProcedureStatus {
  bool get isInitial => this == ProcedureStatus.initial;
  bool get isSuccess => this == ProcedureStatus.success;
  bool get isError => this == ProcedureStatus.error;
  bool get isLoading => this == ProcedureStatus.loading;
  bool get isLoaded => this == ProcedureStatus.loaded;
}

@immutable
abstract class CustomerState1 extends Equatable {
  const CustomerState1();
  @override
  List<Object?> get props => [];
}

class ProcedureState extends Equatable {
  final ProcedureStatus status;
  final int idProcedure;
  final String? nameProcedure;
  final String? amountProcedure;
  final String? creditProcedure;
  final ModelProcedures? addProcedure;
  final ModelProcedures? deleteProcedure;
  final ModelProcedures? updateProcedure;
  final List<ModelProcedures> allProcedure;
  final List<ModelProcedures> searchProcedure;

  const ProcedureState({
    this.status = ProcedureStatus.initial,
    this.idProcedure = 0,
    this.nameProcedure,
    this.amountProcedure,
    this.creditProcedure,
    this.addProcedure,
    this.deleteProcedure,
    this.updateProcedure,
    this.allProcedure = const <ModelProcedures>[],
    this.searchProcedure = const <ModelProcedures>[],
  });
  ProcedureState copyWith({
    int? idProcedure,
    String? nameProcedure,
    String? amountProcedure,
    String? creditProcedure,
    ProcedureStatus? status,
    ModelProcedures? addProcedure,
    ModelProcedures? deleteProcedure,
    ModelProcedures? updateProcedure,
    List<ModelProcedures>? allProcedure,
    List<ModelProcedures>? searchProcedure,
    // List<ModelCustomer>? searchCustomer,
  }) {
    return ProcedureState(
      status: status ?? this.status,
      idProcedure: idProcedure ?? this.idProcedure,
      nameProcedure: nameProcedure ?? this.nameProcedure,
      creditProcedure: creditProcedure ?? this.creditProcedure,
      amountProcedure: amountProcedure ?? this.amountProcedure,
      addProcedure: addProcedure ?? this.addProcedure,
      deleteProcedure: deleteProcedure ?? this.deleteProcedure,
      updateProcedure: updateProcedure ?? this.updateProcedure,
      allProcedure: allProcedure ?? this.allProcedure,
      searchProcedure: searchProcedure ?? this.searchProcedure,
    );
  }

  @override
  List<Object?> get props => [
        status,
        idProcedure,
        nameProcedure,
        creditProcedure,
        amountProcedure,
        addProcedure,
        deleteProcedure,
        updateProcedure,
        allProcedure,
        searchProcedure,
      ];
}

// class ProcedureInitial extends ProcedureState {}

// class LoadingState extends ProcedureState {
//   @override
//   List<Object?> get props => [];
// }

// class LoadedState extends ProcedureState {
//   final List<ModelProcedures> allProcedureList;

//   const LoadedState({this.allProcedureList = const <ModelProcedures>[]});

//   @override
//   List<Object> get props => [allProcedureList];
// }

// class SearchState extends ProcedureState {
//   final List<ModelProcedures> searchProcedureList;

//   const SearchState({this.searchProcedureList = const <ModelProcedures>[]});

//   @override
//   List<Object> get props => [searchProcedureList];
// }

// class ErrorState extends ProcedureState {
//   final String? errorMessage;

//   const ErrorState({this.errorMessage});
//   @override
//   List<Object?> get props => [errorMessage];
// }

// class SuccessState extends ProcedureState {
//   @override
//   List<Object?> get props => [];
// }

// class LoadingState extends ProcedureState {}
// class ErrorState extends ProcedureState {
//   final String errorMessage;
//   ErrorState({required this.errorMessage});
// }
// class SuccessState extends ProcedureState {
//   final ModelProcedures user;
//   const SuccessState({required this.user});
// }
