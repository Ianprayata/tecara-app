import '../files.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(
              left: 15, top: MediaQuery.of(context).size.height * 50 / 844),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: FutureBuilder<QuerySnapshot>(
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              while (snapshot.data == null) {
                return const Center(
                    child: CircularProgressIndicator.adaptive(
                  backgroundColor: purple,
                ));
              }
              final data = snapshot.data!.docs[0];
              if (snapshot.hasData && snapshot.data != null) {
                debugPrint("not null");
                return SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Image.asset("images/circularprofile.png",
                            fit: BoxFit.cover,
                            height: MediaQuery.of(context).size.height / 5),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Center(
                          child: Text(
                            data['username'].toString(),
                            style: subheading.copyWith(
                                color: black, fontWeight: semiBold),
                          ),
                        ),
                      ),
                      const Divider(color: grey, thickness: 1),
                      Text(
                        "My Activity",
                        style: mediumText.copyWith(
                            color: black, fontWeight: semiBold),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 15, top: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Konten yang disimpan",
                              style: regularText.copyWith(
                                color: black,
                                fontWeight: regular,
                              ),
                            ),
                            Image.asset(
                              "images/dropleft.png",
                              width: 24,
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 15, top: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Konten yang disimpan",
                              style: regularText.copyWith(
                                color: black,
                                fontWeight: regular,
                              ),
                            ),
                            Image.asset(
                              "images/dropleft.png",
                              width: 24,
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 15, top: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Konten yang disimpan",
                              style: regularText.copyWith(
                                color: black,
                                fontWeight: regular,
                              ),
                            ),
                            Image.asset(
                              "images/dropleft.png",
                              width: 24,
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return const Center(
                    child: CircularProgressIndicator(
                  backgroundColor: purple,
                ));
              }
            },
            future: UserInfoApp.getUserStatic(
                FirebaseAuth.instance.currentUser!.uid.toString()),
          ),
        ),
      ),
    );
  }
}
