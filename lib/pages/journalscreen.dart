import '../files.dart';

class JournalScreen extends StatelessWidget {
  final JournalModels models;
  JournalScreen({Key? key, required this.models}) : super(key: key);

  final TextEditingController _feelingsToday = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(color: Colors.transparent),
          padding: const EdgeInsets.all(15),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset(
                        "images/Back_Icon.png",
                        width: 24,
                        height: 24,
                      )),
                  InkWell(
                    child: Image.asset(
                      'images/trash.png',
                      width: 30,
                      height: 30,
                    ),
                    onTap: () async {
                      showDialog(
                          context: context,
                          builder: ((BuildContext context) {
                            return AlertDialog(
                              content: Text(
                                "Apakah anda ingin menghapus jurnal ini?",
                                style: mediumText.copyWith(
                                    color: black, fontWeight: medium),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    "Tidak, kembali",
                                    style: regularText.copyWith(color: black),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () async {
                                    await FirebaseFirestore.instance
                                        .collection('journals')
                                        .doc(models.journalId)
                                        .delete();

                                    Navigator.popAndPushNamed(
                                        context, '/nav-bar');
                                  },
                                  child: Text(
                                    "Iya, hapus",
                                    style: regularText.copyWith(
                                      color: heavyRed,
                                      fontWeight: semiBold,
                                    ),
                                  ),
                                )
                              ],
                            );
                          }));
                    },
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Text(
                models.title,
                style: heading2.copyWith(
                  color: purple,
                  fontWeight: bold,
                ),
                maxLines: 2,
              ),
              const Divider(color: grey),
              Text(
                "Dibuat pada tanggal: ${models.dateMade}",
                style: smallText.copyWith(color: grey, fontWeight: bold),
              ),
              const SizedBox(height: 15),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: const BoxDecoration(
                      gradient: linearGradient,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(15),
                      )),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Bagaimana perasaanmu hari ini?",
                        style: mediumText.copyWith(
                            color: white, fontWeight: semiBold),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5, bottom: 15),
                        child: TextFormField(
                          controller: _feelingsToday,
                          decoration: InputDecoration.collapsed(
                            hintText: models.todayFeeling.toString(),
                            hintStyle: smallText.copyWith(
                                color: white, fontWeight: regular),
                          ),
                          style: smallText.copyWith(
                              color: white, fontWeight: regular),
                        ),
                      ),
                      Text(
                        "Adakah yang membuatmu merasa sedih hari ini?",
                        style: mediumText.copyWith(
                            color: white, fontWeight: semiBold),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5, bottom: 15),
                        child: Text(
                          models.sadFeeling,
                          style: smallText.copyWith(
                              color: white, fontWeight: regular),
                        ),
                      ),
                      Text(
                        "Adakah yang membuatmu merasa senang hari ini?",
                        style: mediumText.copyWith(
                            color: white, fontWeight: semiBold),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        models.happyFeeling,
                        style: smallText.copyWith(
                          color: white,
                          fontWeight: regular,
                        ),
                      ),
                      const Padding(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          child: Divider(color: white)),
                      Text(models.description,
                          style: smallText.copyWith(
                            color: white,
                            fontWeight: regular,
                          )),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
      floatingActionButton: FloatingActionButton(
          backgroundColor: lightBlue,
          isExtended: true,
          onPressed: () {},
          child: Image.asset(
            "images/editjournal.png",
            width: 30,
          )),
    );
  }
}
