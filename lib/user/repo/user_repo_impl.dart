import 'package:dio/dio.dart';
import 'package:untitled1/common/network/dio_instance.dart';
import 'package:untitled1/user/model/usser_data.dart';
import 'package:untitled1/user/repo/user_repo.dart';

class UserRepoImp extends UserRepo {

  Dio dio;

  UserRepoImp(this.dio);

  @override
  Future<List<UserData>> getUsers() async {
    Response response = await dio.post("/post");
    return List<UserData>.from(response.data
        .map((e) => UserData.fromJson(e)));
  }
}
