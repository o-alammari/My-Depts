import 'package:testing_2/model/model_customer.dart';
import '../db_helper/repository.dart';

class CustomerService {
  late Repository _repository;
  CustomerService() {
    _repository = Repository();
  }
  //Save User
  saveCustomer(ModelCustomer customer) async {
    return await _repository.insertData('customers', customer.toJson());
  }

  //Read All Users
  readAllCustomers() async {
    return await _repository.readData('customers');
  }

  //Edit User
  updateCustomer(ModelCustomer customer) async {
    return await _repository.updateData('customers', customer.toJson());
  }

  deleteCustomer(customerId) async {
    return await _repository.deleteDataById('customers', customerId);
  }
}
