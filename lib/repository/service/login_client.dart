import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
part 'login_client.g.dart';

@RestApi(baseUrl: '')
abstract class LoginService {
  factory LoginService(Dio dio) = _LoginService;

  @POST('/api/v1/authentication')
  @Headers(<String, dynamic>{
    "Accept": "application/json",
    "Content-Type": "application/json",
  })
  Future<HttpResponse> login(@Body() Map<String, dynamic> body);
}
