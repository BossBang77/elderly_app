import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
part 'register_client.g.dart';

@RestApi(baseUrl: '')
abstract class RegisterService {
  factory RegisterService(Dio dio) = _RegisterService;

  @POST('/api/v1/user/register')
  @Headers(<String, dynamic>{
    "Accept": "application/json",
    "Content-Type": "application/json",
  })
  Future<HttpResponse> registerProfile(@Body() Map<String, dynamic> body);

  @POST('/api/v1/user/check-existing-user')
  @Headers(<String, dynamic>{
    "Accept": "application/json",
    "Content-Type": "application/json",
  })
  Future<HttpResponse> checkExisting(@Body() Map<String, dynamic> body);

  @POST('/api/v1/password/reset-password-request')
  @Headers(<String, dynamic>{
    "Accept": "application/json",
    "Content-Type": "application/json",
  })
  Future<HttpResponse> resetPasswordRequest(@Body() Map<String, dynamic> body);

  @POST('/api/v1/password/reset-password-verify')
  @Headers(<String, dynamic>{
    "Accept": "application/json",
    "Content-Type": "application/json",
  })
  Future<HttpResponse> resetPasswordVerify(@Body() Map<String, dynamic> body);

  @POST('/api/v1/password/reset-password')
  @Headers(<String, dynamic>{
    "Accept": "application/json",
    "Content-Type": "application/json",
  })
  Future<HttpResponse> resetPassword(@Body() Map<String, dynamic> body);

  @PUT('/api/v1/user/{username}/document/{docType}/upload')
  @Headers(<String, dynamic>{
    "Accept": "application/json",
    "Content-Type": "application/json",
  })
  Future<HttpResponse> uploadDocument(
      @Body() FormData body, @Path() String username, @Path() String docType);
}
