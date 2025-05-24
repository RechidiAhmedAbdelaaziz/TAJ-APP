import 'package:taj_elsafa/core/di/locator.dart';
import 'package:taj_elsafa/core/network/repo_base.dart';
import 'package:injectable/injectable.dart';
import 'package:taj_elsafa/core/network/types/pagination_result.dart';
import 'package:taj_elsafa/features/auth/configs/auth_cache.dart';
import 'package:taj_elsafa/features/ticket/data/dto/ticket_dto.dart';
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

      onResult:
          (response) => PaginationResult.fromResponse(
            response: response,
            fromJson: TicketModel.fromJson,
          ),
    );
  }

  RepoResult<TicketModel> createTicket(CreateTicketDto dto) {
    return tryApiCall(
      apiCall: () async => _ticketApi.createTicket(await dto.toMap()),

      onResult: (response) => TicketModel.fromJson(response.data!),
    );
  }
}
