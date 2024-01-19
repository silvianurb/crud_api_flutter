import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_application_2/data/model/user.dart';

class RemoteDataSource {
  final dio = Dio(BaseOptions(
      baseUrl:
          'https://65a8ac8b219bfa3718675d98.mockapi.io/espresso_edu/api/user'));

  Future<DataUser> getUsers() async {
    final response = await dio.get('/users');
    log(response.data.toString());
    return DataUser.fromJson(response.data);
  }
}
