import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

part 'appointment_service.g.dart';

@RestApi(baseUrl: '')
abstract class AppointmentService {
  factory AppointmentService(Dio dio) = _AppointmentService;

  @POST('/api/v1/appointment/get-appointment-list')
  @Headers(<String, dynamic>{
    "Accept": "application/json",
    "Content-Type": "application/json",
  })
  Future<HttpResponse> getAppointmentList(@Body() Map<String, dynamic> body);

  @GET('/api/v1/appointment/get-appointment/{id}')
  @Headers(<String, dynamic>{
    "Accept": "application/json",
    "Content-Type": "application/json",
  })
  Future<HttpResponse> getAppointmentById(@Path() String id);

  @PUT('/api/v1/appointment/update-appointment-status')
  @Headers(<String, dynamic>{
    "Accept": "application/json",
    "Content-Type": "application/json",
  })
  Future<HttpResponse> updateAppointmentStatus(@Body() Map<String, dynamic> body);
}