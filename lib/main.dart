import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medical_app/home/home_doctor.dart';
import 'package:medical_app/home/user_home.dart';
import 'package:medical_app/on_boarding_screen/on_boarding_screen.dart';
import 'package:medical_app/patient/notification_screen.dart';
import 'package:medical_app/provider/chat_provider.dart';
import 'package:medical_app/splash_screen/splash_screnn.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ChangeNotifier>(
      create: (context) => ChatService(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home:
            SplashScreenWrapper(), // Use SplashScreenWrapper to handle initial navigation
      ),
    );
  }
}

class SplashScreenWrapper extends StatefulWidget {
  @override
  _SplashScreenWrapperState createState() => _SplashScreenWrapperState();
}

class _SplashScreenWrapperState extends State<SplashScreenWrapper> {
  @override
  void initState() {
    super.initState();
    _navigateToHome(FirebaseAuth.instance.currentUser?.uid ?? '');
  }

  // Future<void> checkUserLogin() async {
  //   FirebaseAuth auth = FirebaseAuth.instance;
  //   User? user = auth.currentUser;

  //   if (user == null) {
  //     // User is not logged in, navigate to SplashScreen
  //     Navigator.pushReplacement(
  //       context,
  //       MaterialPageRoute(builder: (context) => OnboarSdingScreen()),
  //     );
  //   } else {
  //     // User is logged in, determine user role and navigate accordingly
  //     await _navigateToHome(user.uid);
  //   }
  // }

  Future<void> _navigateToHome(String userId) async {
    try {
      DocumentSnapshot doctorSnapshot = await FirebaseFirestore.instance
          .collection('doctors')
          .doc(userId)
          .get();
      if (doctorSnapshot.exists) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => DoctorHomeScreen(),
          ),
          (route) => false,
        );
      } else {
        DocumentSnapshot patientSnapshot = await FirebaseFirestore.instance
            .collection('patients')
            .doc(userId)
            .get();
        if (patientSnapshot.exists) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => UserHome(),
            ),
            (route) => false,
          );
        } else {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => OnboardingScreen(),
            ),
            (route) => false,
          );
        }
      }
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Navigation Error')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SplashScreen(); // Placeholder widget until user's login status is checked
  }
}
