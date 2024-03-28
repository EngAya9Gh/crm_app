import 'package:crm_smart/core/common/enums/ticket_types_enum.dart';
import 'package:crm_smart/core/utils/app_navigator.dart';
import 'package:crm_smart/features/clients_care/clients_tickets/domain/use_cases/edit_ticket_type_usecase.dart';
import 'package:crm_smart/model/configmodel.dart';
import 'package:crm_smart/view_model/comment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

import '../../../../../constants.dart';
import '../../../../../ui/screen/care/card_comment.dart';
import '../../../../../ui/widgets/custom_widget/text_form.dart';
import '../../../../app/presentation/widgets/app_elvated_button.dart';
import '../../data/models/ticket_model.dart';
import '../manager/edit_ticket_cubit/edit_ticket_cubit.dart';

class TicketRatePage extends StatefulWidget {
  TicketRatePage({required this.ticket_model, Key? key}) : super(key: key);
  TicketModel ticket_model;

  @override
  _TicketRatePageState createState() => _TicketRatePageState();
}

class _TicketRatePageState extends State<TicketRatePage> {
  String? typepayController = '0';
  bool numberwrong = false;
  bool repeat = false;
  bool isdone = false;
  double rate = 1.0;
  TextEditingController _textnotes = TextEditingController();
  late ConfigModel peroid;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final EditTicketCubit editTicketCubit;

  @override
  void initState() {
    editTicketCubit = context.read<EditTicketCubit>();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Provider.of<comment_vm>(context, listen: false)
          .getComment(widget.ticket_model.fkClient.toString());
      //period_commincation3
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.ticket_model.nameEnterprise.toString()),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Form(
                key: _formKey,
                child: EditTextFormField(
                  maxline: 4,
                  paddcustom: EdgeInsets.all(10),
                  hintText: 'ملاحظات التقييم  ',
                  obscureText: false,
                  controller: _textnotes,
                  vaildator: (value) {
                    if (value.toString().trim().isEmpty) {
                      return 'الحقل فارغ';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Text('التقييم 1/5'),
                  RatingBar.builder(
                    initialRating: 1,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: false,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      setState(() {
                        rate = rating;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),
              BlocBuilder<EditTicketCubit, EditTicketState>(
                builder: (context, state) {
                  return AppElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(kMainColor),
                      ),
                      isLoading: state is EditTicketLoading,
                      onPressed: () async {
                        _formKey.currentState!.save();
                        if (!_formKey.currentState!.validate()) return;
                        await editTicketCubit
                            .editTicketType(EditTicketTypeParams(
                          idTicket: widget.ticket_model.idTicket,
                          typeTicket: TicketTypesEnum.rate.nameEn,
                          notes: _textnotes.text,
                          notesRate: _textnotes.text,
                          rate: rate.toString(),
                        ));
                        AppNavigator.pop();
                      },
                      child: Text(
                        ' تم التقييم ',
                        style: TextStyle(
                            // color:widget.com.dateCommunication==null?
                            color: kWhiteColor),
                      ));
                },
              ),
              SizedBox(height: 10),
              SizedBox(height: 10),
              Container(
                height: MediaQuery.of(context).size.height * 0.45,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 8, right: 8, top: 10.0, bottom: 5),
                  child: Consumer<comment_vm>(builder: (context, value, child) {
                    return value.filteredComments.length == 0
                        ? Text('')
                        : Column(
                            children: [
                              Expanded(
                                child: ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    itemCount: value.filteredComments.length,
                                    itemBuilder: (context, index) {
                                      return SingleChildScrollView(
                                          child: Padding(
                                              padding: const EdgeInsets.all(2),
                                              child:
                                                  //Text(''),
                                                  cardcomment(
                                                commentmodel: value
                                                    .filteredComments[index],
                                              )));
                                    }),
                              ),
                            ],
                          );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
