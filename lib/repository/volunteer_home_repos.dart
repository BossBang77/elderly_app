import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:health_application/repository/service/volunteer_home_client.dart';
import 'package:health_application/ui/base/model/failure.dart';
import 'package:health_application/ui/base/model/status_code.dart';
import 'package:health_application/ui/base/network_provider.dart';
import 'package:health_application/ui/register_profile/volunteer/model/elderly_profile_response.dart';
import 'package:retrofit/dio.dart';

class VolunteerHomeRepository {
  VolunteerHomeRepository();
  final NetworkProvider networkProvider = NetworkProvider();
  late final VolunteerHomeService _volunteerHomeService =
      VolunteerHomeService(networkProvider.dioClient());

  Future<Either<Failure, ElderlyProfileResponse>> getElderlyProfile(
      String id) async {
    try {
      final HttpResponse req =
          await _volunteerHomeService.getElderlyProfile(id);

      final Map<String, dynamic> data = req.data;
      if (req.response.statusCode == StatusCode.success) {
        return Right(ElderlyProfileResponse.fromJson(data));
      }
    } on DioError catch (error) {
      if (error.response?.statusCode == StatusCode.notFound) {
        print('Error 400 $error');
        return const Left(Failure(''));
      } else if (error.response?.statusCode == StatusCode.failure) {
        print('Error 500 $error');
        return const Left(Failure(''));
      }
    }
    return const Left(Failure(''));
  }
}
