//
//
// import 'package:crm_smart/model/levelmodel.dart';
// import 'package:crm_smart/provider/loadingprovider.dart';
// import 'package:crm_smart/view_model/level_vm.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import '../../../features/manage_privilege/presentation/manager/privilege_cubit.dart';
// import '../../../view_model/user_vm_provider.dart';
//
// class levelCombox extends StatefulWidget {
//    levelCombox({Key? key,this.onChanged,this.selected}) : super(key: key);
//    String? selected=null;
//    Function(String?)? onChanged;
//
//   @override
//   _levelComboxState createState() => _levelComboxState();
// }
//
//
// class _levelComboxState extends State<levelCombox> {
//
//   @override
// void initState()  {
//
//
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       // _list  =Provider.of<level_vm>(context,listen: true);
//       // Provider.of<level_vm>(context,listen: false).changeVal(null);
//       // Provider.of<level_vm>(context,listen: false).listoflevel=[];
//      // Provider.of<level_vm>(context,listen: false).clearvalues();
//       context.read<PrivilegeCubit>().getLevels(context.read<UserProvider>().currentUser);
//
//       Provider.of<level_vm>(context,listen: false)
//           .changeVal(widget.selected);
//
//
//
//
//     });
//   super.initState();
//
// }
//   @override
//   void didChangeDependencies() {
//     //Provider.of<RegistrationHelper>(context, listen: false).getAccountId();'
//     super.didChangeDependencies();
//   }
//   @override
//   Widget build(BuildContext context) {
//
//
//
//   return
//       Padding(
//           padding: const EdgeInsets.all(10),
//           child:
//           _levelcombo(context)
//           // (data !=null)?
//           // ( (data as  List<LevelModel>).isEmpty ? Text("لا يوجد بيانات")
//           //     :  _levelcombo(context))
//           //
//           //     :Text("error")
//
//       );
//   }
//
//   Widget _levelcombo(context) {
//
//
//
//      WidgetsBinding.instance.addPostFrameCallback((_) {
//
//     });
//
//     if (_list.isEmpty)
//       return Text("لا يوجد بيانات");
//     else {
//
//
//
//       return Container(
//         child: DropdownButton(
//           isExpanded: true,
//           hint: Text("حدد الصلاحية"),
//           items: _list.map((level_one) {
//             return DropdownMenuItem(
//               child: Text(level_one.nameLevel), //label of item
//               value: level_one.idLevel.toString(), //value of item
//             );
//           }).toList(),
//           value:
//           //_list!.selectedValueLevel.toString(),
//           Provider.of<level_vm>(context, listen: false)
//               .selectedValueLevel,
//           //select_dataItem!.idCountry ,
//           onChanged: (value) {
//             Provider.of<level_vm>(context, listen: false)
//                 .changeVal(value.toString());
//             //_list!.changeVal(value.toString());
//
//           },
//         ),
//
//
//       );
//     }
//       // Consumer<level_vm>(
//       //   builder: (context, levellist, child) {
//
//
//       //  });
//      //return Text("error");
//   }
// }
