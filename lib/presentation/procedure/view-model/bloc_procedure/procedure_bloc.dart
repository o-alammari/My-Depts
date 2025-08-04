import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import 'package:testing_2/app/function/valid.dart';
import 'package:testing_2/model/model_procedures.dart';
import 'package:testing_2/services/procedures_service.dart';

part 'procedure_event.dart';
part 'procedure_state.dart';

class ProcedureBloc extends Bloc<ProcedureEvents, ProcedureState> {
  ProceduresServices procedureService = ProceduresServices();
  ProcedureBloc() : super(const ProcedureState()) {
    on<ProcedureNameChangedEvent>(_onUsernameChanged);
    on<ProcedureAmountChangedEvent>(_onProcedureAmountChanged);
    on<AddProcedureEvent>(_addProcedureEvent);
    on<UpdateProcedureEvent>(_updateProcedureEvent);
    on<DeleteProcedureEvent>(_deleteProcedureEvent);
    on<AllProceduresEvent>(_allProceduresEvent);
    on<ProcedureSearchChangedEvent>(_searchProceduresEvent);
  }

  void _onUsernameChanged(
    ProcedureNameChangedEvent event,
    Emitter<ProcedureState> emit,
  ) {
    emit(
      state.copyWith(
        nameProcedure: event.procedureName,
      ),
    );
  }

  void _onProcedureAmountChanged(
    ProcedureAmountChangedEvent event,
    Emitter<ProcedureState> emit,
  ) {
    emit(
      state.copyWith(
        amountProcedure: event.procedureAmount,
      ),
    );
  }

  void _addProcedureEvent(
    AddProcedureEvent event,
    Emitter<ProcedureState> emit,
  ) async {
    final isValidNameProcedure = isValid(state.nameProcedure);
    final isValidAmountProcedure = isValid(state.amountProcedure);
    if (isValidNameProcedure && isValidAmountProcedure) {
      print(
          'True Check value success => ${state.nameProcedure} ${state.amountProcedure} ');
      var re = await procedureService.saveProcedures(event.addProcedure!);
      print('${re}');
      emit(
        state.copyWith(
            addProcedure: event.addProcedure, status: ProcedureStatus.success),
      );
    } else {
      emit(state.copyWith(status: ProcedureStatus.error));
    }
  }

  void _updateProcedureEvent(
    UpdateProcedureEvent event,
    Emitter<ProcedureState> emit,
  ) async {
    final isValidNameProcedure = isValid(state.nameProcedure);
    final isValidAmountProcedure = isValid(state.amountProcedure);
    if (isValidNameProcedure && isValidAmountProcedure) {
      try {
        await procedureService.updateProcedures(event.updateProcedure!);
        emit(
          state.copyWith(
              updateProcedure: event.updateProcedure,
              status: ProcedureStatus.success),
        );
      } on Exception catch (_) {
        emit(state.copyWith(status: ProcedureStatus.error));
      }
    } else {
      emit(state.copyWith(status: ProcedureStatus.error));
    }
  }

  void _deleteProcedureEvent(
    DeleteProcedureEvent event,
    Emitter<ProcedureState> emit,
  ) async {
    try {
      await procedureService.deleteProcedures(event.idProcedure);
      emit(
        state.copyWith(
            idProcedure: event.idProcedure, status: ProcedureStatus.success),
      );
    } on Exception catch (_) {
      emit(state.copyWith(status: ProcedureStatus.error));
    }
  }

  void _allProceduresEvent(
      AllProceduresEvent event, Emitter<ProcedureState> emit) async {
    emit(state.copyWith(status: ProcedureStatus.loading));
    try {
      var list = await procedureService.readAllProceduresById(event.customerId);
      var list2 = <ModelProcedures>[];
      list.forEach((json) {
        list2.add(ModelProcedures.fromJson(json));
      });
      emit(
        state.copyWith(allProcedure: list2, status: ProcedureStatus.loaded),
      );
    } catch (e) {
      emit(state.copyWith(status: ProcedureStatus.error));
    }
  }

  void _searchProceduresEvent(
      ProcedureSearchChangedEvent event, Emitter<ProcedureState> emit) async {
    if (event.procedureSearch == '') {
      emit(state.copyWith(
          searchProcedure: state.allProcedure, status: ProcedureStatus.loaded));
    } else {
      var list = state.allProcedure
          .where((procedure) => procedure.nameProcedures
              .toLowerCase()
              .contains(event.procedureSearch!.toLowerCase()))
          .toList();
      if (event.procedureSearch == null) {
        emit(state.copyWith(status: ProcedureStatus.error));
      } else {
        if (list.isEmpty) {
          emit(state
              .copyWith(searchProcedure: [], status: ProcedureStatus.error));
        } else {
          emit(
            state.copyWith(
                searchProcedure: list, status: ProcedureStatus.loaded),
          );
        }
      }
    }
  }

  @override
  void onTransition(Transition<ProcedureEvents, ProcedureState> transition) {
    super.onTransition(transition);
    print(transition);
  }
}
