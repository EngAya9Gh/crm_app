import 'package:crm_smart/features/app/presentation/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../../../core/common/enums/toast_colors_enum.dart';
import '../../../../../../../core/common/extensions/num_extensions.dart';
import '../../../../../../../core/common/helpers/app_snackbar.dart';
import '../../../../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../../../../model/invoiceModel.dart';
import '../../../../../../../ui/widgets/card_attachment.dart';
import '../../../../../../../ui/widgets/custom_network_Image.dart';
import '../../../../../../../ui/widgets/pick_image_bottom_sheet.dart';
import '../../../../../../app/presentation/widgets/app_text_button.dart';
import '../../../data/models/agent_distributor_model.dart';
import '../../../data/models/agent_support_file_model.dart';
import '../../../domain/use_cases/crud_agent_support_files_usecase.dart';
import '../../manager/agents_distributors_profile_bloc/agents_distributors_profile_bloc.dart';
import '../../manager/manage_agents_and_distributors_cubit/agents_distributors_cubit.dart';

class AgentSupportAttachmentsRow extends StatefulWidget {
  final AgentDistributorModel agent;

  const AgentSupportAttachmentsRow({
    Key? key,
    required this.agent,
  }) : super(key: key);

  @override
  State<AgentSupportAttachmentsRow> createState() =>
      _AgentSupportAttachmentsRowState();
}

class _AgentSupportAttachmentsRowState
    extends State<AgentSupportAttachmentsRow> {
  late final AgentsDistributorsProfileBloc bloc;
  late AgentDistributorModel agent;
  late String agentId;
  bool isLoading = false;

  List<XFile> selectedFile = [];
  List<String> deletedFiles = [];

  @override
  void initState() {
    bloc = context.read<AgentsDistributorsProfileBloc>();
    bloc.clear();

    agent = widget.agent.copyWith();
    agentId = agent.idAgent;

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        children: [
          20.height,
          Row(
            children: [
              AppText(
                'المرفقات',
                fontWeight: FontWeight.bold,
              ),
              Spacer(),
              if (selectedFile.isNotEmpty || deletedFiles.isNotEmpty) ...{
                AppElevatedButton(
                  isLoading: isLoading,
                  text: "حفظ",
                  onPressed: () => _onSave(setState, context),
                ),
              },
              AppTextButton(
                text: "إضافة",
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.white,
                    builder: (context) => PickImageBottomSheet(
                      onPickFile: (context, file) {
                        agent.agentSupportFiles.add(
                          AgentSupportFileModel(xFile: file),
                        );
                        selectedFile.add(file);
                        setState(() {});
                      },
                    ),
                  );
                },
              ),
            ],
          ),
          10.height,
          BlocBuilder<AgentsDistributorsProfileBloc,
              AgentsDistributorsProfileState>(
            buildWhen: (previous, current) {
              return true;
            },
            builder: (context, state) {
              return SizedBox(
                height: agent.agentSupportFiles.isEmpty ? 0 : 125,
                child: ListView.separated(
                  separatorBuilder: (context, index) => 10.horizontalSpace,
                  itemCount: agent.agentSupportFiles.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final file = agent.agentSupportFiles[index];
                    if (file.xFile != null) {
                      return CardAttachment(
                        fileModel: file,
                        onDelete: () => _deleteFile(file),
                      );
                    }
                    return CustomNetworkImage(
                      fileAttach: FileAttach(
                        id: file.agentId,
                        fileAttach: file.fileUrl,
                      ),
                      onDelete: () => _deleteFile(file),
                    );
                  },
                ),
              );
            },
          ),
          20.height,
        ],
      ),
    );
  }

  void _onSave(StateSetter refresh, BuildContext context) {
    isLoading = true;
    refresh(() {});
    bloc.add(
      CrudAgentSupportFilesEvent(
        crudAgentSupportFilesParams: CrudAgentSupportFilesParams(
          addedFiles: selectedFile,
          deletedFiles: deletedFiles,
          agentId: agentId,
        ),
        onSuccess: (agent) {
          context.read<AgentsDistributorsCubit>().editAgent(agent);
          _clear();
          this.agent = agent;
          isLoading = false;
          refresh(() {});
        },
        onFailed: (error) {
          isLoading = false;
          refresh(() {});
          AppSnackbar.showSnakeBar(
            "حدث خطأ $error",
            color: ToastColorsEnum.error,
          );
        },
      ),
    );
  }

  void _deleteFile(AgentSupportFileModel file) {
    agent.agentSupportFiles.remove(file);
    if (file.xFile != null) selectedFile.remove(file.xFile!);
    if (file.id != null) deletedFiles.add(file.id!);
    setState(() {});
  }

  @override
  void dispose() {
    _clear();
    super.dispose();
  }

  void _clear() {
    selectedFile.clear();
    deletedFiles.clear();
  }
}
