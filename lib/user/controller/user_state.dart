import 'package:untitled1/common/api_state.dart';

class UserState {
  ApiState? userList = ApiState();

  UserState({this.userList});

  UserState copyWith({
    ApiState? userList,
  }) {
    return UserState(
        userList: userList ?? this.userList,
    );
  }
}
