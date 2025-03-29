import 'package:flutter_bloc/flutter_bloc.dart';

part 'multi_notification_state.dart';

class MultiNotificationCubit extends Cubit<MultiNotificationState> {
  MultiNotificationCubit() : super(MultiNotificationState.initial());
}
