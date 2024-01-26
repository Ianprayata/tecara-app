import '../files.dart';

class NavbarProvider with ChangeNotifier {
  final List<Widget> _pages = [
    const HomeScreen(),
     AccountScreen(),
    const JournalingScreen(),
    const EduScreen(),
    const ProfileScreen(),
  ];

  List<Widget> get pages => _pages;

  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  set indexPage(newIndex) {
    _currentIndex = newIndex;
    notifyListeners();
  }
}
