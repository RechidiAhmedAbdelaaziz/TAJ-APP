part of 'dio_interceptors.dart';

class _AuthTokenInterceptor extends InterceptorsWrapper {
  // final authCacheHelper = locator<AuthCache>();
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async { //TODO implement the auth token interceptor
    // final accessToken = await authCacheHelper.accessToken;

    // if (accessToken != null) {
    //   options.headers['Authorization'] = 'Bearer $accessToken';
    //   return handler.next(options);
    // }

    super.onRequest(options, handler);
  }

  _AuthTokenInterceptor._();
}
