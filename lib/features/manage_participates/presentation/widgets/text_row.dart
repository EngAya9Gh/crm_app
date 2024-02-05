
import 'package:flutter/material.dart';
class TextRow extends StatelessWidget {
  final String title;
  final String data;

  const TextRow({Key? key, required this.title,required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:8.0),
      child: Column(
        children: [
           const SizedBox(height: 5), 
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
             crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 3,
                child: Align(
                    alignment: Alignment.centerLeft,
                  child: Text(
                    data,
                    style: TextStyle(
                      fontSize: 14, 
                      fontWeight: FontWeight.normal, 
                      color: Colors.black, 
                    ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                  ),
                ),
              ),
              
                // const SizedBox(width: 30),  
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 14, 
                        fontWeight: FontWeight.bold, 
                        color: Colors.black, 
                        
                      ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                                  ),
                    ),
                  ),
                ),
            ],
          ),
            
            Divider(thickness: 1,color: Colors.grey),
            SizedBox(height: 5,),
       
    
        
        ],
      ),
    );
  }
}