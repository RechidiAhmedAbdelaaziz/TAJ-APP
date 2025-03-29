part of 'router.dart';

abstract class AppNavigatorBase {
  final String _path;
  final Map<String, String> pathParams;
  final Map<String, String> queryParams;

  AppNavigatorBase({
    required String path,
    this.pathParams = const {},
    this.queryParams = const {},
  }) : _path = path;

  // The path of the route. (contains the path parameters and query parameters)
  // the path parameters are in the path as {key} should be replaced with the value
  // the query parameters are in the query string as ?key=value
  String get path =>
      _path.replaceAllMapped(
        RegExp(r'{(\w+)}'),
        (match) => pathParams[match.group(1)!] ?? '',
      ) +
      (queryParams.isNotEmpty
          ? '?${queryParams.entries.map((e) => '${e.key}=${e.value}').join('&')}'
          : '');
}
