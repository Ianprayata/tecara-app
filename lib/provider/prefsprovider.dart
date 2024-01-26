import '../files.dart';

class UserApp with ChangeNotifier {
  getUser(String id) async {
    await FirebaseFirestore.instance
        .collection('users')
        .where('id',
            isEqualTo: FirebaseAuth.instance.currentUser != null
                ? FirebaseAuth.instance.currentUser!.uid.toString()
                : id)
        .get();
  }
}
