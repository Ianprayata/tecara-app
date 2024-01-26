import 'package:tecara_opsi/files.dart';
import "package:salomon_bottom_bar/salomon_bottom_bar.dart";

class NavigationBars extends StatefulWidget {
  const NavigationBars({super.key});

  @override
  State<NavigationBars> createState() => _NavigationBarsState();
}

class _NavigationBarsState extends State<NavigationBars>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    setStatus('online');
  }

  void setStatus(status) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({'status': status});
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      setStatus('online');
    } else {
      setStatus('offline');
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    NavbarProvider navbarProvider = Provider.of<NavbarProvider>(context);
    return Scaffold(
      bottomNavigationBar: SalomonBottomBar(
        margin: const EdgeInsets.all(30),
        backgroundColor: white,
        onTap: (newVal) => {navbarProvider.indexPage = newVal},
        currentIndex: navbarProvider.currentIndex,
        items: [
          SalomonBottomBarItem(
            icon: Image.asset(
              "images/homeicon.png",
              fit: BoxFit.cover,
              width: 24,
              height: 24,
            ),
            activeIcon: Image.asset(
              "images/homeicon_active.png",
              fit: BoxFit.cover,
              width: 24,
              height: 24,
            ),
            title: const Text(""),
          ),
          SalomonBottomBarItem(
            icon: Image.asset(
              "images/chaticon.png",
              fit: BoxFit.cover,
              width: 24,
              height: 24,
            ),
            activeIcon: Image.asset(
              "images/chaticon_active.png",
              fit: BoxFit.cover,
              width: 24,
              height: 24,
            ),
            title: const Text(""),
          ),
          SalomonBottomBarItem(
            icon: Image.asset(
              "images/exploreicon.png",
              fit: BoxFit.cover,
              width: 24,
              height: 24,
            ),
            unselectedColor: subtleGrey,
            title: const Text(""),
            activeIcon: Image.asset(
              "images/exploreicon_active.png",
              fit: BoxFit.cover,
              width: 24,
              height: 24,
            ),
          ),
          SalomonBottomBarItem(
            icon: Image.asset(
              "images/educon.png",
              fit: BoxFit.cover,
              width: 24,
              height: 24,
            ),
            activeIcon: Image.asset(
              "images/educon_active.png",
              fit: BoxFit.cover,
              width: 24,
              height: 24,
            ),
            title: const Text(""),
          ),
          SalomonBottomBarItem(
            icon: Image.asset(
              "images/profileicon.png",
              fit: BoxFit.cover,
              width: 24,
              height: 24,
            ),
            activeIcon: Image.asset(
              "images/profileicon_active.png",
              fit: BoxFit.cover,
              width: 24,
              height: 24,
            ),
            title: const Text(""),
          ),
        ],
      ),
      body: navbarProvider.pages[navbarProvider.currentIndex],
    );
  }
}
