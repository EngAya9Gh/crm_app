// import 'package:crm_smart/constants.dart';
// import 'package:crm_smart/features/manage_privilege/presentation/pages/privilege_page.dart';
// import 'package:crm_smart/model/levelmodel.dart';
// import 'package:crm_smart/view_model/level_vm.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import '../../../core/config/theme/theme.dart';
// import '../../../features/manage_privilege/presentation/manager/privilege_cubit.dart';
// import 'addLevel.dart';
//
// class check_level extends StatefulWidget {
//   const check_level({Key? key}) : super(key: key);
//
//   @override
//   _check_levelState createState() => _check_levelState();
// }
//
// class _check_levelState extends State<check_level> {
//   @override
//   void initState() {
//     Provider.of<level_vm>(context, listen: false).getlevel();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     List<LevelModel> _listlevel = Provider.of<level_vm>(context, listen: true).listoflevel;
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'ادارة الصلاحيات',
//           style: TextStyle(color: kWhiteColor),
//         ),
//         centerTitle: true,
//       ),
//       floatingActionButton: context.read<PrivilegeCubit>().checkPrivilege('51') == true
//           ? FloatingActionButton(
//               child: Icon(Icons.add, color: AppColors.white),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   CupertinoPageRoute<void>(
//                     builder: (BuildContext context) => addLevel(),
//                     fullscreenDialog: true,
//                   ),
//                 );
//               },
//               backgroundColor: kMainColor,
//             )
//           : Container(),
//       body: _listlevel.length == 0
//           ? Center(child: CircularProgressIndicator())
//           : Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: ListView.builder(
//                 scrollDirection: Axis.vertical,
//                 shrinkWrap: true,
//                 itemCount: _listlevel.length,
//                 itemBuilder: (BuildContext context, int index) => Builder(
//                     builder: (context) => SingleChildScrollView(
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Center(
//                               child: InkWell(
//                                 onTap: () {
//                                   Navigator.push(
//                                       context,
//                                       CupertinoPageRoute(
//                                           builder: (context) => PrivilegePage(
//                                                 namelevel: _listlevel[index].nameLevel,
//                                                 fk_level: _listlevel[index].idLevel,
//                                                 levelModel: null,
//                                               )));
//                                 },
//                                 child: Container(
//                                   width: double.infinity,
//                                   decoration: BoxDecoration(
//                                     color: Colors.white,
//                                     boxShadow: <BoxShadow>[
//                                       BoxShadow(
//                                         offset: Offset(1.0, 1.0),
//                                         blurRadius: 8.0,
//                                         color: Colors.black87.withOpacity(0.2),
//                                       ),
//                                     ],
//                                     borderRadius: BorderRadius.all(Radius.circular(4)),
//                                   ),
//                                   child: Padding(
//                                     padding: const EdgeInsets.all(14.0),
//                                     child: Container(
//                                       decoration: BoxDecoration(
//                                         color: Colors.white,
//                                         borderRadius: BorderRadius.all(Radius.circular(5)),
//                                       ),
//
//                                       //color: kMainColor,
//                                       child: Padding(
//                                         padding: EdgeInsets.all(4),
//                                         child: Center(
//                                           child: Text(
//                                             _listlevel[index].nameLevel,
//                                             style: TextStyle(fontSize: 14, fontFamily: kfontfamily2),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         )),
//                 //     _listProd.map(
//                 //         (item) => Builder(builder: (context)=>CardProduct( itemProd: item,)) ,
//                 // ).toList(),
//               ),
//             ),
//     );
//   }
// }
