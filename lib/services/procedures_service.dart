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

  readAllProceduresById(dynamic id) async {
    return await _repository.readDataById('procedures', id);
  }

  //Edit User
  updateProcedures(ModelProcedures procedure) async {
    return await _repository.updateData('procedures', procedure.toJson());
  }

  deleteProcedures(procedureId) async {
    return await _repository.deleteDataById('procedures', procedureId);
  }

  readAllProceduresCustomerSum(idCustomer) async {
    return await _repository.readAllProceduresCustomerSum(idCustomer);
  }

  readAllProceduresCustomer(id, from, to) async {
    return await _repository.readAllProceduresCustomer1(id, from, to);
    // readAllProceduresCustomer() async {
    //   return await _repository.readAllProceduresCustomer(
    // 2, '2023-11-20', '2023-11-31');
  }
}
