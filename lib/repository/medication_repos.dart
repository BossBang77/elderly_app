import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:health_application/ui/elderly/personal_medication/model/master_medication_list.dart';
import 'package:health_application/ui/elderly/request_assistance/model/request/create_emergency_model.dart';
import 'package:retrofit/dio.dart';
import '../ui/base/model/failure.dart';
import '../ui/base/model/status_code.dart';
import '../ui/base/network_provider.dart';
import '../ui/elderly/personal_medication/model/medication_detail_model.dart';
import '../ui/elderly/personal_medication/model/medication_list_model.dart';
import 'service/medication_client.dart';

class MedicationRepository {
  MedicationRepository();

  final NetworkProvider networkProvider = NetworkProvider();
  late final MedicationService _medicationService =
      MedicationService(networkProvider.dioClient());

  Future<Either<Failure, MasterMedicationListModel>>
      getMasterMedication() async {
    try {
      final HttpResponse req = await _medicationService.getMasterMedication();
      final Map<String, dynamic> data = req.data;

      return Right(MasterMedicationListModel.fromJson(data));
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

  Future<Either<Failure, ListMedicationDetailModel>>
      getPersonalMedicationList() async {
    try {
      final HttpResponse req =
          await _medicationService.getPersonalMedicationList();
      final Map<String, dynamic> data = req.data;
      print(data);
      return Right(ListMedicationDetailModel.fromJson(data));
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

  Future<Either<Failure, String>> deleteMedication(String id) async {
    try {
      final HttpResponse req = await _medicationService.deleteMedication(id);
      final Map<String, dynamic> data = req.data;
      return Right('Success');
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

  Future<Either<Failure, String>> createMedication(
      MedicationDetailModel body) async {
    try {
      final HttpResponse req =
          await _medicationService.createPersonalMedication(body.toJson());
      final Map<String, dynamic> data = req.data;
      return Right('Success');
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

  Future<Either<Failure, String>> updateMedication(
      MedicationDetailModel body) async {
    try {
      final HttpResponse req =
          await _medicationService.updatePersonalMedication(body.toJson());
      final Map<String, dynamic> data = req.data;
      print(body.toJson());
      return Right('Success');
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
}
