import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
part 'request_otp_client.g.dart';

@RestApi(baseUrl: '')
abstract class RequestOtpService {
  factory RequestOtpService(Dio dio) = _RequestOtpService;

  @POST('/api/v1/common/request-otp')
  @Headers(<String, dynamic>{
    "Accept": "application/json",
    "Content-Type": "application/json",
  })
  Future<HttpResponse> requestOtp(@Body() Map<String, dynamic> body);

  @POST('/api/v1/common/verify-otp')
  @Headers(<String, dynamic>{
    "Accept": "application/json",
    "Content-Type": "application/json",
  })
  Future<HttpResponse> verifyOtp(@Body() Map<String, dynamic> body);
}
