// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'procedure_bloc.dart';

@immutable
abstract class ProcedureEvent extends Equatable {
  const ProcedureEvent();
  @override
  List<Object?> get props => [];
}

class ProcedureEvents extends ProcedureEvent {
  final ProcedureEvents? modelProcedure;
  const ProcedureEvents({
    this.modelProcedure,
  });

  @override
  List<Object?> get props => [modelProcedure];
}

class AddProcedureEvent extends ProcedureEvents {
  final ModelProcedures? addProcedure;

  const AddProcedureEvent({
    this.addProcedure,
  });
  @override
  List<Object?> get props => [addProcedure];
}

class UpdateProcedureEvent extends ProcedureEvents {
  final ModelProcedures? updateProcedure;

  const UpdateProcedureEvent({
    this.updateProcedure,
  });
  @override
  List<Object?> get props => [updateProcedure];
}

class DeleteProcedureEvent extends ProcedureEvents {
  final int idProcedure;

  const DeleteProcedureEvent({
    required this.idProcedure,
  });

  @override
  List<Object?> get props => [idProcedure];
}

class AllProceduresEvent extends ProcedureEvents {
  final int customerId;
  const AllProceduresEvent({required this.customerId});
  @override
  List<Object?> get props => [customerId];
}

class ProcedureNameChangedEvent extends ProcedureEvents {
  final String procedureName;

  const ProcedureNameChangedEvent({required this.procedureName});
  @override
  List<Object?> get props => [procedureName];
}

class ProcedureAmountChangedEvent extends ProcedureEvents {
  final String procedureAmount;

  const ProcedureAmountChangedEvent({required this.procedureAmount});
  @override
  List<Object?> get props => [procedureAmount];
}

class ProcedureSearchChangedEvent extends ProcedureEvents {
  final String? procedureSearch;

  const ProcedureSearchChangedEvent({this.procedureSearch});
  @override
  List<Object?> get props => [procedureSearch];
}

class SaveProcedureButtonPressedEvent extends ProcedureEvents {}
