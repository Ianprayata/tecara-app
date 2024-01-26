import '../files.dart';

class AddJournalScreen extends StatelessWidget {
  final TextEditingController title = TextEditingController();
  final TextEditingController description = TextEditingController();
  final TextEditingController todayFeeling = TextEditingController();
  final TextEditingController sadDescription = TextEditingController();
  final TextEditingController happyDescription = TextEditingController();
  AddJournalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    JournalingService journalService = JournalingService();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: purple,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset("images/Back_Icon.png",
              width: 20, height: 20, color: white),
        ),
        centerTitle: true,
        title: Text(
          "Jurnal harian",
          style: subheading.copyWith(color: white, fontWeight: semiBold),
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(15),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Judul",
                  style:
                      mediumText.copyWith(color: black, fontWeight: semiBold),
                ),
                Container(
                  padding: const EdgeInsets.all(15),
                  margin: const EdgeInsets.only(top: 5, bottom: 15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      gradient: linearGradient),
                  child: TextFormField(
                      style:
                          smallText.copyWith(color: white, fontWeight: regular),
                      controller: title,
                      decoration: InputDecoration.collapsed(
                          hintText: "Ketik judul untuk jurnal ini",
                          hintStyle: smallText.copyWith(color: white))),
                ),
                Text(
                  "Bagaimana perasaanmu hari ini?",
                  style:
                      mediumText.copyWith(color: black, fontWeight: semiBold),
                ),
                Container(
                  padding: const EdgeInsets.all(15),
                  margin: const EdgeInsets.only(top: 5, bottom: 15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      gradient: linearGradient),
                  child: TextFormField(
                      style:
                          smallText.copyWith(color: white, fontWeight: regular),
                      controller: todayFeeling,
                      decoration: InputDecoration.collapsed(
                          hintText: "Ketik disini",
                          hintStyle: smallText.copyWith(color: white))),
                ),
                Text(
                  "Adakah yang membuatmu merasa sedih hari ini?",
                  style:
                      mediumText.copyWith(color: black, fontWeight: semiBold),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 7,
                  padding: const EdgeInsets.all(15),
                  margin: const EdgeInsets.only(top: 5, bottom: 15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      gradient: linearGradient),
                  child: TextFormField(
                      style:
                          smallText.copyWith(color: white, fontWeight: regular),
                      controller: sadDescription,
                      expands: true,
                      maxLines: null,
                      decoration: InputDecoration.collapsed(
                          hintText: "Ketik disini",
                          hintStyle: smallText.copyWith(color: white))),
                ),
                Text(
                  "Adakah yang membuatmu merasa senang hari ini?",
                  style:
                      mediumText.copyWith(color: black, fontWeight: semiBold),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 7,
                  padding: const EdgeInsets.all(15),
                  margin: const EdgeInsets.only(top: 5, bottom: 15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      gradient: linearGradient),
                  child: TextFormField(
                      style:
                          smallText.copyWith(color: white, fontWeight: regular),
                      controller: happyDescription,
                      expands: true,
                      maxLines: null,
                      decoration: InputDecoration.collapsed(
                          hintText: "Ketik disini",
                          hintStyle: smallText.copyWith(color: white))),
                ),
                Text(
                  "Ada cerita apa hari ini?",
                  style:
                      mediumText.copyWith(color: black, fontWeight: semiBold),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 3,
                  padding: const EdgeInsets.all(15),
                  margin: const EdgeInsets.only(top: 5, bottom: 15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      gradient: linearGradient),
                  child: TextFormField(
                    controller: description,
                    style:
                        smallText.copyWith(color: white, fontWeight: regular),
                    keyboardType: TextInputType.multiline,
                    expands: true,
                    maxLines: null,
                    decoration: InputDecoration.collapsed(
                      hintText: "Ketik disini",
                      hintStyle: smallText.copyWith(color: white),
                    ),
                  ),
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () async {
                      if (title.text == "" ||
                          description.text == "" ||
                          todayFeeling.text == "" ||
                          sadDescription.text == "" ||
                          happyDescription.text == "") {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            duration: const Duration(seconds: 2),
                            backgroundColor: heavyRed,
                            content: Text(
                              'Mohon isi seluruh bagian',
                              style: regularText.copyWith(
                                color: white,
                                fontWeight: semiBold,
                              ),
                            ),
                          ),
                        );
                      } else {
                        final journalId = const Uuid().v4();

                        await journalService.addJournal(
                          context,
                          journalId: journalId,
                          title: title.text,
                          description: description.text,
                          date:
                              '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}',
                          todayFeeling: todayFeeling.text,
                          sadDescription: sadDescription.text,
                          happyDescription: happyDescription.text,
                        );
                        Navigator.pop(context);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      alignment: Alignment.center,
                      backgroundColor: purple,
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.3,
                          vertical: 15),
                    ),
                    child: Text(
                      "Submit",
                      style: mediumText.copyWith(
                          color: white, fontWeight: semiBold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
