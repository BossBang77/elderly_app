import 'dart:convert';

import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
part 'logout_client.g.dart';

@RestApi(baseUrl: '')
abstract class LogoutService {
  factory LogoutService(Dio dio) = _LogoutService;

  @POST('/authentication/user/logout')
  @Headers(<String, dynamic>{
    "Accept": "application/json",
    "Content-Type": "application/x-www-form-urlencoded",
  })
  Future<HttpResponse> sendLogout(@Header('Authorization') String accessToken,
      @Header('device_type') String deviceType);
}
