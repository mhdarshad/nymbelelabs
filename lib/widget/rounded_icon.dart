
import 'package:flutter/material.dart';
import 'package:nymbelelabs/rought_genrator.dart';

import '../entities/banner_data.dart';

class RoundedIcon extends StatelessWidget {
  final Items data;
  const RoundedIcon({
    super.key,  required this.data
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: MaterialButton(
        onPressed: () {
          navigate.push(context, name: Routename.productList,qparms: {
            "id":data.id
          });
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
                    Card(
                      elevation: 8,
                      // color: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80)),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(80),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Image.network(data.image??'',fit: BoxFit.fill, height:60, width:60,errorBuilder: (context,_,state){
                              return const SizedBox(height: 60,width: 60,child: Placeholder(),);
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
    );
  }
}
