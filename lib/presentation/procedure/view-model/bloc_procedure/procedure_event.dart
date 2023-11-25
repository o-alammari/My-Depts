part of 'procedure_bloc.dart';

@immutable
abstract class ProcedureEvent {}

class ProcedureNameChangedEvent extends ProcedureEvent {
  final String procedureName;

  ProcedureNameChangedEvent({required this.procedureName});
}

class ProcedureAmountChangedEvent extends ProcedureEvent {
  final String procedureAmount;

  ProcedureAmountChangedEvent({required this.procedureAmount});
}

class SaveProcedureButtonPressedEvent extends ProcedureEvent {}
