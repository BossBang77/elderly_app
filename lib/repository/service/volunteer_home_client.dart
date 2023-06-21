import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
part 'volunteer_home_client.g.dart';

@RestApi(baseUrl: '')
abstract class VolunteerHomeService {
  factory VolunteerHomeService(Dio dio) = _VolunteerHomeService;

  @GET('/api/v1/elderly/profile/{id}')
  @Headers(<String, dynamic>{
    "Accept": "application/json",
    "Content-Type": "application/json",
  })
  Future<HttpResponse> getElderlyProfile(@Path() String id);
}
