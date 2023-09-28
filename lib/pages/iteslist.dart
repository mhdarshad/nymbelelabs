
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../entities/banner_data.dart';
import '../util/json_save.dart';

class ProductList extends StatefulWidget {
  final String catid;

  const ProductList({Key? key,required this.catid}) : super(key: key);

  @override
  _ProductListState createState() =>
      _ProductListState();
}

class _ProductListState extends State<ProductList> {

  final scaffoldKey = GlobalKey<ScaffoldState>();
  Items? itemData ;
  @override
  void initState() {
    JsonManager.getJsonData(context).then((value) {

    });
    super.initState();
  }

  @override
  void dispose() {

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Theme.of(context).backgroundColor,
      body: FutureBuilder(
        builder: (context,value) {
          if(value.connectionState == ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator(),);
          }
          if(value.connectionState == ConnectionState.done){
            List<Items> items = [];
            final data = MainData.fromJson(value.data??{});
            itemData =data.widgets?.where((e) => e.type == 'horizontal_list').fold(items, (previousValue, element) {
              previousValue.addAll(element.items!);
              return previousValue;
            }).where((element) => element.id == widget.catid).firstOrNull;
            if (kDebugMode) {
              print("Item Data: ${itemData?.id}");
            }
            return SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          '${itemData?.text}',
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                    child: ListView(
                      padding: EdgeInsets.zero,
                      primary: false,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      children: [
                        ...itemData?.items?.map((e) => Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 8),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color:Theme.of(context).backgroundColor,
                              boxShadow: const [
                                BoxShadow(
                                  blurRadius: 3,
                                  color: Color(0x411D2429),
                                  offset: Offset(0, 1),
                                )
                              ],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding:
                                    const EdgeInsetsDirectional.fromSTEB(0, 1, 1, 1),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(6),
                                      child: Image.network(
                                        '${e.image}',
                                        errorBuilder: (context,err,_)=> const SizedBox(height:80,width:80,child: Placeholder()),
                                        width: 80,
                                        height: 80,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          8, 8, 4, 0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '${e.text}',
                                            style: Theme.of(context).textTheme.headlineSmall,
                                          ),
                                          Padding(
                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                0, 4, 8, 0),
                                            child: Text(
                                              'Subtext',
                                              textAlign: TextAlign.start,
                                              style: Theme.of(context).textTheme
                                                  .labelMedium,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 4, 0, 0),
                                        child: Icon(
                                          Icons.chevron_right_rounded,
                                          color: Color(0xFF57636C),
                                          size: 24,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0, 12, 4, 8),
                                        child: Text(
                                          '${e.price}',
                                          textAlign: TextAlign.end,
                                          style: Theme.of(context).textTheme
                                              .bodyMedium,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ))??[],
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 8),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color:Theme.of(context).backgroundColor,
                              boxShadow: const [
                                BoxShadow(
                                  blurRadius: 3,
                                  color: Color(0x411D2429),
                                  offset: Offset(0, 1),
                                )
                              ],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding:
                                    const EdgeInsetsDirectional.fromSTEB(0, 1, 1, 1),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(6),
                                      child: Image.network(
                                        'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1760&q=80',
                                        width: 80,
                                        height: 80,
                                        errorBuilder: (context,err,_){
                                          return const SizedBox(height:80,width:80,child: Placeholder());
                                        },
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          8, 8, 4, 0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Title',
                                            style: Theme.of(context).textTheme
                                                .headlineSmall,
                                          ),
                                          Padding(
                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                0, 4, 8, 0),
                                            child: Text(
                                              'Subtext',
                                              textAlign: TextAlign.start,
                                              style: Theme.of(context).textTheme
                                                  .labelMedium,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 4, 0, 0),
                                        child: Icon(
                                          Icons.chevron_right_rounded,
                                          color: Color(0xFF57636C),
                                          size: 24,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0, 12, 4, 8),
                                        child: Text(
                                          '\$11.00',
                                          textAlign: TextAlign.end,
                                          style: Theme.of(context).textTheme
                                              .bodyMedium,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
         return Container();
        }, future: JsonManager.getJsonData(context),
      ),
    );
  }
}
