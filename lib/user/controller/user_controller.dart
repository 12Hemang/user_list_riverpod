import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled1/common/api_state.dart';
import 'package:untitled1/user/controller/user_state.dart';
import 'package:untitled1/user/model/usser_data.dart';
import 'package:untitled1/user/repo/user_repo.dart';
import 'package:untitled1/user/repo/user_repo_impl.dart';

final userControllerProvider =
    StateNotifierProvider<UserController, UserState>((ref) {
  return UserController(ref.read(userRepoProvider));
});

class UserController extends StateNotifier<UserState> {
  UserRepoImp repo;

  UserController(this.repo) : super(ApiState().init());

  getUserList() async {
    try {
      state = state.copyWith(userList: ApiState().loading());

      List<UserData> userList = await repo.getUsers();

      state = state.copyWith(userList: ApiState().success(data: userList));
    } catch (ex, st) {
      debugPrintStack(label: ex.toString(), stackTrace: st);
      state = state.copyWith(userList: ApiState().error(err: ex.toString()));
    }
  }
}
