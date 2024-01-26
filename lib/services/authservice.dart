import '../files.dart';

class AuthService {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<User?> register(BuildContext context,
      {required String email,
      required String password,
      required String username,
      required String instance,
      required String fullname,
      required String user}) async {
    try {
      UserCredential userCred = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      if (userCred.user != null) {
        debugPrint("this should be in");
        DocumentReference storeAuth = FirebaseFirestore.instance
            .collection("users")
            .doc(userCred.user!.uid);
        await storeAuth.set({
          'id': userCred.user!.uid,
          'name': fullname,
          'username': username,
          'instance': instance,
          'email': email,
          'user': user,
          'status': 'online'
        });
      }

      return userCred.user;
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: heavyRed,
        content: Text(
          e.message.toString(),
          style: regularText.copyWith(
            color: white,
            fontWeight: semiBold,
          ),
        ),
      ));
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<User?> login(
      String email, String password, BuildContext context) async {
    try {
      UserCredential userCred = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);

      return userCred.user;
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: heavyRed,
        content: Text(
          e.message.toString(),
          style: regularText.copyWith(
            color: white,
            fontWeight: semiBold,
          ),
        ),
      ));
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}

class UserInfoApp {
  static getUserStatic(String id) {
    return FirebaseFirestore.instance
        .collection('users')
        .where('id',
            isEqualTo: FirebaseAuth.instance.currentUser != null
                ? FirebaseAuth.instance.currentUser!.uid.toString()
                : id)
        .get();
  }
}
