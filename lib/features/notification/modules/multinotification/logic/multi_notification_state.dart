part of 'multi_notification_cubit.dart';

enum _MultiNotificationStatus { initial, loading, loaded, error }

class MultiNotificationState extends CubitErrorState {
  final PaginationResult<NotificationModel> _result;
  final _MultiNotificationStatus _status;

  MultiNotificationState({
    required PaginationResult<NotificationModel> result,
    _MultiNotificationStatus status =
        _MultiNotificationStatus.initial,
    String? error,
  }) : _result = result,
       _status = status,
       super(error);

  bool get isLoading => _status == _MultiNotificationStatus.loading;

  factory MultiNotificationState.initial() => MultiNotificationState(
    result: PaginationResult<NotificationModel>(),
  );

  MultiNotificationState _loading() =>
      _copyWith(status: _MultiNotificationStatus.loading);

  MultiNotificationState _loaded(
    PaginationResult<NotificationModel> result,
  ) => _copyWith(
    status: _MultiNotificationStatus.loaded,
    result: _result.addAll(result),
  );

  MultiNotificationState _error(String error) =>
      _copyWith(status: _MultiNotificationStatus.error, error: error);

  MultiNotificationState _copyWith({
    PaginationResult<NotificationModel>? result,
    _MultiNotificationStatus? status,
    String? error,
  }) {
    return MultiNotificationState(
      result: result ?? _result,
      status: status ?? _status,
      error: error,
    );
  }
}
