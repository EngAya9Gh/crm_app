import 'dart:ui';

import 'package:crm_smart/model/calendar/event.dart';

import 'package:crm_smart/ui/widgets/widgetcalendar/utils.dart';
import 'package:crm_smart/view_model/event_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EventEditingPage extends StatefulWidget {
  final Event? event;
  const EventEditingPage({this.event, Key? key}) : super(key: key);

  @override
  State<EventEditingPage> createState() => _EventEditingPAgeState();
}

class _EventEditingPAgeState extends State<EventEditingPage> {
  final _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  late DateTime fromDate;
  late DateTime toDate;
  @override
  void initState() {
    super.initState();
    if (widget.event == null) {
      fromDate = DateTime.now();
      toDate = DateTime.now().add(Duration(hours: 2));
    } else {
      final event = widget.event;
      titleController.text = event!.title;
      fromDate = event.from;
      toDate = event.to;
    }
  }

  @override
  void dispose() {
    titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        leading: CloseButton(),
        actions: buildEditingActions(),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              buildTitle(),
              SizedBox(
                height: 12,
              ),
              buildDateTimePickers(),
            ],
          ),
        ),
      ));

  List<Widget> buildEditingActions() => [
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            primary: Colors.transparent,
            shadowColor: Colors.transparent,
          ),
          onPressed: saveForm,
          icon: Icon(Icons.done),
          label: Text('SAVE'),
        )
      ];
  Widget buildTitle() => TextFormField(
        style: TextStyle(fontSize: 24),
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          hintText: 'Add Title',
        ),
        onFieldSubmitted: (_) {
          saveForm();
        },
        controller: titleController,
        validator: (title) =>
            title != null && title.isEmpty ? 'Title cannot be empty' : null,
      );

  Widget buildDateTimePickers() => Column(
        children: [
          buildForm(),
          buildTo(),
        ],
      );
  Widget buildForm() => buildHeader(
        header: 'FROM',
        child: Row(
          children: [
            //for date
            Expanded(
                flex: 2,
                child: buildDropdownField(
                  text: Utils.toDate(fromDate),
                  onClicked: () {
                    pickFromDateTime(pickDate: true);
                  },
                )),
            // for time
            Expanded(
                child: buildDropdownField(
              text: Utils.toTime(fromDate),
              onClicked: () {
                pickFromDateTime(pickDate: false);
              },
            )),
          ],
        ),
      );
  Widget buildTo() => buildHeader(
        header: 'TO',
        child: Row(
          children: [
            //for date
            Expanded(
                flex: 2,
                child: buildDropdownField(
                  text: Utils.toDate(toDate),
                  onClicked: () {
                    pickToDateTime(pickDate: true);
                  },
                )),
            // for time
            Expanded(
                child: buildDropdownField(
              text: Utils.toTime(toDate),
              onClicked: () {
                pickToDateTime(pickDate: false);
              },
            )),
          ],
        ),
      );
  Future pickFromDateTime({required bool pickDate}) async {
    final date = await pickDateTime(
      context,
      fromDate,
      pickDate: pickDate,
    );
    if (date == null) return;
    if (date.isAfter((toDate))) {
      toDate = DateTime(
        date.year,
        date.month,
        date.day,
        toDate.hour,
        toDate.minute,
      );
    }
    setState(() {
      fromDate = date;
      print('nnnnn');
      print(fromDate);
    });
  }

  Future pickToDateTime({required bool pickDate}) async {
    final date = await pickDateTime(
      context,
      toDate,
      pickDate: pickDate,
      //من شان التاريخ الثاني مانثدر نحطو قبل الاول
      firstDate: pickDate ? fromDate : null,
    );
    if (date == null) return;

    setState(() {
      toDate = date;
    });
  }

  Future<DateTime?> pickDateTime(
    context,
    DateTime initialDate, {
    required bool pickDate,
    DateTime? firstDate,
  }) async {
    if (pickDate) {
      final date = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: firstDate ?? DateTime(2015, 8),
        lastDate: DateTime(2101),
      );
      if (date == null) {
        return null;
      }
      final time = Duration(
        hours: initialDate.hour,
        minutes: initialDate.minute,
      );

      return date.add(time);
    } else {
      final timeOfDay = await showTimePicker(
          context: context, initialTime: TimeOfDay.fromDateTime(initialDate));

      if (timeOfDay == null) {
        return null;
      }
      final date =
          DateTime(initialDate.year, initialDate.month, initialDate.day);

      final time = Duration(hours: timeOfDay.hour, minutes: timeOfDay.minute);
      return date.add(time);
    }
  }

  Widget buildDropdownField({
    required String text,
    required VoidCallback onClicked,
  }) =>
      ListTile(
        title: Text(text),
        trailing: Icon(Icons.arrow_drop_down),
        onTap: onClicked,
      );

  Widget buildHeader({
    required String header,
    required Widget child,
  }) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            header,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          child
        ],
      );
  Future saveForm() async {
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      final event = Event(
          title: titleController.text,
          from: fromDate,
          to: toDate,
          description: 'description',
          isAllDay: false, fkIdClient: '', idinvoice: '');
      //for edit
      final isEditing = widget.event != null;

      final provider = Provider.of<EventProvider>(context, listen: false);
      if (isEditing) {
        provider.editEvent(event, widget.event!);
        Navigator.of(context).pop();
      } else {
        provider.addEvents(event);
      }
      Navigator.of(context).pop();
    }
  }
}
