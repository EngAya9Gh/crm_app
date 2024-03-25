import 'dart:io';

import 'package:crm_smart/core/di/di_container.dart';
import 'package:crm_smart/features/clients_care/clients_tickets/domain/use_cases/edit_ticket_type_usecase.dart';
import 'package:crm_smart/provider/authprovider.dart';
import 'package:crm_smart/provider/bottomNav.dart';
import 'package:crm_smart/provider/config_vm.dart';
import 'package:crm_smart/provider/loadingprovider.dart';
import 'package:crm_smart/provider/manage_provider.dart';
import 'package:crm_smart/provider/selected_button_provider.dart';
import 'package:crm_smart/provider/switch_provider.dart';
import 'package:crm_smart/services/service_provider.dart';
import 'package:crm_smart/ui/screen/login.dart';
import 'package:crm_smart/view_model/activity_vm.dart';
import 'package:crm_smart/view_model/agent_collaborators_invoices_vm.dart';
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
import 'package:crm_smart/view_model/maincity_vm.dart';
import 'package:crm_smart/view_model/notify_vm.dart';
import 'package:crm_smart/view_model/participate_vm.dart';
import 'package:crm_smart/view_model/product_vm.dart';
import 'package:crm_smart/view_model/reason_suspend.dart';
import 'package:crm_smart/view_model/regoin_vm.dart';
import 'package:crm_smart/view_model/ticket_vm.dart';
import 'package:crm_smart/view_model/typeclient.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:crm_smart/view_model/usertest_vm.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constants.dart';
import 'core/common/manager/custom_bloc_observer.dart';
import 'core/config/theme/theme.dart';
import 'core/utils/app_navigator.dart';
import 'features/app/presentation/pages/splash_screen.dart';
import 'features/app/presentation/widgets/app_loader_widget/app_loader.dart';

//import 'package:firebase_core/firebase_core.dart';

@pragma("entry-point")
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.

  //DefaultFirebaseOptions .currentPlatform );
  await Firebase.initializeApp();
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

  //
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
  Bloc.observer = CustomBlocObserver();
  await initializeDateFormatting();

  runApp(ServiceProvider(
    child: MultiProvider(providers: [
      ChangeNotifierProvider<UserProvider>(create: (_) => UserProvider()),
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
      ChangeNotifierProvider<LoadProvider>(create: (_) => LoadProvider()),
      ChangeNotifierProxyProvider<UserProvider, product_vm>(
        create: (_) => product_vm(),
        update: (ctx, value, prev) => prev!..setvalue(value.currentUser),
      ),
      ChangeNotifierProvider<manage_provider>(create: (_) => manage_provider()),
      // ChangeNotifierProvider<privilge_vm>(create: (_) => privilge_vm()),
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
      ChangeNotifierProxyProvider<UserProvider, MainCityProvider>(
        create: (_) => MainCityProvider(),
        update: (ctx, value, prev) => prev!..setvalue(value.currentUser),
      ),
      ChangeNotifierProvider<ClientTypeProvider>(
          create: (_) => ClientTypeProvider()),
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
      ChangeNotifierProvider<ActivityProvider>(
          create: (_) => ActivityProvider()),
      ChangeNotifierProvider<CompanyProvider>(create: (_) => CompanyProvider()),
      ChangeNotifierProvider<participate_vm>(create: (_) => participate_vm()),
      ChangeNotifierProvider<reason_suspend>(create: (_) => reason_suspend()),
      // ChangeNotifierProvider<AgentDistributorViewModel>(
      //     create: (_) => AgentDistributorViewModel()),
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
    getIt<EditTicketTypeUseCase>().call(EditTicketTypeParams(
        idTicket: '1530',
        typeTicket: 'close',
        notes: '1',
        // notesRate: '1',
        // rate: '1',
        notesTicket: '1',
        categoriesTicketFk: "[22,23]",
        subcategoriesTicket: "[15]"));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      child: FutureBuilder<SharedPreferences>(
        future: currentUser,
        builder: (context, snapshot) {
          Widget homeWidget;
          if (!snapshot.hasData) {
            homeWidget = Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assest/images/logo_crm_long.png'),
                    SizedBox(height: 20),
                    AppLoader(),
                  ],
                ),
              ),
            );
          } else {
            isUserLoggedIn = snapshot.data!.getBool(kKeepMeLoggedIn) ?? false;
            if (snapshot.data!.getString('id_user1') == '0') {
              homeWidget = Scaffold(
                body: Center(
                  child: Text('غير مصرح لك الدخول'),
                ),
              );
            } else {
              homeWidget = Directionality(
                textDirection: TextDirection.rtl,
                child: SplashScreen(),
              );
            }
          }

          return MaterialApp(
            navigatorKey: AppNavigator.navigatorKey,
            debugShowCheckedModeBanner: false,
            title: 'Smart CRM',
            theme: AppTheme.light(context),
            home: homeWidget,
          );
        },
      ),
    );
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
