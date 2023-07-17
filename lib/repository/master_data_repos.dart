import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:health_application/repository/service/master_data_client.dart';
import 'package:health_application/ui/base/app_config/conflig.dart';
import 'package:health_application/ui/base/master_address/model/address_detail_list.dart';
import 'package:health_application/ui/base/model/master_data.dart';
import 'package:retrofit/dio.dart';
import '../ui/base/model/failure.dart';
import '../ui/base/model/status_code.dart';
import '../ui/base/network_provider.dart';

class MasterDataRepository {
  MasterDataRepository();

  final NetworkProvider networkProvider = ConfigEnv.networkProvider;
  late final MasterDataService _masterDataService =
      MasterDataService(networkProvider.dioClient());

  Future<Either<Failure, MasterData>> loadMasterData(String category) async {
    try {
      final HttpResponse req = await _masterDataService.getMasterData(category);
      final Map<String, dynamic> data = req.data;
      if (req.response.statusCode == StatusCode.success) {
        return Right(MasterData.fromJson(data));
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

  Future<Either<Failure, AddressDetailList>> loadMasterProvince() async {
    try {
      final HttpResponse req = await _masterDataService.getMasterDataProvince();
      final Map<String, dynamic> data = req.data;
      if (req.response.statusCode == StatusCode.success) {
        return Right(AddressDetailList.fromJson(data));
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

  Future<Either<Failure, AddressDetailList>> loadMasterDistrict(
      String provinceCode) async {
    try {
      final HttpResponse req =
          await _masterDataService.getMasterDataDistrict(provinceCode);
      final Map<String, dynamic> data = req.data;
      if (req.response.statusCode == StatusCode.success) {
        return Right(AddressDetailList.fromJson(data));
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

  Future<Either<Failure, AddressDetailList>> loadMasterSubDistrict(
      String districtCode) async {
    try {
      final HttpResponse req =
          await _masterDataService.getMasterDataSubDistrict(districtCode);
      final Map<String, dynamic> data = req.data;
      if (req.response.statusCode == StatusCode.success) {
        return Right(AddressDetailList.fromJson(data));
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
