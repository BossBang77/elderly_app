import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
part 'elderly_appointment_client.g.dart';

@RestApi(baseUrl: '')
abstract class ElderlyAppointmentService {
  factory ElderlyAppointmentService(Dio dio) = _ElderlyAppointmentService;

  @POST('/api/v1/volunteer/search')
  @Headers(<String, dynamic>{
    "Accept": "application/json",
    "Content-Type": "application/json",
  })
  Future<HttpResponse> searchVolunteer(@Body() Map<String, dynamic> body);

  @GET('/api/v1/volunteer/profile/{id}')
  @Headers(<String, dynamic>{
    "Accept": "application/json",
    "Content-Type": "application/json",
  })
  Future<HttpResponse> getVolunteerDetail(@Path() String id);
  @GET('/api/v1/volunteer/reviews?profileId={id}&limit={limit}&offset={offset}')
  @Headers(<String, dynamic>{
    "Accept": "application/json",
    "Content-Type": "application/json",
  })
  Future<HttpResponse> getReview(
      @Path() String id, @Path() String limit, @Path() String offset);

  @POST('/api/v1/appointment/create-appointment')
  @Headers(<String, dynamic>{
    "Accept": "application/json",
    "Content-Type": "application/json",
  })
  Future<HttpResponse> createAppointment(@Body() Map<String, dynamic> body);

  @GET(
      '/api/v1/appointment/get-appointment-list?limit={limit}&offset={offset}&includeStatus={include}&elderlyProfileId={elderlyProfileId}&volunteerProfileId={volunteerProfileId}&excludeStatus={exclude}')
  @Headers(<String, dynamic>{
    "Accept": "application/json",
    "Content-Type": "application/json",
  })
  Future<HttpResponse> getAppointList(
      @Path() String limit,
      @Path() String offset,
      @Path() String include,
      @Path() String exclude,
      @Path() String elderlyProfileId,
      @Path() String volunteerProfileId);

  @GET('/api/v1/appointment/get-appointment/{id}')
  @Headers(<String, dynamic>{
    "Accept": "application/json",
    "Content-Type": "application/json",
  })
  Future<HttpResponse> getAppointById(@Path() String id);
}
