import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
part 'medication_client.g.dart';

@RestApi(baseUrl: '')
abstract class MedicationService {
  factory MedicationService(Dio dio) = _MedicationService;

  @POST('/api/v1/medication/personal-medication')
  @Headers(<String, dynamic>{
    "Accept": "application/json",
    "Content-Type": "application/json",
  })
  Future<HttpResponse> createPersonalMedication(
      @Body() Map<String, dynamic> body);

  @PUT('/api/v1/medication/personal-medication')
  @Headers(<String, dynamic>{
    "Accept": "application/json",
    "Content-Type": "application/json",
  })
  Future<HttpResponse> updatePersonalMedication(
      @Body() Map<String, dynamic> body);

  @GET('/api/v1/medication/personal-medication-list')
  @Headers(<String, dynamic>{
    "Accept": "application/json",
    "Content-Type": "application/json",
  })
  Future<HttpResponse> getPersonalMedicationList();

  @GET('/api/v1/medication/get-medication-list')
  @Headers(<String, dynamic>{
    "Accept": "application/json",
    "Content-Type": "application/json",
  })
  Future<HttpResponse> getMasterMedication();

  @DELETE('/api/v1/medication/personal-medication/{id}')
  @Headers(<String, dynamic>{
    "Accept": "application/json",
    "Content-Type": "application/json",
  })
  Future<HttpResponse> deleteMedication(@Path() String id);
}
