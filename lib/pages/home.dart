import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../entities/banner_data.dart';
import '../util/json_save.dart';
import '../widget/banner.dart';
import '../widget/rounded_icon.dart';
import '../widget/rounded_rectangular_icon.dart';
import '../widget/search_bar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Map<String ,dynamic>> data =[
    {
      "type":"banner",
      "items":[
        {
          "type":"banner",
          "image":"https://miro.medium.com/v2/resize:fit:1100/format:webp/1*TjDnfpnw4gI8sZ2fvaK9zg.jpeg",
          "header_text":"New Recipe",
          "footer_text":"Cook Chicken Curry",
          "footer_icon":true
        },
        {
          "type":"banner",
          "color":"#ffb74093",
          "header_text":"Meal Planner",
          "footer_text":"Plan your meals",
          "footer_icon":false
        },
        {
          "type":"banner",
          "color":"#ffb74093",
          "footer_text":"Plan your meals",
          "text":"Meat Based"
        }
      ]
    },
    {
      "type":"horizontal_list",
      "title":"Collections",
      "items":[
        {
          "type":"circular_item",
          "text":"Breakfast",
          "image":"https://path/to/image.png"
        },
        {
          "type":"circular_item",
          "text":"Meat Based",
          "image":"https://path/to/image.png"
        },
        {
          "type":"circular_item",
          "text":"Vegan",
          "image":"https://path/to/image.png"
        }
      ]
    },
    {
      "type":"horizontal_list",
      "title":"Cuisines",
      "items":[
        {
          "type":"box_item",
          "text":"American",
          "image":"https://path/to/image.png"
        },
        {
          "type":"box_item",
          "text":"Italian",
          "image":"https://path/to/image.png"
        },
        {
          "type":"box_item",
          "text":"Thai",
          "image":"https://path/to/image.png"
        }
      ]
    }
  ];
  ValueNotifier<String> serchvalue = ValueNotifier('');
  @override
  void initState() {
    // TODO: implement initState
    JsonManager.getJsonData(context).then((value) {
      if (kDebugMode) {
        print((value!['app']['theme']));
      }
      EasyDynamicTheme.of(context).changeTheme(dark: (value!['app']['theme']) == 'dark');
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    List<Items> item = [];
    return FutureBuilder(
        future: JsonManager.getJsonData(context),
        builder: (context,data) {
          if(data.connectionState == ConnectionState.done){
            final appdata = MainData.fromJson(data.data!);
            return Scaffold(
              floatingActionButton: SizedBox(height:80,width:80,child: EasyDynamicThemeSwitch()),
              appBar: PreferredSize(
                  preferredSize: const Size.fromHeight(100),
                  child: SearchBarWidget(serchvalue: serchvalue)),
              backgroundColor: Theme.of(context).backgroundColor,
              body: ValueListenableBuilder<String>(
                  valueListenable: serchvalue,
                  builder: (context,value,_) {
                    if(value.isEmpty) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView(
                          children: [
                            ...appdata.widgets?.map((e) {
                              /// Banner Widgets
                              if(e.type == 'banner') {
                                return SizedBox( height:300,child: ListView(scrollDirection: Axis.horizontal,
                                    children:e.bannerItem?.where((element) => element.type == 'banner').map((e) =>  SizedBox(child: AdBanner(data: e,))).toList()??[]));
                              }
                              /// Horizontal List With title widget
                              /// Item Types
                              if(e.type == 'horizontal_list'){
                                return  Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(e.title??"",style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),),
                                    SizedBox( height:160,child: ListView(scrollDirection: Axis.horizontal,children:e.items?.map((e) {
                                      if(e.type == 'box_item'){
                                        return SizedBox(child: RoundedRectangularIcon(data: e,));
                                      }else{
                                        return SizedBox(child: RoundedIcon(data: e,));
                                      }
                                    }).toList()??[])),
                                  ],
                                );
                              }
                              else{
                                return const SizedBox.shrink();
                              }
                            })??[],
                            /// Customization
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration:  const BoxDecoration(color: Colors.white38,borderRadius: BorderRadius.all(Radius.circular(20)),),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("Collections",style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),),
                                    ),
                                    SizedBox(
                                      height:160,
                                      child: ListView(scrollDirection: Axis.horizontal,children: appdata.widgets?.where((e) => e.type == 'horizontal_list').fold(item, (previousValue, element) {
                                        previousValue.addAll(element.items!);
                                        return previousValue;
                                      }).map((e) {
                                        return
                                          (e.type == 'box_item')?
                                          RoundedRectangularIcon(data: e,):
                                          RoundedIcon(data: e,);
                                      }).toList()??[]),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                          ],
                        ),
                      );
                    }else{
                      final appdatas = MainData.fromJson(data.data!);
                      List<Items> item = [];
                      List<Widgets>? list = appdatas.widgets?.where((e) => e.type == 'horizontal_list').toList();
                      final listdata = list?.fold(item, (previous, element) {
                        previous.addAll(element.items!);
                        return previous;
                      }).where((element) => (element.text??'').toLowerCase().contains(value.toLowerCase()));
                      return ListView(children: [
                        ...listdata?.map((e) => GestureDetector(
                          onTap: ()=>{

                          },
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  const Icon(Icons.search),
                                  Text(e.text??'',style: Theme.of(context).textTheme.bodyMedium,),
                                ],
                              ),
                            ),
                          ),
                        ))??[]
                      ],);
                    }
                  }
              ),
            );
          }else{

            return const Scaffold();
          }

        }
    );
  }
}
