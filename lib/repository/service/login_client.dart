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

  @POST('/api/v1/refresh-token')
  @Headers(<String, dynamic>{
    "Accept": "application/json",
    "Content-Type": "application/json",
  })
  Future<HttpResponse> refreshToken(@Body() Map<String, dynamic> body);

  @GET('/api/v1/user/profile')
  @Headers(<String, dynamic>{
    "Accept": "application/json",
    "Content-Type": "application/json",
  })
  Future<HttpResponse> getProfile();
  @PUT('/api/v1/user/profile')
  @Headers(<String, dynamic>{
    "Accept": "application/json",
    "Content-Type": "application/json",
  })
  Future<HttpResponse> updateProfile(@Body() Map<String, dynamic> body);

  @PUT('/api/v1/user/profile/image')
  @Headers(<String, dynamic>{
    "Accept": "application/json",
    "Content-Type": "application/json",
  })
  Future<HttpResponse> uploadImageProfile(@Body() FormData body);
}
