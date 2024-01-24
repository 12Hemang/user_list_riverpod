
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled1/common/network/dio_instance.dart';
import 'package:untitled1/user/model/usser_data.dart';
import 'package:untitled1/user/repo/user_repo_impl.dart';

final userRepoProvider = Provider((ref) =>UserRepoImp(dioInstance));

 abstract class UserRepo{

 Future<List<UserData>> getUsers();

}


