import '../files.dart';

class JournalingScreen extends StatelessWidget {
  const JournalingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    JournalingService _service = JournalingService();
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.085,
        centerTitle: true,
        elevation: 0,
        backgroundColor: white,
        title: Text(
          "Journaling Tools",
          style: subheading.copyWith(
            color: black,
            fontWeight: semiBold,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          primary: true,
          clipBehavior: Clip.none,
          physics: const BouncingScrollPhysics(),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Image.asset(
                    "images/journalingillust.png",
                    width: MediaQuery.of(context).size.width * 330 / 390,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(30),
                  child: SingleChildScrollView(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [],
                    ),
                  ),
                ),
                Expanded(
                  child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('journals')
                        .snapshots(),
                    builder: (BuildContext context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                            child: CircularProgressIndicator.adaptive(
                          backgroundColor: purple,
                        ));
                      } else if (snapshot.connectionState ==
                          ConnectionState.active) {
                        if (snapshot.data!.docs.isNotEmpty) {
                          return ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            primary: false,
                            clipBehavior: Clip.none,
                            itemBuilder: (BuildContext context, int index) {
                              return JournalingCard(
                                model: JournalModels(
                                    journalId: snapshot
                                        .data!.docs[index]['journalId']
                                        .toString(),
                                    happyFeeling: snapshot
                                        .data!.docs[index]['happyDescription']
                                        .toString(),
                                    sadFeeling: snapshot
                                        .data!.docs[index]['sadDescription']
                                        .toString(),
                                    todayFeeling: snapshot
                                        .data!.docs[index]['todayFeeling']
                                        .toString(),
                                    description: snapshot
                                        .data!.docs[index]['description']
                                        .toString(),
                                    title: snapshot.data!.docs[index]['title']
                                        .toString(),
                                    dateMade: snapshot.data!.docs[index]['date']
                                        .toString()),
                              );
                            },
                            itemCount: snapshot.data!.docs.length,
                          );
                        }
                      } else {
                        return const Center(
                          child: Text("Tidak ada data jurnaling"),
                        );
                      }
                      return const Center(
                        child: Text("Tidak ada data jurnaling"),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: purple,
        onPressed: () {
          Navigator.pushNamed(context, "/add-journal");
        },
        child: Image.asset(
          "images/plus_icon.png",
          width: 35,
        ),
      ),
    );
  }
}
