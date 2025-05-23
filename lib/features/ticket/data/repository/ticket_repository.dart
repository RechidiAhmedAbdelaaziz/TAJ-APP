import 'package:taj_elsafa/core/di/locator.dart';
import 'package:taj_elsafa/core/network/repo_base.dart';
import 'package:injectable/injectable.dart';
import 'package:taj_elsafa/core/network/types/pagination_result.dart';
import 'package:taj_elsafa/features/auth/configs/auth_cache.dart';
import 'package:taj_elsafa/features/ticket/data/dto/tickets_filter.dart';

import '../models/ticket_model.dart';
import '../source/ticket_api.dart';
import '../source/ticket_cache.dart';

@lazySingleton
class TicketRepo extends NetworkRepository {
  final _ticketApi = locator<TicketApi>();
  final _ticketCache = locator<TicketCache>();

  RepoListResult<TicketModel> getTickets(TicketsFilterDTO filter) {
    return tryApiCall(
      apiCall:
          () => _ticketApi.getTickets(
            userId: locator<AuthCache>().user!.id!,
          ),

      localApiCall:
          () => _ticketCache.getTicket(stateId: filter.stateId),

      onResult:
          (response) => PaginationResult.fromResponse(
            response: response,
            fromJson: TicketModel.fromJson,
          ),
    );
  }
}
