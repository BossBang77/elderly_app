import 'dart:convert';

import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
part 'get_tdee_service.g.dart';

@RestApi(baseUrl: '')
abstract class GetTDEEService {
  factory GetTDEEService(Dio dio) = _GetTDEEService;

  @GET('/api/v1/user/get-tdee')
  @Headers(<String, dynamic>{
    "Accept": "application/json",
    "Content-Type": "application/x-www-form-urlencoded",
  })
  Future<HttpResponse> getTDEE();
}
