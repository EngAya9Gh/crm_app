import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'dates_table_state.dart';

class DatesTableCubit extends Cubit<DatesTableState> {
  DatesTableCubit() : super(DatesTableInitial());
}
