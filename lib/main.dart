import 'dart:io';

import 'package:crm_smart/core/di/di_container.dart';
import 'package:crm_smart/provider/authprovider.dart';
import 'package:crm_smart/provider/bottomNav.dart';
import 'package:crm_smart/provider/config_vm.dart';
import 'package:crm_smart/provider/loadingprovider.dart';
import 'package:crm_smart/provider/manage_provider.dart';
import 'package:crm_smart/provider/selected_button_provider.dart';
import 'package:crm_smart/provider/switch_provider.dart';
import 'package:crm_smart/services/service_provider.dart';
import 'package:crm_smart/ui/screen/home/home.dart';
import 'package:crm_smart/ui/screen/login.dart';
import 'package:crm_smart/view_model/activity_vm.dart';
import 'package:crm_smart/view_model/agent_collaborators_invoices_vm.dart';
import 'package:crm_smart/view_model/agent_dsitributor_vm.dart';
import 'package:crm_smart/view_model/approve_vm.dart';
import 'package:crm_smart/view_model/branch_race_viewmodel.dart';
import 'package:crm_smart/view_model/client_vm.dart';
import 'package:crm_smart/view_model/comment.dart';
import 'package:crm_smart/view_model/communication_vm.dart';
import 'package:crm_smart/view_model/company_vm.dart';
import 'package:crm_smart/view_model/country_vm.dart';
import 'package:crm_smart/view_model/datetime_vm.dart';
import 'package:crm_smart/view_model/employee_race_viewmodel.dart';
import 'package:crm_smart/view_model/event_provider.dart';
import 'package:crm_smart/view_model/invoice_vm.dart';
import 'package:crm_smart/view_model/lastcommentclient_vm.dart';
import 'package:crm_smart/view_model/level_vm.dart';
import 'package:crm_smart/view_model/maincity_vm.dart';
import 'package:crm_smart/view_model/notify_vm.dart';
import 'package:crm_smart/view_model/participate_vm.dart';
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
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constants.dart';

//import 'package:firebase_core/firebase_core.dart';

