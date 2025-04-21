import 'package:crm_smart/core/utils/app_colors.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../features/mangement/manage_privileges/privileges/presentation/manager/levels_cubit/privileges_cubit.dart';
import '../../models/sections/section_model.dart';
import '../app_scaffold.dart';
import '../custom_app_bar.dart';

class SubSectionsListView extends StatefulWidget {
  const SubSectionsListView({
    super.key,
    required this.title,
    required this.subSections,
    this.onInit,
  });

  final String title;
  final List<SectionModel> subSections;
  final Future<void> Function(BuildContext)? onInit;

  @override
  State<SubSectionsListView> createState() => _SubSectionsListViewState();
}

class _SubSectionsListViewState extends State<SubSectionsListView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await widget.onInit?.call(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Filtrar subsecciones permitidas
    final allowedSubsections = widget.subSections.where((subsection) => _isAllowed(context, subsection)).toList();

    return AppScaffold(
      appBar: CustomAppBar(title: widget.title),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 45),
            decoration: BoxDecoration(
              color: AppColors.primaryMain,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
          ),
          Expanded(
            child: Padding(
                padding: const EdgeInsets.all(10),
                child: Transform.translate(
                  offset: Offset(0, -55),
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // 2 tarjetas por fila
                        childAspectRatio: 1.1, // Proporción ancho/alto de las tarjetas
                        crossAxisSpacing: 10, // Espaciado horizontal
                        mainAxisSpacing: 10, // Espaciado vertical
                      ),
                      itemCount: allowedSubsections.length,
                      itemBuilder: (context, index) {
                        final subsection = allowedSubsections[index];
                        return _buildCard(
                          subsection.title ?? '',
                          _getIconForSection(subsection.title ?? ''),
                          () {
                            if (subsection.page != null) {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => subsection.page!,
                                ),
                              );
                            }
                          },
                        );
                      },
                    ),
                  ),
                )),
          ),
        ],
      ),
    );
  }

  bool _isAllowed(BuildContext context, SectionModel subsection) => context.read<PrivilegesCubit>().checkPrivilege(subsection.privilegeId);

  // Función para determinar el icono basado en el título de la sección
  IconData _getIconForSection(String title) {
    // Mapeo de títulos a iconos (agrega más según sea necesario)
    if (title.contains('تقارير') || title.contains('احصائيات')) return Icons.bar_chart_rounded;
    if (title.contains('عملاء') || title.contains('زبائن')) return Icons.people;
    if (title.contains('مبيعات')) return Icons.attach_money;
    if (title.contains('إدارة') || title.contains('ادارة')) return Icons.admin_panel_settings;
    if (title.contains('فواتير')) return Icons.receipt_long;
    if (title.contains('دعم') || title.contains('مساعدة')) return Icons.support_agent;
    if (title.contains('إعدادات')) return Icons.settings;
    if (title.contains('مهام')) return Icons.task_alt;
    if (title.contains('مستخدمين')) return Icons.supervised_user_circle;
    if (title.contains('منتجات')) return Icons.inventory_2;
    if (title.contains('خدمات')) return Icons.miscellaneous_services;

    // Icono predeterminado si no hay coincidencia
    return Icons.folder_outlined;
  }
}

Widget _buildCard(String title, IconData icon, VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.white,
              Colors.grey.shade50,
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: AppColors.primaryMain.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: AppColors.primaryMain,
                size: 30,
              ),
            ),
            SizedBox(height: 12),
            AppText(
              title,
              textAlign: TextAlign.center,
              maxLines: 2,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Colors.grey.shade800,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
