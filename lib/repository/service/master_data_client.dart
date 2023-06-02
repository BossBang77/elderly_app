import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
part 'master_data_client.g.dart';

@RestApi(baseUrl: '')
abstract class MasterDataService {
  factory MasterDataService(Dio dio) = _MasterDataService;

  @GET('/api/v1/common/master/{category}')
  @Headers(<String, dynamic>{
    "Accept": "application/json",
    "Content-Type": "application/json",
  })
  Future<HttpResponse> getMasterData(@Path() String category);
}
