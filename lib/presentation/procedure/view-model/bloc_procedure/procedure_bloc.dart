import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:testing_2/model/model_procedures.dart';

part 'procedure_event.dart';
part 'procedure_state.dart';

class ProcedureBloc extends Bloc<ProcedureEvent, ProcedureState> {
  ProcedureBloc() : super(ProcedureInitial()) {
    on<ProcedureEvent>((event, emit) {});
  }
}
