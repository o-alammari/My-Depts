import '../db_helper/repository.dart';
import '../model/model_user.dart';

class UserService {
  late Repository _repository;
  
  UserService() {
    _repository = Repository();
  }
  //Sign up User
  signUpUser(ModelUser user) async {
    return await _repository.insertData('users', user.toJson());
  }

  //Sign in User
  signInUser(ModelUser user) async {
    return await _repository.signInUser('users', user);
  }

  //Read All Users
  readAllUsers() async {
    return await _repository.readData('users');
  }

  //Edit User
  updateUser(ModelUser user) async {
    return await _repository.updateData('users', user.toJson());
  }

  deleteUser(userId) async {
    return await _repository.deleteDataById('users', userId);
  }
}
