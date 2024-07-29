import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/common/extensions/extensions.dart';
import '../../../../../../../core/common/widgets/app_elvated_button.dart';
import '../../../../../../../core/utils/app_constants.dart';
import '../../../../../../../model/invoiceModel.dart';
import '../../../../../../../ui/widgets/custom_file_widget.dart';
import '../../../../../../../ui/widgets/custom_network_Image.dart';
import '../../../../../../../ui/widgets/custom_widget/text_uitil.dart';
import '../../../../../../../ui/widgets/pick_image_bottom_sheet.dart';
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

  List<File> selectedFile = [];
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
              TextUtilis(
                color: Colors.black,
                fontSize: 35,
                fontWeight: FontWeight.bold,
                textstring: 'المرفقات:',
                underline: TextDecoration.none,
              ),
              Spacer(),
              if (selectedFile.isNotEmpty || deletedFiles.isNotEmpty) ...{
                AppElevatedButton(
                  isLoading: isLoading,
                  text: "حفظ",
                  onPressed: () => _onSave(setState, context),
                ),
              },
              TextButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(15))),
                    builder: (context) => PickImageBottomSheet(
                      onPickFile: (context, file) {
                        agent.agentSupportFiles.add(
                          AgentSupportFileModel(file: file),
                        );
                        selectedFile.add(file);
                        setState(() {});
                      },
                    ),
                  );
                },
                child: Text("إضافة"),
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
                    if (file.file != null) {
                      return CustomFileWidget(
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
          AppConstants.showSnakeBar("حدث خطأ $error");
        },
      ),
    );
  }

  void _deleteFile(AgentSupportFileModel file) {
    agent.agentSupportFiles.remove(file);
    if (file.file != null) selectedFile.remove(file.file!);
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
