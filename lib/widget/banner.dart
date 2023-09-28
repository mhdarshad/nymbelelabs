
import 'package:flutter/material.dart';

import '../entities/banner_data.dart';
import '../util/color_hex.dart';

class AdBanner extends StatelessWidget {
  final BannerData data;
  const AdBanner({
    super.key,  required this.data
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MaterialButton(
        onPressed: () {

        },
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
          color: data.color!=null? HexColor.fromHex(data.color!):Colors.lightBlue,
          child: Container(
            // height:200,
            width: 450,
            decoration:  BoxDecoration(
                borderRadius: BorderRadius.circular(40),
              image: data.image!=null? DecorationImage(
                image: NetworkImage(data.image!),
                fit: BoxFit.cover,
              ):null,
            ),
            child:   Stack(
              children: <Widget>[
                Positioned(
                    top: 20,
                    left: 10,
                    child: Container(
                        decoration:  const BoxDecoration(color: Colors.black38,borderRadius: BorderRadius.all(Radius.circular(20)),),
                        child:  Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(data.footerText,style: const TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                        ))),
                Positioned(
                    bottom: 20,
                    left: 40,
                    child: Container(
                        decoration:  const BoxDecoration(color: Colors.black26,borderRadius: BorderRadius.all(Radius.circular(20)),),
                        child:  Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(data.footerText,style: const TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
                              const Icon(Icons.arrow_forward_outlined,color: Colors.white,)
                            ],
                          ),
                        ))),
                // Expanded(child: Image.asset('assets/banner.jpg'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}