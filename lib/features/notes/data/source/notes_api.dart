
import 'package:dio/dio.dart';
import 'package:taj_elsafa/core/network/models/api_response.model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:injectable/injectable.dart';

part 'notes_api.g.dart';


@RestApi()
@lazySingleton
abstract class NotesApi {
    @factoryMethod
  factory NotesApi(
    Dio dio
    
) = _NotesApi;
}
