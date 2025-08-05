part of 'procedure_bloc.dart';

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
