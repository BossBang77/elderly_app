// import 'package:chopper/chopper.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

part 'appointment_service.g.dart';

@RestApi(baseUrl: '')
abstract class AppointmentService {
  factory AppointmentService(Dio dio) = _AppointmentService;

  @GET('/api/v1/appointment/get-appointment-list')
  @Headers(<String, dynamic>{
    "Accept": "application/json",
    "Content-Type": "application/json",
  })
  Future<HttpResponse> getAppointmentList(
      @Query("limit") int limit,
      @Query("offset") int offset,
      @Query("includeStatus") String? includeStatus,
      @Query("elderlyProfileId") String? elderlyProfileId,
      @Query("volunteerProfileId") String? volunteerProfileId,
      @Query("excludeStatus") String? excludeStatus,
      @Query("startDate") String? startDate,
      @Query("endDate") String? endDate);

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
  Future<HttpResponse> updateAppointmentStatus(
      @Body() Map<String, dynamic> body);
}
