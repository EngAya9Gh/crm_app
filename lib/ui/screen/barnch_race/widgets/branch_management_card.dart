import 'package:flutter/material.dart';

import '../pages/branch_management_details_page.dart';

class BranchManagementCard extends StatelessWidget {
  const BranchManagementCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => BranchManagementDetailsPage(),
          ),
        );
      },
      child: Card(
        margin: EdgeInsets.zero,
        shadowColor: Colors.grey.shade200,
        elevation: 5.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("فرع المدينة"),
              SizedBox(height: 5),
              Text("130,000.00"),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("6.47%"),
                  Text("8415"),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
