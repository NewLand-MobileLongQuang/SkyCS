import 'dart:convert';
import 'dart:io' as io;
import 'package:idnstd/core/data/datasource/mobile_sv/mobile_sv_data_source.dart';
import 'package:idnstd/src/auth/data/models/auth_result.dart';
import 'package:idnstd/src/auth/data/models/inos_user_model.dart';
import 'package:idnstd/src/auth/domain/entities/sso_data.dart';

import '../../../../core/common/app/entities/org.dart';
import '../../../../core/errors/exceptions.dart';
abstract class AuthDataSource {
  Future<AuthResultModel> login(
      {required String email, required String password});

  Future<UserModel> getCurrentUser();
  Future<List<Org>> getMyNetworks();
  Future<UserModel> saveUserProfile(
      {
      required String name,
      String avatar,
      String language,
      String currentPassword,
      String newPassword});

  Future<SSOData?> getSSOData();
  Future<void> saveSSOData({required String data});
}

class AuthRemoteDataSource extends MobileSvDataSource implements AuthDataSource {
  AuthRemoteDataSource(super.client);

  @override
  Future<AuthResultModel> login(
      {required String email, required String password}) async {
    final params = {
      'email': email,
      'password': password,
    };

    final response = await postAuth(path: 'accountapi/login', params: params);

    return response.Data!;
  }

  @override
  Future<UserModel> getCurrentUser() async {
    final response = await postUser(path: 'accountapi/getcurrentuser', params: null);

    return response.Data!;
  }

  @override
  Future<UserModel> saveUserProfile({
    required String name,
    String avatar = '',
    String language = '',
    String currentPassword = '',
    String newPassword = ''}) async {
    String img64 = '';
    if (avatar.isNotEmpty) {
      final bytes = io.File(avatar).readAsBytesSync();

      img64 = base64Encode(bytes);
    }


    final response =
    await postUser(path: 'accountapi/editprofile', params: {
      'name': name,
      'avatar': img64,
      'language': language,
      'currentPassword': currentPassword,
      'newPassword': newPassword,
    });

    return response.Data!;
  }

  @override
  Future<SSOData?> getSSOData() async {
    // TODO: implement getSSOData
    throw UnimplementedError();
  }

  @override
  Future<void> saveSSOData({required String data}) async {
    // TODO: implement saveSSOData
    throw UnimplementedError();
  }

  @override
  Future<List<Org>> getMyNetworks() async {

    try {
      final response =
      await postList(path: 'accountapi/getMyNetworks', params: null);

      return response.Data!.map((e) => e).toList();
    }
    on ApiException {
      rethrow;
    }
    on Exception catch (ex) {
      throw ApiException(Message: ex.toString());
    }
  }
}
