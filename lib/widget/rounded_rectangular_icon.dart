
import 'package:flutter/material.dart';

import '../entities/banner_data.dart';

class RoundedRectangularIcon extends StatelessWidget {
  final Items data;
  const RoundedRectangularIcon({
    super.key,  required this.data
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        // color: data.color!=null? HexColor.fromHex(data.color!):Colors.lightBlue,
        child: MaterialButton(
          onPressed: () {

          },
          child: SizedBox(
            // height:200,
            width: 100,
            child:   Column(
              children: <Widget>[
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration:  const BoxDecoration(color: Colors.white,borderRadius: BorderRadius.all(Radius.circular(20)),),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.network(data.image??'',fit: BoxFit.fill, height:60, width:60,errorBuilder: (context,_,state){
                                return const SizedBox(height:60,width:60,child: Placeholder());
                              },),
                            )
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(data.text??'',textAlign:TextAlign.center,style:Theme.of(context).textTheme.bodyMedium,),
                ),
                // Expanded(child: Image.asset('assets/banner.jpg'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
