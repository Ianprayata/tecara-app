import '../files.dart';

class AccountScreen extends StatefulWidget {
  AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  User? currentUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        backgroundColor: subtleGrey,
        appBar: AppBar(
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(
                  Icons.chat_rounded,
                  color: purple,
                ),
              ),
              Tab(
                icon: Icon(Icons.people_alt, color: purple),
              )
            ],
          ),
          toolbarHeight: MediaQuery.of(context).size.height * 0.085,
          actions: [
            ClipRRect(
              clipBehavior: Clip.antiAlias,
              borderRadius: BorderRadius.circular(20),
              child: InkWell(
                onTap: () {},
                child: Image.asset(
                  "images/chathistory.png",
                  width: 24,
                  height: 24,
                ),
              ),
            ),
            const SizedBox(width: 30),
          ],
          centerTitle: true,
          elevation: 0,
          backgroundColor: white,
          title: Text(
            "Bantuan Pesan",
            style: subheading.copyWith(
              color: black,
              fontWeight: semiBold,
            ),
          ),
        ),
        body: TabBarView(children: <Widget>[
          FutureBuilder<QuerySnapshot>(
            builder: (BuildContext context, snapshot) {
              while (snapshot.data == null) {
                return const Center(
                    child: CircularProgressIndicator.adaptive(
                  backgroundColor: purple,
                ));
              }
              if (snapshot.hasData) {
                return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, index) {
                    return ContactCard(
                      contactInfo: ContactModel(
                          imgUrl: "",
                          name: snapshot.data!.docs[index]['username'],
                          id: index,
                          msg: "you"),
                    );
                  },
                  itemCount: snapshot.data!.docs.length,
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator.adaptive(
                    backgroundColor: purple,
                  ),
                );
              }
            },
            future: ChatService().getAllUser(),
          ),
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ContactCard(
                    contactInfo: ContactModel(
                      id: 0,
                      imgUrl: "",
                      name: "Ian Prayata",
                      msg:
                          "Iyaa kalau awikwokwokwoasdkjfhadjfhaldjfhalkdjfhadjfakjdfhakjdfhalkkhfaksjdfhakhdfsakjhd",
                    ),
                  ),
                  ContactCard(
                    contactInfo: ContactModel(
                      id: 1,
                      imgUrl: "",
                      name: "Faradina Dimana",
                      msg:
                          "Iyaa kalau awikwokwokwoasdkjfhadjfhaldjfhalkdjfhadjfakjdfhakjdfhalkkhfaksjdfhakhdfsakjhd",
                    ),
                  ),
                  ContactCard(
                    contactInfo: ContactModel(
                      id: 2,
                      imgUrl: "",
                      name: "Yanto",
                      msg:
                          "Iyaa kalau awikwokwokwoasdkjfhadjfhaldjfhalkdjfhadjfakjdfhakjdfhalkkhfaksjdfhakhdfsakjhd",
                    ),
                  ),
                ],
              ),
            ),
          ),
          // SingleChildScrollView(
          //   child: SizedBox(
          //       width: MediaQuery.of(context).size.width,
          //       height: MediaQuery.of(context).size.height,
          //       child: Column(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //           ContactCard(
          //             contactInfo: ContactModel(
          //               id: 1,
          //               imgUrl: "",
          //               name: "Grup mak mak",
          //               msg:
          //                   "ituloo jeng anaknya si badrul kemarin malem pergi sama junaedi",
          //             ),
          //           ),
          //         ],
          //       )),
          // )
        ]),
      ),
    );
  }
}
