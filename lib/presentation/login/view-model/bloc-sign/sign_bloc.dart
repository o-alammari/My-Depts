import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:testing_2/app/function/app_status.dart';
import 'package:testing_2/app/function/valid.dart';
import 'package:testing_2/model/model_user.dart';
import 'package:testing_2/services/user_service.dart';

part 'sign_event.dart';
part 'sign_state.dart';

class SignBloc extends Bloc<SignEvents, UserState> {
  UserService userService = UserService();
  SignBloc() : super(const UserState()) {
    on<UserNameChangedEvent>(_onUsernameChanged);
    on<UserPasswordChangedEvent>(_onUserAmountChanged);
    on<SignInUserEvent>(_signInUserEvent);
    on<SignUpUserEvent>(_signUpUserEvent);
    on<UpdateUserEvent>(_updateUserEvent);
    on<DeleteUserEvent>(_deleteUserEvent);
    // on<AllUsersEvent>(_allUsersEvent);
    // on<UserSearchChangedEvent>(_searchUsersEvent);
  }

  void _onUsernameChanged(
    UserNameChangedEvent event,
    Emitter<UserState> emit,
  ) {
    emit(
      state.copyWith(
        userName: event.userName,
      ),
    );
  }

  void _onUserAmountChanged(
    UserPasswordChangedEvent event,
    Emitter<UserState> emit,
  ) {
    emit(
      state.copyWith(
        password: event.password,
      ),
    );
  }

  void _signUpUserEvent(
    SignUpUserEvent event,
    Emitter<UserState> emit,
  ) async {
    final isValidNameUser = isValid(state.userName);
    final isValidPassword = isValid(state.password);
    if (isValidNameUser && isValidPassword) {
      print('True Check value success => ${state.userName} ${state.password} ');
      var re = await userService.signUpUser(event.signUpUser!);
      print('${re}');
      emit(
        state.copyWith(signUpUser: event.signUpUser, status: AppStatus.success),
      );
    } else {
      emit(state.copyWith(status: AppStatus.error));
      emit(state.copyWith(status: AppStatus.initial));
    }
  }

  void _signInUserEvent(
    SignInUserEvent event,
    Emitter<UserState> emit,
  ) async {
    emit(state.copyWith(status: AppStatus.loading));
    final isValidNameUser = isValid(state.userName);
    final isValidPassword = isValid(state.password);
    await Future.delayed(
      const Duration(seconds: 2),
      () {},
    );
    if (isValidNameUser && isValidPassword) {
      print('True Check value success => ${state.userName} ${state.password} ');
      var result = await userService.signInUser(event.signInUser!);
      print(result);
      if (result) {
        emit(
          state.copyWith(
              signInUser: event.signInUser, status: AppStatus.success),
        );
      } else {
        emit(state.copyWith(status: AppStatus.error));
        // emit(state.copyWith(status: AppStatus.initial));
      }
    } else {
      emit(state.copyWith(status: AppStatus.error));
      // emit(state.copyWith(status: AppStatus.initial));
    }
  }

  void _updateUserEvent(
    UpdateUserEvent event,
    Emitter<UserState> emit,
  ) async {
    final isValidNameUser = isValid(state.userName);
    final isValidPassword = isValid(state.password);
    if (isValidNameUser && isValidPassword) {
      try {
        await userService.updateUser(event.updateUser!);
        emit(
          state.copyWith(
              updateUser: event.updateUser, status: AppStatus.success),
        );
      } on Exception catch (_) {
        emit(state.copyWith(status: AppStatus.error));
      }
    } else {
      emit(state.copyWith(status: AppStatus.error));
    }
  }

  void _deleteUserEvent(
    DeleteUserEvent event,
    Emitter<UserState> emit,
  ) async {
    try {
      await userService.deleteUser(event.idUser);
      emit(
        state.copyWith(idUser: event.idUser, status: AppStatus.success),
      );
    } on Exception catch (_) {
      emit(state.copyWith(status: AppStatus.error));
    }
  }

  // void _allUsersEvent(AllUsersEvent event, Emitter<UserState> emit) async {
  //   emit(state.copyWith(status: AppStatus.loading));
  //   try {
  //     var list = await userService.readAllUsers();
  //     var list2 = <ModelUser>[];
  //     list.forEach((json) {
  //       list2.add(ModelUser.fromJson(json));
  //     });
  //     emit(
  //       state.copyWith(allUser: list2, status: AppStatus.loaded),
  //     );
  //   } catch (e) {
  //     emit(state.copyWith(status: AppStatus.error));
  //   }
  // }

  // void _searchUsersEvent(
  //     UserSearchChangedEvent event, Emitter<UserState> emit) async {
  //   if (event.UserSearch == '') {
  //     emit(
  //         state.copyWith(searchUser: state.allUser, status: AppStatus.loaded));
  //   } else {
  //     var list = state.allUser
  //         .where((User) => User.nameUsers
  //             .toLowerCase()
  //             .contains(event.UserSearch!.toLowerCase()))
  //         .toList();
  //     if (event.UserSearch == null) {
  //       emit(state.copyWith(status: AppStatus.error));
  //     } else {
  //       if (list.isEmpty) {
  //         emit(state.copyWith(searchUser: [], status: AppStatus.error));
  //       } else {
  //         emit(
  //           state.copyWith(searchUser: list, status: AppStatus.loaded),
  //         );
  //       }
  //     }
  //   }
  // }

  @override
  void onTransition(Transition<SignEvents, UserState> transition) {
    super.onTransition(transition);
    print(transition);
  }
}
