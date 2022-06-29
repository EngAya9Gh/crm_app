//
//
//
// import 'package:crm_smart/provider/manage_provider.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/all.dart';
//
// class mangwidget extends ConsumerWidget {
//
//   final dataprovider=ChangeNotifierProvider((ref) => manage_provider());
//   late final mangelist;
//   @override
//   Widget build(BuildContext context, ScopedReader watch) {
//     WidgetsBinding.instance?.addPostFrameCallback((_) {
//
//       mangelist=  context.read(dataprovider).listtext;
//       //context.read<manage_provider>();
//     //Provider.of<manage_provider>(context,listen: false).;
//
//
//     });
//     return DropdownButton(
//       isExpanded: true,
//       hint: Text("حددالإدارة"),
//       items: mangelist.listtext.map(
//               (level_one)
//           {
//             return DropdownMenuItem(
//
//               child: Text(level_one), //label of item
//               value: level_one, //value of item
//             );
//           }).toList(),
//       value:mangelist.selectedValuemanag,
//       onChanged:(value){
//         //namemanage=value.toString();
//         mangelist.changevalue(value.toString());
//
//       },
//     );
//   }
//   }
