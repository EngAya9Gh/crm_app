
import 'package:crm_smart/api/fcm.dart';
import 'package:crm_smart/provider/authprovider.dart';
import 'package:crm_smart/provider/bottomNav.dart';
import 'package:crm_smart/provider/config_vm.dart';
import 'package:crm_smart/provider/loadingprovider.dart';
import 'package:crm_smart/provider/manage_provider.dart';
import 'package:crm_smart/provider/selected_button_provider.dart';
import 'package:crm_smart/provider/switch_provider.dart';
import 'package:crm_smart/ui/screen/home/home.dart';
import 'package:crm_smart/ui/screen/login.dart';
import 'package:crm_smart/view_model/approve_vm.dart';
import 'package:crm_smart/view_model/client_vm.dart';
import 'package:crm_smart/view_model/comment.dart';
import 'package:crm_smart/view_model/communication_vm.dart';
import 'package:crm_smart/view_model/country_vm.dart';
import 'package:crm_smart/view_model/datetime_vm.dart';
import 'package:crm_smart/view_model/event_provider.dart';
import 'package:crm_smart/view_model/invoice_vm.dart';
import 'package:crm_smart/view_model/level_vm.dart';
import 'package:crm_smart/view_model/maincity_vm.dart';
import 'package:crm_smart/view_model/notify_vm.dart';
import 'package:crm_smart/view_model/privilge_vm.dart';
import 'package:crm_smart/view_model/product_vm.dart';
import 'package:crm_smart/view_model/regoin_vm.dart';
import 'package:crm_smart/view_model/ticket_vm.dart';
import 'package:crm_smart/view_model/typeclient.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:crm_smart/view_model/usertest_vm.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:crm_smart/api/firebase_option.dart';
import 'binding/binding.dart';
import 'constants.dart';
//import 'package:firebase_core/firebase_core.dart';
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.

  //DefaultFirebaseOptions .currentPlatform );
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform);
  print("Handling a background message: ${message.messageId}");
  print("Handling a background message: ${message.data['idclient']}");
  print("Handling a background message: ${message.data['Typenotify']}");


}

