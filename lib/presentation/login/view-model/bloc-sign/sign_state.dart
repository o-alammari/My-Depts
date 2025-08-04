part of 'sign_bloc.dart';

class UserState extends Equatable {
  final AppStatus status;
  final int idUser;
  final String? userName;
  final String? password;
  final String? creditUser;
  final ModelUser? signInUser;
  final ModelUser? signUpUser;
  final ModelUser? deleteUser;
  final ModelUser? updateUser;
  final List<ModelUser> allUser;
  final List<ModelUser> searchUser;

  const UserState({
    this.status = AppStatus.initial,
    this.idUser = 0,
    this.userName,
    this.password,
    this.creditUser,
    this.signInUser,
    this.signUpUser,
    this.deleteUser,
    this.updateUser,
    this.allUser = const <ModelUser>[],
    this.searchUser = const <ModelUser>[],
  });
  UserState copyWith({
    AppStatus? status,
    int? idUser,
    String? userName,
    String? password,
    String? creditUser,
    ModelUser? signInUser,
    ModelUser? signUpUser,
    ModelUser? deleteUser,
    ModelUser? updateUser,
    List<ModelUser>? allUser,
    List<ModelUser>? searchUser,
  }) {
    return UserState(
      status: status ?? this.status,
      idUser: idUser ?? this.idUser,
      userName: userName ?? this.userName,
      creditUser: creditUser ?? this.creditUser,
      password: password ?? this.password,
      signInUser: signInUser ?? this.signInUser,
      signUpUser: signUpUser ?? this.signUpUser,
      deleteUser: deleteUser ?? this.deleteUser,
      updateUser: updateUser ?? this.updateUser,
      allUser: allUser ?? this.allUser,
      searchUser: searchUser ?? this.searchUser,
    );
  }

  @override
  List<Object?> get props => [
        status,
        idUser,
        userName,
        creditUser,
        password,
        signInUser,
        signUpUser,
        deleteUser,
        updateUser,
        allUser,
        searchUser,
      ];
}
