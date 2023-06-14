import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:health_application/repository/service/elderly_appointment_client.dart';
import 'package:health_application/ui/base/model/status_code.dart';
import 'package:health_application/ui/base/network_provider.dart';
import 'package:health_application/ui/elderly/search_volunteer/model/appointment/create_appointment.dart';
import 'package:health_application/ui/elderly/search_volunteer/model/appointment_detail/appointment_detail.dart';
import 'package:health_application/ui/elderly/search_volunteer/model/appointment_detail/appointment_list.dart';
import 'package:health_application/ui/elderly/search_volunteer/model/rating_res_model.dart';
import 'package:health_application/ui/elderly/search_volunteer/model/search_volunteer_model.dart';
import 'package:health_application/ui/elderly/search_volunteer/model/volunteer_detail_res.dart';
import 'package:retrofit/dio.dart';

import '../ui/base/model/failure.dart';
import '../ui/elderly/search_volunteer/model/volunteer_full_detail.dart';

class ElderlyAppointmentRepository {
  ElderlyAppointmentRepository();

  final NetworkProvider networkProvider = NetworkProvider();
  late final ElderlyAppointmentService _elderlyAppointmentService =
      ElderlyAppointmentService(networkProvider.dioClient());

  Future<Either<Failure, VolunteerDetailRes>> searchVolunteer(
      SearchVolunteerModel body) async {
    try {
      final HttpResponse req =
          await _elderlyAppointmentService.searchVolunteer(body.toJson());
      final Map<String, dynamic> data = req.data;
      if (req.response.statusCode == StatusCode.success) {
        return Right(VolunteerDetailRes.fromJson(data));
      }
    } on DioError catch (error) {
      print(error.response);
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

  Future<Either<Failure, VolunteerFullDetail>> searchVolunteerById(
      String id) async {
    try {
      final HttpResponse req =
          await _elderlyAppointmentService.getVolunteerDetail(id);
      final Map<String, dynamic> data = req.data;
      if (req.response.statusCode == StatusCode.success) {
        return Right(VolunteerFullDetail.fromJson(data['data']));
      }
    } on DioError catch (error) {
      print(error.response);
      if (error.response?.statusCode == StatusCode.notFound) {
        print('Error 400 $error');
        return const Left(Failure(''));
      } else if (error.response?.statusCode == StatusCode.failure) {
        print('Error 500 $error');
        return const Left(Failure(''));
      }
    } catch (e) {
      print(e);
      return const Left(Failure(''));
    }
    return const Left(Failure(''));
  }

  Future<Either<Failure, RatingResModel>> searchReview(String id,
      {String limit = '30', String offset = '0'}) async {
    try {
      final HttpResponse req =
          await _elderlyAppointmentService.getReview(id, limit, offset);
      final Map<String, dynamic> data = req.data;
      if (req.response.statusCode == StatusCode.success) {
        print(data['data']);
        return Right(RatingResModel.fromJson(data['data']));
      }
    } on DioError catch (error) {
      print(error.response);
      if (error.response?.statusCode == StatusCode.notFound) {
        print('Error 400 $error');
        return const Left(Failure(''));
      } else if (error.response?.statusCode == StatusCode.failure) {
        print('Error 500 $error');
        return const Left(Failure(''));
      }
    } catch (e) {
      print(e);
      return const Left(Failure(''));
    }
    return const Left(Failure(''));
  }

  Future<Either<Failure, String>> createAppointment(
      CreateAppointmentModel body) async {
    try {
      final HttpResponse req =
          await _elderlyAppointmentService.createAppointment(body.toJson());
      print(json.encode(body));
      print(req.response);
      return Right('success');
    } on DioError catch (error) {
      print(error.response);
      if (error.response?.statusCode == StatusCode.notFound) {
        print('Error 400 $error');
        return const Left(Failure(''));
      } else if (error.response?.statusCode == StatusCode.failure) {
        print('Error 500 $error');
        return const Left(Failure(''));
      }
    } catch (e) {
      print('oncatch');
      print(e);
      return const Left(Failure(''));
    }
    return const Left(Failure(''));
  }

  Future<Either<Failure, AppointList>> getAppointList(
      {int limit = 30,
      int offset = 0,
      String include = '',
      String exclude = '',
      String elderlyProfileId = '',
      String volunteerProfileId = ''}) async {
    try {
      final HttpResponse req = await _elderlyAppointmentService.getAppointList(
          limit.toString(),
          offset.toString(),
          include,
          exclude,
          elderlyProfileId,
          volunteerProfileId);
      final Map<String, dynamic> data = req.data;
      return Right(AppointList.fromJson(data));
    } on DioError catch (error) {
      print(error.response);
      if (error.response?.statusCode == StatusCode.notFound) {
        print('Error 400 $error');
        return const Left(Failure(''));
      } else if (error.response?.statusCode == StatusCode.failure) {
        print('Error 500 $error');
        return const Left(Failure(''));
      }
    } catch (e) {
      print('oncatch');
      print(e);
      return const Left(Failure(''));
    }
    return const Left(Failure(''));
  }

  Future<Either<Failure, AppointmentDetail>> getAppointByIdt(String id) async {
    try {
      final HttpResponse req =
          await _elderlyAppointmentService.getAppointById(id);

      final Map<String, dynamic> data = req.data;
      return Right(AppointmentDetail.fromJson(data['data']));
    } on DioError catch (error) {
      print(error.response);
      if (error.response?.statusCode == StatusCode.notFound) {
        print('Error 400 $error');
        return const Left(Failure(''));
      } else if (error.response?.statusCode == StatusCode.failure) {
        print('Error 500 $error');
        return const Left(Failure(''));
      }
    } catch (e) {
      print(e);
      return const Left(Failure(''));
    }
    return const Left(Failure(''));
  }
}
