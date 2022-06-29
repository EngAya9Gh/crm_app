//
//
//
//
// import 'package:crm_smart/model/regoin_model.dart';
// import 'package:crm_smart/ui/widgets/combox_widget/levelcombox.dart';
// import 'package:crm_smart/view_model/country_vm.dart';
// import 'package:crm_smart/view_model/regoin_vm.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// class RegoinCombox extends StatefulWidget {
//   RegoinCombox({Key? key,this.onChanged,this.selected}) : super(key: key);
//   String? selected=null;
//   Function(String?)? onChanged;
//
//   @override
//   _RegoinComboxState createState() => _RegoinComboxState();
// }
//
// class _RegoinComboxState extends State<RegoinCombox> {
//
//   List<RegoinModel> _list=[];
//   @override
//   void initState()  {
//
//    WidgetsBinding.instance?.addPostFrameCallback((_) {
//      //Provider.of<regoin_vm>(context,listen: false).clearvalues();
//       //Provider.of<country_vm>(context,listen: false).ge
//
//       String id_country=Provider.of<country_vm>(context,listen: false)
//           .id_country;
//
//       Provider.of<regoin_vm>(context,listen: false)
//           .getregoin(id_country);
//      // Provider.of<regoin_vm>(context,listen: false).listregoin;
//
//       Provider.of<regoin_vm>(context,listen: false)
//           .changeVal(widget.selected);
//       print("init regoin combox///////");
//       print(widget.selected);
//     });
//     super.initState();
//
//   }
//   @override
//   Widget build(BuildContext context) {
//
//     return
//         Padding(
//           padding: const EdgeInsets.all(10),
//           child:citycombo(context)
//             //   (data !=null)?
//             //   ( (data as  List<RegoinModel>).isEmpty ? Text("لا يوجد مناطق")
//             //       :  citycombo(context))
//             //
//             // :Text("error")
//
//
//     );
//   }
//
//  Widget  citycombo(context){
//   List<RegoinModel> regoinllist=[];
//   regoinllist= Provider.of<regoin_vm>(context,listen: true).listregoin;
//   print("build regoin combox"+regoinllist.length.toString());
//
//   WidgetsBinding.instance?.addPostFrameCallback((_) {
//
//  });
//   print("build after regoin combox"+regoinllist.length.toString());
//
//   //  return  Consumer<regoin_vm>(
//   //      builder: (context,regoinllist,child){
//          //regoinllist=  context.read<regoin_vm>();
//      if(regoinllist.isEmpty)
//        return  Text("لا يوجد بيانات");
//      else{
//    return Container(
//      child:DropdownButton(
//        isExpanded: true,
//        hint: Text("حددالمنطقة"),
//        items: regoinllist.map((level_one){
//          return DropdownMenuItem(
//
//            child: Text(level_one.name_regoin), //label of item
//            value: level_one.id.toString(), //value of item
//          );
//        }).toList(),
//        value:Provider.of<regoin_vm>(context,listen: false)
//            .selectedValueLevel,//select_dataItem!.idCountry ,
//
//        onChanged:(value){
//          Provider.of<regoin_vm>(context,listen: false)
//              .changeVal(value.toString());
//        },
//      ),
//
//
//    );}
//       // });
//    //return Text("error");
//  }
// }