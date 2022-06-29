


import 'package:crm_smart/model/privilgemodel.dart';
import 'package:crm_smart/ui/widgets/container_boxShadows.dart';
import 'package:crm_smart/ui/widgets/custom_widget/row_edit.dart';
import 'package:crm_smart/view_model/privilge_vm.dart';
import 'package:crm_smart/view_model/regoin_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:grouped_list/grouped_list.dart';
import '../../../constants.dart';

class privilge_page extends StatefulWidget {
   privilge_page({required this.namelevel, required this.fk_level,Key? key}) : super(key: key);
String fk_level;
String namelevel;
  @override
  _privilge_pageState createState() => _privilge_pageState();
}

class _privilge_pageState extends State<privilge_page> {
  List _elements = [
    {'name': 'John', 'group': 'Team A'},
    {'name': 'Will', 'group': 'Team B'},
    {'name': 'Beth', 'group': 'Team A'},
    {'name': 'Miranda', 'group': 'Team B'},
    {'name': 'Mike', 'group': 'Team C'},
    {'name': 'Danny', 'group': 'Team C'},
  ];
  @override void initState() {
    Provider.of<privilge_vm>(context,listen: false)
        .getPrivilgepage(widget.fk_level);
    super.initState();
  }
  @override void didChangeDependencies() {


    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    List<PrivilgeModel> _privilgelist =Provider.of<privilge_vm>
      (context,listen: true)
        .privilgelistpage;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.namelevel.toString()),
        centerTitle: true,
        actions: [

          IconButton(
              onPressed: (){
                for(int i=0;i< Provider.of<privilge_vm>(context,listen: false)
                .privilgelistpage.length;i++){
                  Provider.of<privilge_vm>(context,listen: false)
                      .updatepriv_vm(
                      Provider.of<privilge_vm>(context,listen: false)
                      .privilgelistpage[i].idPrivgUser,
                      Provider.of<privilge_vm>(context,listen: false)
                          .privilgelistpage[i].isCheck);
                }

                Navigator.pop(context);

              }, icon:Icon( Icons.check_rounded,color: kWhiteColor,)),
        ],
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          // StickyGroupedListView<CustomObject, DateTime>(
          //   elements: pedidos,
          //   order: StickyGroupedListOrder.ASC,
          //   groupBy: (CustomObject element) => DateTime(
          //       element.dateGroup.year,
          //       element.dateGroup.month,
          //       element.dateGroup.day),
          //   groupSeparatorBuilder: (CustomObject element) =>
          //       renderDataCabecalho(element),
          //   itemBuilder: (context, element) {
          //     return _buildPedidoItemView(element, context);
          //   },
          // ),
          padding: const EdgeInsets.all(16.0),
          child:GroupedListView<PrivilgeModel, String>(
            elements:  _privilgelist,
            groupBy: (element) {
              switch(element.type_prv)
              {
                case 'sales':
                  return 'المبيعات';

                case 'manage':
                  return 'الإدارة';

                case 'care':
                  return 'العناية بالعملاء';

                case 'support':
                  return 'الدعم الفني';

               case 'market':
                  return 'التسويق الالكتروني';

               case 'other':
                  return 'آخرى';

               case 'notify':
                  return 'الإشعارات';


              }
              return '';
              },
            groupComparator: (value1, value2) =>
                value2.compareTo(value1),
            itemComparator: (item1, item2) =>
                item1.periorty.compareTo(item2.periorty),
             order: GroupedListOrder.ASC,
            useStickyGroupSeparators: true,
            groupSeparatorBuilder: (String value) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                value,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            itemBuilder: (c, element) {
              return Container(
                 //children: _privilgelist.map(( key) {
                   child:
                   CheckboxListTile(
                     title: new Text(element.name_privilege),
                     value:   element.isCheck=='1'?true:false,// as bool,
                     onChanged: (bool? value) {
                       setState(() {
                         print(value);
                         value ==true?
                         element.isCheck="1": element.isCheck="0";
                         //values[key] = value;
                       });
                      },
                   ));
              //   Card(
              //   elevation: 8.0,
              //   margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
              //   child: Container(
              //     child: ListTile(
              //       contentPadding:
              //       EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              //       leading: Icon(Icons.account_circle),
              //       title: Text(element['name']),
              //       trailing: Icon(Icons.arrow_forward),
              //     ),
              //   ),
              // );
            },
          ),

        ),
      ),
    );
  }
}
