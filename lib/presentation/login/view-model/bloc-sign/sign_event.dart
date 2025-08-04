part of 'sign_bloc.dart';

// abstract class SignEvent extends Equatable {
//   const SignEvent();
//   @override
//   List<Object?> get props => [];
// }

abstract class SignEvents extends Equatable {
  const SignEvents();
  @override
  List<Object?> get props => [];
}

class SignUpUserEvent extends SignEvents {
  final ModelUser? signUpUser;
  const SignUpUserEvent({
    this.signUpUser,
  });
  @override
  List<Object?> get props => [signUpUser];
}

class SignInUserEvent extends SignEvents {
  final ModelUser? signInUser;

  const SignInUserEvent({
    this.signInUser,
  });
  @override
  List<Object?> get props => [signInUser];
}

class UpdateUserEvent extends SignEvents {
  final ModelUser? updateUser;

  const UpdateUserEvent({
    this.updateUser,
  });
  @override
  List<Object?> get props => [updateUser];
}

class DeleteUserEvent extends SignEvents {
  final int idUser;

  const DeleteUserEvent({
    required this.idUser,
  });

  @override
  List<Object?> get props => [idUser];
}

class UserNameChangedEvent extends SignEvents {
  final String userName;

  const UserNameChangedEvent({required this.userName});
  @override
  List<Object?> get props => [userName];
}

class UserPasswordChangedEvent extends SignEvents {
  final String password;

  const UserPasswordChangedEvent({required this.password});
  @override
  List<Object?> get props => [password];
}
