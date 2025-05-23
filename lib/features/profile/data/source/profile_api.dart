import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:injectable/injectable.dart';
import 'package:taj_elsafa/core/network/models/api_response.model.dart';

part 'profile_api.g.dart';

@RestApi()
@lazySingleton
abstract class ProfileApi {
  @factoryMethod
  factory ProfileApi(Dio dio) = _ProfileApi;

  @GET('/api/v1/customer_info')
  Future<DataApiResponse> getProfile({
    @Query('user_id') required int userId,
  });

  @PUT('api/v1/update_profile')
  Future<DataApiResponse> updateProfile(
    @Body() Map<String, dynamic> body,
  );

  @POST('/api/v1/change_password')
  Future<MessageResponse> changePassword(
    @Body() Map<String, dynamic> body,
  );
}
