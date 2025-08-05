import 'package:my_debts/model/model_customer.dart';
import '../db_helper/repository.dart';

class CustomerService {
  late Repository _repository;
  CustomerService() {
    _repository = Repository();
  }

  saveCustomer(ModelCustomer customer) async {
    return await _repository.insertData('customers', customer.toJson());
  }

  readAllCustomers() async {
    return await _repository.readData('customers');
  }

  updateCustomer(ModelCustomer customer) async {
    return await _repository.updateData('customers', customer.toJson());
  }

  deleteCustomer(customerId) async {
    return await _repository.deleteDataById('customers', customerId);
  }
}
