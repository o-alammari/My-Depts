import 'package:my_debts/model/model_procedures.dart';
import '../db_helper/repository.dart';

class ProceduresServices {
  late Repository _repository;
  ProceduresServices() {
    _repository = Repository();
  }

  saveProcedures(ModelProcedures procedure) async {
    return await _repository.insertData('procedures', procedure.toJson());
  }

  readAllProceduresCustomer() async {
    return await _repository.readAllProceduresCustomer(
        1, '2023-11-20', '2023-01-31');
  }

  readAllProceduresById(dynamic id) async {
    return await _repository.readDataById('procedures', id);
  }

  updateProcedures(ModelProcedures procedure) async {
    return await _repository.updateData('procedures', procedure.toJson());
  }

  deleteProcedures(procedureId) async {
    return await _repository.deleteDataById('procedures', procedureId);
  }
}
