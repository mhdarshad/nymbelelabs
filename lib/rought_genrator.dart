
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'main.dart';
import 'pages/home.dart';
import 'pages/iteslist.dart';

enum Routename{
  home,productList
}
extension ListToString on List<String> {
  String toRequiredParamsString() {
    var str = '';
    for(var param in this) {
      str += '/:$param';
    }
    print(str);
    return str;
  }
}
extension GoNavigations on Routename{
  CUri get nUri{
    switch(this){
      case Routename.home:return  CUri("home");
      case Routename.productList:return  CUri("products");
    }
  }
}
///const toRequiredParamsString = (imEnd) => {
///
///   return Object.entries(imEnd).map(([key, value]) => `${key}=${value}`).join('&');
/// };
class PageControler{
  static get routs =>[
    GoRoute(path: '/',redirect: (_,__)=>"/${Routename.home.nUri.name}"),
    goRoute(Routename.productList,(BuildContext context, GoRouterState state)=> ProductList(key: state.pageKey, catid: state.uri.queryParameters['id']??'',)),
    goRoute(Routename.home,(BuildContext context, GoRouterState state)=> MyHomePage(key: state.pageKey, title: '',)),
    //    goRoute(Routename.profile,(BuildContext context, GoRouterState state)=> UserProfile(key: state.pageKey,),routes: [
    //      goRoute(Routename.editprofile,(BuildContext context, GoRouterState state)=> EditProfile(key: state.pageKey, methode: EditMethode.personal,),isSubROught: true),
    // ]),
    //    goRoute(Routename.signup,(BuildContext context, GoRouterState state)=> SignUpForm(key: state.pageKey,),routes: [
    //      // goRoute(Routename.form,(BuildContext context, GoRouterState state)=> SignUpForm(key: state.pageKey,),isSubROught: true),
    //    ]),
    //    goRoute(Routename.home,(BuildContext context, GoRouterState state)=>DashBoardPage(state.pathParameters['page'],key: state.pageKey,),params: ['page'],
    //        routes: [
    //          goRoute(Routename.scedule,(BuildContext context, GoRouterState state)=> SceduleListing(key: state.pageKey,planId:state.uri.queryParameters['plan_id']),isSubROught: true,
    //              routes: [
    //              ]),
    //        ]),
    //    goRoute(Routename.checkout,(BuildContext context, GoRouterState state)=>CheckOut(key: state.pageKey,),routes: [
    //    ]),
  ];

  // Scaffold get CircularProgressIndicatore =>  Scaffold(appBar:AppBar(),body: const Center(child: CircularProgressIndicator()),);

  ///A custom builder for this route.
  /// For example:
  ///goRoute(Routename.routname,(BuildContext context, GoRouterState state) => FamilyPage(
  ///     families: Families.family(
  ///       state.params['id'],
  ///     ),
  ///   ),
  /// )
  static GoRoute goRoute(Routename route,Widget Function(BuildContext context,
      GoRouterState state) widget,
      {List<String>? params, List<RouteBase>? routes,bool isSubROught = false}) => GoRoute(name:route.nUri.name,path: "${isSubROught?route.nUri.path.replaceFirst('/', ''):route.nUri.path}${(params??[]).toRequiredParamsString()}",routes:routes??const <RouteBase>[],builder: (BuildContext context, GoRouterState state) {
    // stored.pathParameters = state.pathParameters;
    print(state.pathParameters);
    return widget(context,state);
  });
}
final router = GoRouter(
  redirect: (context,state){
    return null;
  },
  initialLocation:"/",
  debugLogDiagnostics:kDebugMode,
  routes: PageControler.routs,
);

enum NavigatoreTyp{
  push,pop,pushReplacment,popUntill,logedout
}
class CUri{
  String uri;
  CUri(this.uri);
  String get name => uri;
  String get path => '/$uri';
}
class Navigations {
  push(BuildContext context,{required Routename name,Map<String, dynamic> parms = const <String, dynamic>{}, Map<String, dynamic> qparms = const <String, dynamic>{}}){
    context.pushNamed(name.nUri.name,pathParameters: parms.map((key, value) => MapEntry(key, value.toString())),queryParameters: qparms);
  }

  String getCurrentRoute(BuildContext context)=>
      GoRouterState.of(context).uri.toString();

  pushReplace(BuildContext context,{required Routename name,Map<String, dynamic> parms = const <String, dynamic>{}, Map<String, dynamic> qparms = const <String, dynamic>{}})=>
      context.pushReplacementNamed(name.nUri.name,pathParameters: parms.map((key, value) => MapEntry(key, value.toString())),queryParameters: qparms);

  pop(BuildContext context){
    if(GoRouter.of(context).canPop()) {
      router.pop();
    } else {
      context.go("/");
    }
  }

  popUntill(BuildContext context,{required Routename name,Map<String, dynamic> parms = const <String, dynamic>{}, Map<String, dynamic> qparms = const <String, dynamic>{}}){

    context.goNamed(name.nUri.name,pathParameters: parms.map((key, value) =>
        MapEntry(key, value.toString())),queryParameters: qparms);
  }

  refresh(BuildContext context)=>
      WidgetsBinding.instance.addPostFrameCallback((_) { context.go("/"); });

  String toPath(Routename route)=>
      route.nUri.path;

}
final navigate = Navigations();