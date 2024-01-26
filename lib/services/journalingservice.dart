import '../files.dart';

class JournalingService {
  User? currentUser = FirebaseAuth.instance.currentUser;
  final firestore = FirebaseFirestore.instance;

  Future addJournal(BuildContext context,
      {required journalId,
      required String title,
      required String description,
      required String date,
      required String todayFeeling,
      required String sadDescription,
      required String happyDescription}) async {
    DocumentReference storeJournal =
        firestore.collection("journals").doc(journalId);

    await storeJournal.set({
      'journalId': journalId,
      'title': title,
      'description': description,
      'date': date,
      'todayFeeling': todayFeeling,
      'sadDescription': sadDescription,
      'happyDescription': happyDescription
    });
  }

  getJournals() {
    return firestore.collection("journals");
  }
}
