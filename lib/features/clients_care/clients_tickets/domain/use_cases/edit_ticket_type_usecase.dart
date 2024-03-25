import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/use_case/use_case.dart';
import '../../data/models/TicketModel.dart';
import '../repositories/tickets_repo.dart';

@lazySingleton
class EditTicketTypeUseCase
    extends UseCase<Either<String, TicketModel>, EditTicketTypeParams> {
  EditTicketTypeUseCase(this._repository);

  final TicketsRepo _repository;

  @override
  Future<Either<String, TicketModel>> call(EditTicketTypeParams params) async {
    return await _repository.editTicketType(params);
  }
}

class EditTicketTypeParams {
  final String idTicket;
  final String typeTicket;
  final String notes;
  final String? notesRate;
  final String? rate;
  final String? notesTicket;
  final String? categoriesTicketFk;
  final String? subcategoriesTicket;

  EditTicketTypeParams({
    required this.idTicket,
    required this.typeTicket,
    required this.notes,
    this.notesRate,
    this.rate,
    this.notesTicket,
    this.categoriesTicketFk,
    this.subcategoriesTicket,
  });

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "id_ticket": idTicket,
      "type_ticket": typeTicket,
      "notes": notes,
    };

    if (notesRate != null) {
      map["notes_rate"] = notesRate;
    }
    if (rate != null) {
      map["rate"] = rate;
    }
    if (notesTicket != null) {
      map["notes_ticket"] = notesTicket;
    }
    if (categoriesTicketFk != null) {
      map["categories_ticket_fk"] = categoriesTicketFk;
    }
    if (subcategoriesTicket != null) {
      map["subcategories_ticket"] = subcategoriesTicket;
    }

    return map;
  }
}
