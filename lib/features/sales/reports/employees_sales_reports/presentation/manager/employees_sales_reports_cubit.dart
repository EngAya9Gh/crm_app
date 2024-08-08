import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/models/page_state/bloc_status.dart';
import '../../../../../../model/usermodel.dart';
import '../../domain/entities/employees_sales_reports_page_variables_entity.dart';
import '../../domain/entities/filter_employees_sales_reports_entity.dart';
import '../../domain/use_cases/get_employees_sales_reports_usecase.dart';

part 'employees_sales_reports_state.dart';

@injectable
class EmployeesSalesReportsCubit extends Cubit<EmployeesSalesReportsState> {
  final GetEmployeesSalesReportsUsecase _getEmployeesSalesReportsUsecase;

  EmployeesSalesReportsCubit(
    this._getEmployeesSalesReportsUsecase,
  ) : super(EmployeesSalesReportsState());

  EmployeesSalesReportsPageVariablesEntity pageVariables =
      EmployeesSalesReportsPageVariablesEntity();
  FilterEmployeesSalesReportsEntity filterEntity =
      FilterEmployeesSalesReportsEntity();

  void init() {
    pageVariables = EmployeesSalesReportsPageVariablesEntity();
    filterEntity = FilterEmployeesSalesReportsEntity();
  }

  Future<void> getEmployeesSalesReports({
    required UserModel user,
  }) async {
    if (state.getEmployeesSalesReportsStatus.isLoading()) return;
    _clear();
    emit(state.copyWith(getEmployeesSalesReportsStatus: BlocStatus.loading()));
    filterEntity.savePreviousState();
    final result = await _getEmployeesSalesReportsUsecase(
      GetEmployeesSalesReportsParams(
        fkCountry: user.fkCountry ?? '1',
        idRegion: user.fkRegoin,
        idUser: user.idUser,
        type: filterEntity.reportTypeNotifier.value,
        typeProduct: filterEntity.productTypeNotifier.value,
        isMarketing: filterEntity.isMarketingNotifier.value,
        dateFrom: filterEntity.dateFromController.text,
        dateTo: filterEntity.dateToController.text,
      ),
    );
    result.fold(
      (e) => emit(state.copyWith(
        getEmployeesSalesReportsStatus: BlocStatus.fail(error: e),
      )),
      (value) {
        pageVariables.allList.addAll(value.data);
        pageVariables.totalValue = pageVariables.allList
            .fold(0, (previousValue, element) => previousValue + element.y);

        if (value.data.isEmpty) {
          return emit(state.copyWith(
            getEmployeesSalesReportsStatus: BlocStatus.empty(),
          ));
        }
        emit(state.copyWith(
          getEmployeesSalesReportsStatus: BlocStatus.success(),
        ));
      },
    );
  }

  // for (int i = 0; i < data.length; i++) {
  //         allList.add(BarModel.fromJson(data[i]));
  //
  //         totalval += allList[i].y;
  //         rowsdata.add(DataRow(
  //           cells: <DataCell>[
  //             DataCell(SizedBox(
  //               width: 15.0,
  //               height: 15.0,
  //               child: DecoratedBox(
  //                 decoration: BoxDecoration(color: allList[i].colorval),
  //               ),
  //             )),
  //             //Text('allList[i].colorval')),
  //             DataCell(TextUtilis(
  //               color: Colors.black,
  //               fontSize: 25,
  //               fontWeight: FontWeight.normal,
  //               textstring: getnameshort(allList[i].x),
  //               underline: TextDecoration.none,
  //             )),
  //             DataCell(TextUtilis(
  //               color: Colors.black,
  //               fontSize: 25,
  //               fontWeight: FontWeight.normal,
  //               textstring: formatNumber(allList[i].y),
  //               underline: TextDecoration.none,
  //             )),
  //             DataCell(TextUtilis(
  //               color: Colors.black,
  //               fontSize: 25,
  //               fontWeight: FontWeight.normal,
  //               textstring: allList[i].countclient.toString(),
  //               underline: TextDecoration.none,
  //             )),
  //           ],
  //         ));
  //         // allListclient.add(BarModel.fromJson(data[i]));
  //       }
  //     }
  _prepareTableRows() {
    pageVariables.dataRows.clear();
    // for (int i = 0; i < pageVariables.allList.length; i++) {
    //   pageVariables.dataRows.add(DataRow(
    //     cells: <DataCell>[
    //       DataCell(SizedBox(
    //         width: 15.0,
    //         height: 15.0,
    //         child: DecoratedBox(
    //           decoration: BoxDecoration(color: pageVariables.allList[i].colorval),
    //         ),
    //       )),
    //       DataCell(Text(
    //         pageVariables.allList[i].x,
    //         style: TextStyle(
    //           color: Colors.black,
    //           fontSize: 25,
    //           fontWeight: FontWeight.normal,
    //         ),
    //       )),
    //       DataCell(Text(
    //         pageVariables.allList[i].y.toString(),
    //         style: TextStyle(
    //           color: Colors.black,
    //           fontSize: 25,
    //           fontWeight: FontWeight.normal,
    //         ),
    //       )),
    //       DataCell(Text(
    //         pageVariables.allList[i].countclient.toString(),
    //         style: TextStyle(
    //           color: Colors.black,
    //           fontSize: 25,
    //           fontWeight: FontWeight.normal,
    //         ),
    //       )),
    //     ],
    //   ));
    // }
  }

  void _clear() {
    pageVariables.allList.clear();
    pageVariables.totalValue = 0;
    pageVariables.dataRows.clear();
  }

  void returnToPreviousState() {
    filterEntity = filterEntity.returnToPreviousState;
  }
}
