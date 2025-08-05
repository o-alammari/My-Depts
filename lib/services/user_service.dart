import '../db_helper/repository.dart';
import '../model/model_user.dart';

class UserService {
  late Repository _repository;

  UserService() {
    _repository = Repository();
  }

  signUpUser(ModelUser user) async {
    return await _repository.insertData('users', user.toJson());
  }

  signInUser(ModelUser user) async {
    return await _repository.signInUser('users', user);
  }

  readAllUsers() async {
    return await _repository.readData('users');
  }

  updateUser(ModelUser user) async {
    return await _repository.updateData('users', user.toJson());
  }

  deleteUser(userId) async {
    return await _repository.deleteDataById('users', userId);
  }
}
