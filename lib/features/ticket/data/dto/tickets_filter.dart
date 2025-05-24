import 'package:taj_elsafa/core/di/locator.dart';
import 'package:taj_elsafa/core/shared/classes/editioncontollers/generic_editingcontroller.dart';
import 'package:taj_elsafa/features/auth/configs/auth_cache.dart';
import 'package:taj_elsafa/features/realstates/data/models/real_state_model.dart';

class TicketsFilterDTO {
  final status = EditingController<String>();
  final stateController = EditingController<RealStateModel>();

  TicketsFilterDTO();

  String get stateId => stateController.value?.id ?? '';

  Map<String, dynamic> toJson() {
    return {
      'status': status.value,
      'user_id': locator<AuthCache>().user!.id,
    };
  }
}
