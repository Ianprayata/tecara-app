import '../files.dart';

class ChatService {
  String? userState;
  User? currentUser = FirebaseAuth.instance.currentUser;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<QuerySnapshot<Object?>> getAllUser() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(currentUser!.uid)
        .get()
        .then((value) {
      userState = value.data()!['user'];
    });

    return firestore
        .collection('users')
        .where('user', isNotEqualTo: userState)
        .get();
  }
}

class ChatStart {
  User? currentUser = FirebaseAuth.instance.currentUser;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  String currentSender = "";

  getChatRoom(String chatroomId) {
    firestore
        .collection('chatroom')
        .doc(chatroomId)
        .collection('messages')
        .orderBy("time", descending: false)
        .snapshots();
  }


}
