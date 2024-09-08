import 'package:crm_smart/ui/screen/client/client_profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../../core/common/widgets/custom_app_bar.dart';
import '../../../../../core/config/navigator/app_navigator.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../model/communication_modle.dart';
import '../../../../app/presentation/widgets/app_text.dart';
import '../manager/previous_ratings_cubit.dart';
import 'rating_details_card.dart';

class PreviousRatingsList extends StatefulWidget {
  const PreviousRatingsList({
    super.key,
    required this.communication,
  });

  final CommunicationModel communication;

  @override
  State<PreviousRatingsList> createState() => _PreviousRatingsListState();
}

class _PreviousRatingsListState extends State<PreviousRatingsList> {
  late final PreviousRatingsCubit _cubit;

  @override
  void initState() {
    _cubit = context.read<PreviousRatingsCubit>();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'كل التقييمات'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColors.kWhiteColor,
                  ),
                  child: Column(
                    children: [
                      AppText(widget.communication.nameEnterprise),
                      if (widget.communication.nameUserInstall != null)
                        AppText(widget.communication.nameUserInstall!),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(child: Divider(thickness: 2)),
              // ticket status details
              SliverList.separated(
                itemCount: widget.communication.ratings.length,
                itemBuilder: (context, index) {
                  return RatingDetailsCard(
                    rate: widget.communication.ratings[index],
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(height: 10);
                },
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Divider(thickness: 2),
                    SizedBox(height: 10),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: AppElevatedButton(
                  text: 'بروفايل العميل',
                  onPressed: () => AppNavigator.push(
                    ClientProfile(idClient: widget.communication.fkClient),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