void main() async {
  // <meta-data
  // android:name="com.google.firebase.messaging.defult_notification_channel_id"
  // android:value="high_importance_channel"
  // />
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Set the background messaging handler early on, as a named top-level function

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  print('in main ');
 //   print(await FirebaseMessaging.instance.getToken(
 //     //vapidKey: "BLHC6fhpHX_VBbufktusXDMRhLtLI764Ic_ZcCc9Lh2puYzPEvwOpvxDfBmHKtRQu38OU_hUoalT42PxzHc8JPg")
 // ));

 // FCM().getmessge();
  //Provider.debugCheckInvalidValueType = null;

  // void main() async {
  //   //WidgetsFlutterBinding.ensureInitialized(); // uncomment if needed for resource initialization
  //   GlobalBindings().dependencies();
  //   runApp(MyApp());
  // }
  //await Firebase.initializeApp();
  runApp(

      MultiProvider(providers: [
        ChangeNotifierProvider<user_vm_provider>(create: (_) => user_vm_provider()),

        ChangeNotifierProvider<navigatorProvider>(create: (_) => navigatorProvider()),
        ChangeNotifierProvider<AuthProvider>(create: (_) => AuthProvider()),
        ChangeNotifierProvider<switch_provider>(create: (_) => switch_provider()),
        ChangeNotifierProvider<selected_button_provider>(create: (_) => selected_button_provider()),
        ChangeNotifierProvider<country_vm>(create: (_) => country_vm()),
        // ChangeNotifierProvider<config_vm>(create: (_) => config_vm()),
        ChangeNotifierProxyProvider<user_vm_provider,config_vm>(
          create: (_)=> config_vm(),
          update: (ctx,value,prev)=>prev!..setvalue(value.currentUser),
        ),
         ChangeNotifierProvider<level_vm>(create: (_) => level_vm()),
        //ChangeNotifierProvider<regoin_vm>(create: (_) => regoin_vm()),
        ChangeNotifierProvider<LoadProvider>(create: (_) => LoadProvider()),
        //ChangeNotifierProvider<product_vm>(create: (_) => product_vm()),
        ChangeNotifierProxyProvider<user_vm_provider,product_vm>(
          create: (_)=> product_vm(),
          update: (ctx,value,prev)=>prev!..setvalue(value.currentUser),
        ),
        ChangeNotifierProvider<manage_provider>(create: (_) => manage_provider()),
       // ChangeNotifierProvider<privilge_vm>(create: (_) => privilge_vm()),
        ChangeNotifierProxyProvider<user_vm_provider,privilge_vm>(
          create: (_)=> privilge_vm(),
          //   Provider.of<user_vm_provider>(_, listen: false).currentUser),
          update: (ctx,value,prev)=>prev!..setvalue(value.currentUser),
          //  client_vm(value.currentUser)
        ),
        ChangeNotifierProxyProvider<user_vm_provider,regoin_vm>(
          create: (_)=> regoin_vm(),
          //   Provider.of<user_vm_provider>(_, listen: false).currentUser),
          update: (ctx,value,prev)=>prev!..setvalue(value.currentUser),
          //  client_vm(value.currentUser)
        ),

        ChangeNotifierProxyProvider<user_vm_provider,client_vm>(
             create: (_)=> client_vm(),
            update: (ctx,value,prev)=>prev!..setvalue(value.currentUser),
        ),
        ChangeNotifierProxyProvider<user_vm_provider,usertest_vm>(
             create: (_)=> usertest_vm(),
            update: (ctx,value,prev)=>prev!..setvalue(value.currentUser),
        ),

        // ChangeNotifierProxyProvider<privilge_vm,client_vm>(
        //   create: (_)=> client_vm(),
        //   update: (ctx,value,prev)=>prev!..setvaluepriv( value.privilgelist),
        //
        // ),

        ChangeNotifierProxyProvider<user_vm_provider,notifyvm>(
          create: (_)=> notifyvm(),
          update: (ctx,value,prev)=>prev!..setvalue(value.currentUser),
        ),

        ChangeNotifierProxyProvider<user_vm_provider,approve_vm>(
          create: (_)=> approve_vm(),
          update: (ctx,value,prev)=>prev!..setvalue(value.currentUser),

        ),
        ChangeNotifierProxyProvider<user_vm_provider,invoice_vm>(
          create: (_)=> invoice_vm(),
          update: (ctx,value,prev)=>prev!..setvalue(value.currentUser),

        ),
        ChangeNotifierProxyProvider<user_vm_provider,maincity_vm>(
          create: (_)=> maincity_vm(),
          update: (ctx,value,prev)=>prev!..setvalue(value.currentUser),

        ),
        //ChangeNotifierProvider<invoice_vm>(create: (_) => invoice_vm()),
        ChangeNotifierProvider<typeclient>(create: (_)=> typeclient()),
        ChangeNotifierProxyProvider<invoice_vm,EventProvider>(
          create: (_)=> EventProvider(),
          update: (ctx,value,prev)=>prev!..setvalue(value.listinvoices),

        ),
        ChangeNotifierProxyProvider<user_vm_provider,ticket_vm>(
          create: (_)=> ticket_vm(),
          update: (ctx,value,prev)=>prev!..setvalue(value.currentUser),

        ),
         ChangeNotifierProvider<comment_vm>(create: (_)=> comment_vm()),
        ChangeNotifierProxyProvider<user_vm_provider,communication_vm>(
          create: (_)=> communication_vm(),
          update: (ctx,value,prev)=>prev!..setvalue(value.currentUser),

        ),

         ChangeNotifierProvider<datetime_vm>(create: (_)=> datetime_vm()),
        //ChangeNotifierProvider<ticket_vm>(create: (_)=> ticket_vm()),

  ], child:MyApp()));
}

class MyApp extends StatelessWidget {
  bool isUserLoggedIn = false;
@override
Widget build(BuildContext context) {
  return  FutureBuilder<SharedPreferences>(
          future: Provider.of<user_vm_provider>(context,listen: false)
              .getcurrentuser() ,
          builder:(context, snapshot) {
            print('in main builder');
          if (!snapshot.hasData) {
            //Center(child: CircularProgressIndicator(),)
            return MaterialApp(
              home: Scaffold(
                body: Center(
                  child: Text('Loading....'),
                ),
              ),
            );
          }
          else {
            isUserLoggedIn =
                snapshot.data!.getBool(kKeepMeLoggedIn) ?? false;
            if(snapshot.data!.getString('id_user1')=='0')
              return MaterialApp(
                home: Scaffold(
                  body: Center(
                    child: Text('غير مصرح لك الدخول'),
                  ),
                ),
              );
            // String idcurrentuser= snapshot.data!.getString("id_user").toString();
          else {

            return
              MaterialApp(
                // localizationsDelegates: [
                //   GlobalWidgetsLocalizations.delegate,
                //   GlobalMaterialLocalizations.delegate,
                //   // MonthYearPickerLocalizations.delegate,
                // ],
                  debugShowCheckedModeBanner: false,
                  title: 'Flutter Demo',
                  theme: ThemeData(
                    primaryColor: kMainColor,
                    backgroundColor: Colors.white,
                    brightness: Brightness.light,
                  ),
                  home: Directionality(
                    textDirection: TextDirection.rtl,
                    child: isUserLoggedIn ? Home() : login(),
                  ),
             );}
          }
        });
  }
}
  // This widget is the root of your application.

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {

    return login();
 // This trailing comma makes auto-formatting nicer for build methods.

  }
}
