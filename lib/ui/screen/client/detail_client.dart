import 'package:crm_smart/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

class Detail_Client extends StatelessWidget {
  const Detail_Client({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Container(
            /*child: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.white,
            onPressed: (){
              Navigator.pop(context);
            },
              ),*/
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: kMainColor,
          ),
          Positioned(
            top:150,
            left: 0,
            right: 0,
            //height: MediaQuery.of(context).size.height/2,
            child: Container(
              height:  MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color:Colors.white,
                borderRadius: BorderRadius.only(
                  topRight:Radius.circular(110),
                    topLeft: Radius.circular(110)),
              )
            ),
          )
        ],
      ),
    );
  }
}
