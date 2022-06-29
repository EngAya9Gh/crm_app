import 'package:crm_smart/constants.dart';
import 'package:crm_smart/ui/screen/calendar/Event_editing_page.dart';
import 'package:crm_smart/ui/widgets/widgetcalendar/calendar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Calendar extends StatelessWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendar'),
        centerTitle: true,
        backgroundColor: kMainColor,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [

            CalendarWidget(),
          ],
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: kMainColor,
      //   onPressed: () {
      //     Navigator.push(context, MaterialPageRoute(
      //         builder: (context)=>
      //             EventEditingPage()));
      //     //Get.to(EventEditingPage());
      //   },
      //   tooltip: 'إضافة تقويم',
      //   child: Icon(Icons.add),
      // ),
    );
  }
}