@pragma("entry-point")
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.

  //DefaultFirebaseOptions .currentPlatform );
  await Firebase.initializeApp();
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
  // if (Firebase.apps.isEmpty) {
  await Firebase.initializeApp(
      // name: "crm_smart",
      );

  await configureDependencies();
  // }

  // Set the background messaging handler early on, as a named top-level function

  if (Platform.isIOS) {
    await FirebaseMessaging.instance.requestPermission();
  }

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
  await initializeDateFormatting();

  runApp(ServiceProvider(
    child: MultiProvider(providers: [
      ChangeNotifierProvider<UserProvider>(
          create: (_) => UserProvider()),
      ChangeNotifierProvider<navigatorProvider>(
          create: (_) => navigatorProvider()),
      ChangeNotifierProvider<AuthProvider>(create: (_) => AuthProvider()),
      ChangeNotifierProvider<switch_provider>(create: (_) => switch_provider()),
      ChangeNotifierProvider<selected_button_provider>(
          create: (_) => selected_button_provider()),
      ChangeNotifierProvider<country_vm>(create: (_) => country_vm()),
      ChangeNotifierProxyProvider<UserProvider, config_vm>(
        create: (_) => config_vm(),
        update: (ctx, value, prev) => prev!..setvalue(value.currentUser),
      ),
      ChangeNotifierProxyProvider<UserProvider, level_vm>(
        create: (_) => level_vm(),
        update: (ctx, value, prev) => prev!..setvalue(value.currentUser),
      ),
      ChangeNotifierProvider<LoadProvider>(create: (_) => LoadProvider()),
      ChangeNotifierProxyProvider<UserProvider, product_vm>(
        create: (_) => product_vm(),
        update: (ctx, value, prev) => prev!..setvalue(value.currentUser),
      ),
      ChangeNotifierProvider<manage_provider>(create: (_) => manage_provider()),
      // ChangeNotifierProvider<privilge_vm>(create: (_) => privilge_vm()),
      ChangeNotifierProxyProvider<UserProvider, PrivilegeProvider>(
        create: (_) => PrivilegeProvider(),
        update: (ctx, value, prev) => prev!..setCurrentUser(value.currentUser),
      ),
      ChangeNotifierProxyProvider<UserProvider, RegionProvider>(
        create: (_) => RegionProvider(),
        update: (ctx, value, prev) => prev!..setCurrentUser(value.currentUser),
      ),

      ChangeNotifierProxyProvider<UserProvider, ClientProvider>(
        create: (_) => ClientProvider(),
        update: (ctx, value, prev) => prev!..setvalue(value.currentUser),
      ),
      ChangeNotifierProxyProvider<UserProvider, usertest_vm>(
        create: (_) => usertest_vm(),
        update: (ctx, value, prev) => prev!..setvalue(value.currentUser),
      ),
      ChangeNotifierProxyProvider<UserProvider, notifyvm>(
        create: (_) => notifyvm(),
        update: (ctx, value, prev) => prev!..setvalue(value.currentUser),
      ),

      ChangeNotifierProxyProvider<UserProvider, approve_vm>(
        create: (_) => approve_vm(),
        update: (ctx, value, prev) => prev!..setvalue(value.currentUser),
      ),
      ChangeNotifierProxyProvider<UserProvider, invoice_vm>(
        create: (_) => invoice_vm(),
        update: (ctx, value, prev) => prev!..setvalue(value.currentUser),
      ),
      ChangeNotifierProxyProvider<UserProvider, maincity_vm>(
        create: (_) => maincity_vm(),
        update: (ctx, value, prev) => prev!..setvalue(value.currentUser),
      ),
      ChangeNotifierProvider<ClientType>(create: (_) => ClientType()),
      ChangeNotifierProvider<EventProvider>(
        create: (_) => EventProvider(),
      ),
      ChangeNotifierProxyProvider<UserProvider, ticket_vm>(
        create: (_) => ticket_vm(),
        update: (ctx, value, prev) => prev!..setvalue(value.currentUser),
      ),
      ChangeNotifierProvider<comment_vm>(create: (_) => comment_vm()),
      ChangeNotifierProxyProvider<UserProvider, communication_vm>(
        create: (_) => communication_vm(),
        update: (ctx, value, prev) => prev!..setvalue(value.currentUser),
      ),

      ChangeNotifierProvider<datetime_vm>(create: (_) => datetime_vm()),
      ChangeNotifierProvider<ActivityVm>(create: (_) => ActivityVm()),
      ChangeNotifierProvider<company_vm>(create: (_) => company_vm()),
      ChangeNotifierProvider<participate_vm>(create: (_) => participate_vm()),
      ChangeNotifierProvider<AgentDistributorViewModel>(
          create: (_) => AgentDistributorViewModel()),
      ChangeNotifierProxyProvider<invoice_vm,
          AgentsCollaboratorsInvoicesViewmodel>(
        update: (context, invoiceVm, agentCollaborateVm) {
          if (agentCollaborateVm?.invoicesList.isEmpty ?? true)
            agentCollaborateVm?.setInvoicesList(invoiceVm.listInvoicesAccept);
          return agentCollaborateVm!;
        },
        create: (_) => AgentsCollaboratorsInvoicesViewmodel(),
      ),
      ChangeNotifierProxyProvider<UserProvider, lastcommentclient_vm>(
        create: (_) => lastcommentclient_vm(),
        update: (ctx, value, prev) => prev!..setvalue(value.currentUser),
      ),
      ChangeNotifierProvider<BranchRaceViewmodel>(
          create: (_) => BranchRaceViewmodel()),
      ChangeNotifierProvider<EmployeeRaceViewmodel>(
          create: (_) => EmployeeRaceViewmodel()),
    ], child: MyApp()),
  ));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isUserLoggedIn = false;
  late Future<SharedPreferences> currentUser;

  @override
  void initState() {
    currentUser =
        Provider.of<UserProvider>(context, listen: false).getcurrentuser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SharedPreferences>(
        future: currentUser,
        builder: (context, snapshot) {
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
          } else {
            isUserLoggedIn = snapshot.data!.getBool(kKeepMeLoggedIn) ?? false;
            if (snapshot.data!.getString('id_user1') == '0')
              return MaterialApp(
                home: Scaffold(
                  body: Center(
                    child: Text('غير مصرح لك الدخول'),
                  ),
                ),
              );
            // String idcurrentuser= snapshot.data!.getString("id_user").toString();
            else {
              return MaterialApp(
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
                  child: ScreenUtilInit(
                    useInheritedMediaQuery: true,
                    child: isUserLoggedIn ? Home() : login(),
                  ),
                ),
              );
            }
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
