import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../constants.dart';

class dailyEmployeePage extends StatefulWidget {
    dailyEmployeePage({Key? key}) : super(key: key);

  @override
  State<dailyEmployeePage> createState() => _dailyEmployeePageState();
}

class _dailyEmployeePageState extends State<dailyEmployeePage> {
    DateTime _selectedDatefrom = DateTime.now();

    DateTime _selectedDateto = DateTime.now();

  Future<void> _selectDatefrom(BuildContext context, DateTime currentDate) async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        currentDate: currentDate,
        initialDate: currentDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(3010));
    if (pickedDate != null)
      setState(() {
        // Navigator.pop(context);
        _selectedDatefrom = pickedDate;
        print('_selectedDatefrom ' + _selectedDatefrom.toString());
        print('_selectedDateto ' + _selectedDateto.toString());
        // if(_selectedDateto!=DateTime(1, 1, 1)&&_selectedDatefrom!=DateTime(1, 1, 1))
        // Provider.of<AgentsCollaboratorsInvoicesViewmodel>(context, listen: false)
        //     .onChange_date(_selectedDatefrom, _selectedDateto);
      });
  }

  Future<void> _selectDateto(BuildContext context, DateTime currentDate) async {
    DateTime? pickedDate = await showDatePicker(
      // initialEntryMode: DatePickerEntryMode.calendarOnly,
      // initialDatePickerMode: DatePickerMode.year,
        context: context,
        currentDate: currentDate,
        initialDate: currentDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(3010));
    if (pickedDate != null)
      setState(() {
        // Navigator.pop(context);
        _selectedDateto = pickedDate;
        print('_selectedDateto ' + _selectedDateto.toString());
        // if(_selectedDateto!=DateTime(1, 1, 1)&&_selectedDatefrom!=DateTime(1, 1, 1))
        // Provider.of<AgentsCollaboratorsInvoicesViewmodel>(context, listen: false)
        //     .onChange_date(_selectedDatefrom, _selectedDateto);
      });
  }

  @override
  Widget build(BuildContext context) {
    return     Row(
      children: [
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('from'),
              TextFormField(
                validator: (value) {
                  if (_selectedDatefrom == DateTime(1, 1, 1)) {
                    return 'يرجى تعيين التاريخ ';
                  }
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.date_range,
                    color: kMainColor,
                  ),
                  hintStyle: const TextStyle(color: Colors.black45, fontSize: 16, fontWeight: FontWeight.w500),
                  hintText: _selectedDatefrom == DateTime(1, 1, 1)
                      ? 'from' //_currentDate.toString()
                      : DateFormat('yyyy-MM-dd').format(_selectedDatefrom),
                  //_invoice!.dateinstall_task.toString(),
                  filled: true,
                  fillColor: Colors.grey.shade200,
                ),
                readOnly: true,
                onTap: () {
                  setState(() {
                    _selectDatefrom(context, DateTime.now());

                    // viewmodel.onChange_date( _selectedDatefrom,_selectedDateto);
                  });

                  // _selectDate(context, DateTime.now());
                },
              ),
            ],
          ),
        ),
        Flexible(
          child: Column(
            children: [
              Text('to'),
              TextFormField(
                validator: (value) {
                  if (_selectedDateto == DateTime(1, 1, 1)) {
                    return 'يرجى تعيين التاريخ ';
                  }
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.date_range,
                    color: kMainColor,
                  ),
                  hintStyle: const TextStyle(color: Colors.black45, fontSize: 16, fontWeight: FontWeight.w500),
                  hintText: _selectedDateto == DateTime(1, 1, 1)
                      ? 'to' //_currentDate.toString()
                      : DateFormat('yyyy-MM-dd').format(_selectedDateto),
                  //_invoice!.dateinstall_task.toString(),
                  filled: true,
                  fillColor: Colors.grey.shade200,
                ),
                readOnly: true,
                onTap: () {
                  setState(() {
                    _selectDateto(context, DateTime.now());
                    // viewmodel.onChange_date( _selectedDatefrom,_selectedDateto);
                  });
                  // if(_selectedDateto!=DateTime(1, 1, 1)&&_selectedDatefrom!=DateTime(1, 1, 1))
                  //   getData();
                  // _selectDate(context, DateTime.now());
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
