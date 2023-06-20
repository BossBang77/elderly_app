import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
part 'volunteer_assistant.g.dart';

@RestApi(baseUrl: '')
abstract class VolunteerAssistantService {
  factory VolunteerAssistantService(Dio dio) = _VolunteerAssistantService;

  @POST('/api/v1/emergency/volunteer/agree-emergency')
  @Headers(<String, dynamic>{
    "Accept": "application/json",
    "Content-Type": "application/json",
  })
  Future<HttpResponse> agreeEmergency(@Body() Map<String, dynamic> body);

  @GET('/api/v1/emergency/volunteer/get-emergency-list')
  @Headers(<String, dynamic>{
    "Accept": "application/json",
    "Content-Type": "application/json",
  })
  Future<HttpResponse> getEmergencyList();

  @GET('/api/v1/emergency/volunteer/get-emergency/{id}')
  @Headers(<String, dynamic>{
    "Accept": "application/json",
    "Content-Type": "application/json",
  })
  Future<HttpResponse> getEmergencyById(@Path() String id);
}
