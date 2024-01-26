import 'package:tecara_opsi/files.dart';
import 'package:tecara_opsi/pages/counselorscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => NavbarProvider()),
        ChangeNotifierProvider(create: (context) => LoginState()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: "/",
        routes: {
          "/": (context) => const SplashScreen(),
          "/login": (context) => LoginScreen(),
          "/signup": (context) => SignUpScreen(),
          "/nav-bar": (context) => const NavigationBars(),
          "/detail_counselor": (context) => const CounselorScreen(),
          "/add-journal": (context) =>  AddJournalScreen(),
        },
      ),
    );
  }
}
