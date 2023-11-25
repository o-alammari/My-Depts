part of 'procedure_bloc.dart';

@immutable
abstract class ProcedureState {}

class ProcedureInitial extends ProcedureState {}

class LoadingState extends ProcedureState {}

class ErrorState extends ProcedureState {
  final String errorMessage;

  ErrorState({required this.errorMessage});
}

class SuccessState extends ProcedureState {
  final ModelProcedures user;

  SuccessState({required this.user});
}
