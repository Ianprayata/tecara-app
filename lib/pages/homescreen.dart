import '../files.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    User? currentUser = FirebaseAuth.instance.currentUser;
    debugPrint(currentUser!.uid.toString());
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 30 / 390),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset(
                        "images/notification.png",
                        width: 24,
                        height: 24,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical:
                            MediaQuery.of(context).size.height * 35 / 844),
                    child: Image.asset(
                      "images/illustration.png",
                      width: MediaQuery.of(context).size.width * 330 / 390,
                      height: MediaQuery.of(context).size.height * 112 / 844,
                    ),
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Kategori",
                            style: regularText.copyWith(
                                color: black, fontWeight: semiBold)),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Lihat semua",
                            style: regularText.copyWith(
                                color: purple, fontWeight: semiBold),
                          ),
                        )
                      ]),
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            CategoryCard(
                                model: CategoriesModel(
                              id: 0,
                              category: "Depresi",
                              imgUrl: "images/depresi.png",
                            )),
                            CategoryCard(
                                model: CategoriesModel(
                              id: 1,
                              category: "Stress",
                              imgUrl: "images/stress.png",
                            )),
                            CategoryCard(
                                model: CategoriesModel(
                              id: 2,
                              category: "Keluarga",
                              imgUrl: "images/fams.png",
                            )),
                            CategoryCard(
                              model: CategoriesModel(
                                id: 3,
                                category: "Trauma",
                                imgUrl: "images/anxiety.png",
                              ),
                            ),
                            CategoryCard(
                              model: CategoriesModel(
                                id: 3,
                                category: "Pendidikan",
                                imgUrl: "images/depresi.png",
                              ),
                            ),
                          ],
                        ),
                      )),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Peer counselor",
                            style: regularText.copyWith(
                                color: black, fontWeight: semiBold)),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Lihat semua",
                            style: regularText.copyWith(
                                color: purple, fontWeight: semiBold),
                          ),
                        )
                      ]),
                  CounselorCard(
                    cons: CounselorModel(
                      id: 0,
                      name: "Dr. Teguh Gunawan",
                      categories: "Psikolog anak & remaja",
                      imgUrl: "",
                      specialist: "Stress, Depresi, Hubungan",
                    ),
                  ),
                  CounselorCard(
                    cons: CounselorModel(
                      id: 1,
                      name: "Dr. Dewangga Susanto",
                      categories: "Psikolog anak & remaja",
                      imgUrl: "",
                      specialist: "Stress, Depresi, Hubungan",
                    ),
                  ),
                  CounselorCard(
                    cons: CounselorModel(
                      id: 2,
                      name: "Dr. Heni Kusumawijaya",
                      categories: "Psikolog anak & remaja",
                      imgUrl: "",
                      specialist: "Stress, Depresi, Hubungan",
                    ),
                  ),
                  CounselorCard(
                    cons: CounselorModel(
                      id: 3,
                      name: "Dr. Santi Susanto",
                      categories: "Psikolog anak & remaja",
                      imgUrl: "",
                      specialist: "Stress, Depresi, Hubungan",
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
