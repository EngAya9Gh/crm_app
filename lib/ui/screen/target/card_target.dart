import 'package:crm_smart/constants.dart';
import 'package:crm_smart/model/targetmodel.dart';
import 'package:crm_smart/ui/screen/target/target_data.dart';
import 'package:crm_smart/ui/screen/user/userview.dart';
import 'package:crm_smart/ui/widgets/container_boxShadows.dart';
import 'package:crm_smart/view_model/all_user_vm.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as rt;
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get.dart';
// import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'dart:ui' as myui;
import 'buildCardTarget.dart';


class CardTaget extends StatefulWidget {
  CardTaget({Key? key}) : super(key: key);

  @override
  _CardTagetState createState() => _CardTagetState();
}

class _CardTagetState extends State<CardTaget> {
  List<TargetModel> list_target=[];
  @override
  void initState() {
    super.initState();
  }
  DateTime _currentDate = DateTime(1,1,1);//DateTime.now();
  Future<void> _selectDate(BuildContext context, DateTime currentDate) async {

    final DateFormat formatter = DateFormat('yyyy-MM-dd');

    String output = formatter.format(currentDate);

    // final DateTime? pickedDate = await showDatePicker(
    //   initialEntryMode: DatePickerEntryMode.calendar ,
    //
    //     context: context,
    //     currentDate: currentDate,
    //     initialDate: currentDate,
    //     initialDatePickerMode: DatePickerMode.year,
    //     firstDate: DateTime(2015),
    //     lastDate: DateTime(2080));
    //if (pickedDate != null )//&& pickedDate != currentDate)
    //   setState(() {
    //     _currentDate = pickedDate;});
    // Provider.of<datetime_vm>(context,listen: false)
    //     .setdatetimevalue(_currentDate);
    // });
    // final selected = await showMonthYearPicker(
    //   context: context,
    //   initialDate: DateTime.now(),
    //   firstDate: DateTime(2019),
    //   lastDate: DateTime(2022),
    // );
    // SfDateRangePicker(
    //   onSelectionChanged: _onSelectionChanged,
    //   selectionMode: DateRangePickerSelectionMode.range,
    //   initialSelectedRange: PickerDateRange(
    //       DateTime.now().subtract(const Duration(days: 4)),
    //       DateTime.now().add(const Duration(days: 3))),
    // );
    await YearPicker(
    firstDate: DateTime(DateTime.now().year - 100, 1),
    lastDate: DateTime(DateTime.now().year + 100, 1),
    initialDate: DateTime.now(),
    // save the selected date to _selectedDate DateTime variable.
    // It's used to set the previous selected date when
    // re-showing the dialog.
    selectedDate: _currentDate,
    onChanged: (DateTime dateTime) {
    // close the dialog when year is selected.
   setState(() {
     _currentDate=dateTime;
   });
    // Do something with the dateTime selected.
    // Remember that you need to use dateTime.year to get the year
    },
    );
  }
  @override
  Widget build(BuildContext context) {

    // final controllerUsers =
    //     Provider.of<user_vm_provider>(context, listen: true);
    // list_target=targetdata.gettarget({'':''});
    //return Obx( () {
    // if (list_target.length == 0) {
    //   return Consumer<user_vm_provider>(builder: (context, cart, child) {
    //     return const Center(
    //       child: Text('لا يوجد بيانات'),
    //       // CircularProgressIndicator(
    //       //   color: kMainColor,
    //       // ),
    //     );
    //   });
    // } else {
      return SafeArea(
        child: ListView(
          children: [
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.date_range,
                  color: kMainColor,
                ),
                hintStyle: const TextStyle(
                    color: Colors.black45,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
                hintText:_currentDate!=DateTime(1,1,1)?
                _currentDate.toString():'year', //_invoice!.dateinstall_task.toString(),
                filled: true,
                fillColor: Colors.grey.shade200,
              ),
              readOnly: true,
              onTap: () {
                _selectDate(context, DateTime.now());
              },
            ),
        ElevatedButton(
        style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
            kMainColor)),
          onPressed: () async{
            list_target=await targetdata.gettarget({
              'date':'date',
              'datefrom':'2020/2/1',
              'dateto':'2023/9/9'
            });
        }, child: Text('test from to'),
        ),
            ElevatedButton(
        style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
            kMainColor)),
          onPressed: () async{
            DateTime d1=DateTime(_currentDate.year,1,1);//1
            DateTime d11=DateTime(_currentDate.year,3,31);//1

            DateTime d2=DateTime(_currentDate.year,4,1);//2
            DateTime d22=DateTime(_currentDate.year,6,30);//2

            DateTime d3=DateTime(_currentDate.year,7,1);//3
            DateTime d33=DateTime(_currentDate.year,9,30);//3

            DateTime d4=DateTime(_currentDate.year,10,1);//4
            DateTime d44=DateTime(_currentDate.year,12,31);//4

            list_target=await targetdata.gettarget({
              'Q':'Q',
              'd1':d1.toString(),
              'd11':d11.toString(),

              'd2':d2.toString(),
              'd22':d22.toString(),

              'd3':d3.toString(),
              'd33':d33.toString(),

              'd4':d4.toString(),
              'd44':d44.toString(),
            });
        }, child: Text('test Q'),
        ),
            Directionality(
              textDirection: myui.TextDirection.rtl,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.6,
                child: Padding(
                  padding:
                      EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.03),
                  child: GridView.builder(
                      itemCount: list_target.length,
                      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                        childAspectRatio: 0.9,
                        mainAxisExtent: 170,
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 1.0,
                        maxCrossAxisExtent: 250,
                      ),
                      itemBuilder: (context, index) {
                        return Consumer<user_vm_provider>(
                            builder: (context, cart, child) {
                          return buildCardTarget(
                          target: list_target[index],
                          );
                        });
                      }),
                  // child: ListView.separated(
                  //   itemCount: controllerUsers.userall.length,
                  //   itemBuilder: (context, index) {
                  //     return Consumer<user_vm_provider>(
                  //         builder: (context, cart, child) {
                  //       return buildCardTarget(
                  //         usermodell: controllerUsers.userall[index],
                  //       );
                  //     });
                  //   },
                  //   separatorBuilder: (context, index) {
                  //     return Padding(
                  //       padding: EdgeInsets.only(right: 65, left: 20, bottom: 5),
                  //       child: Divider(
                  //         color: Colors.black12,
                  //         thickness: 1,
                  //       ),
                  //     );
                  //   },
                  // ),
                ),
              ),
            ),
          ],
        ),
      );
  //  }
    //   },
    // );
  }
}
