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
}
