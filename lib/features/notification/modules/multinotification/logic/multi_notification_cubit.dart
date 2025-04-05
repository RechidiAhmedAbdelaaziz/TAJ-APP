import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taj_elsafa/core/di/locator.dart';
import 'package:taj_elsafa/core/network/types/pagination_result.dart';
import 'package:taj_elsafa/core/types/cubitstate/error.state.dart';
import 'package:taj_elsafa/features/notification/data/models/notification_model.dart';
import 'package:taj_elsafa/features/notification/data/repository/notification_repository.dart';

part 'multi_notification_state.dart';

class MultiNotificationCubit extends Cubit<MultiNotificationState> {
  final _repo = locator<NotificationRepo>();

  MultiNotificationCubit() : super(MultiNotificationState.initial());

  List<NotificationModel> get notifications => state._result.data;

  void getNotifications() async {
    emit(state._loading());

    final result = await _repo.getNotifications();

    result.when(
      success: (response) => emit(state._loaded(response)),
      error: (error) => emit(state._error(error.message)),
    );
  }
}
