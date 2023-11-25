import 'package:testing_2/model/model_procedures.dart';
import '../db_helper/repository.dart';

class ProceduresServices {
  late Repository _repository;
  ProceduresServices() {
    _repository = Repository();
  }
  //Save User
  saveProcedures(ModelProcedures procedure) async {
    return await _repository.insertData('procedures', procedure.toJson());
  }

  //Read All Users
  readAllProcedures() async {
    return await _repository.readData('procedures');
  }

  //Edit User
  updateProcedures(ModelProcedures procedure) async {
    return await _repository.updateData('procedures', procedure.toJson());
  }

  deleteProcedures(procedureId) async {
    return await _repository.deleteDataById('procedures', procedureId);
  }
}
