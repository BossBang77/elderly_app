import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
part 'emergency_client.g.dart';

@RestApi(baseUrl: '')
abstract class EmergencyService {
  factory EmergencyService(Dio dio) = _EmergencyService;

  @POST('/api/v1/emergency/elderly/create')
  @Headers(<String, dynamic>{
    "Accept": "application/json",
    "Content-Type": "application/json",
  })
  Future<HttpResponse> createEmergency(@Body() Map<String, dynamic> body);

  @GET('/api/v1/emergency/elderly/detail')
  @Headers(<String, dynamic>{
    "Accept": "application/json",
    "Content-Type": "application/json",
  })
  Future<HttpResponse> getEmergencyDetail();

  @PUT('/api/v1/emergency/update-status')
  @Headers(<String, dynamic>{
    "Accept": "application/json",
    "Content-Type": "application/json",
  })
  Future<HttpResponse> updateStatusEmergency(@Body() Map<String, dynamic> body);
}
