import '../files.dart';

class EduScreen extends StatelessWidget {
  const EduScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: white,
        elevation: 0,
        title: Text(
          "Education Screen",
          style: subheading.copyWith(
            color: black,
            fontWeight: semiBold,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: Image.asset(
                    "images/eduillust.png",
                    width: MediaQuery.of(context).size.width * 330 / 390,
                    height: MediaQuery.of(context).size.height * 112 / 844,
                    fit: BoxFit.cover,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "Sort by:",
                      style: regularText.copyWith(
                          color: black, fontWeight: regular),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: grey,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: DropdownButton(
                        enableFeedback: true,
                        isDense: true,
                        underline: const Divider(color: white),
                        elevation: 0,
                        items: <String>["Popularitas", "Durasi", "Rating"]
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: smallText.copyWith(
                                color: black,
                                fontWeight: regular,
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (x) {},
                        style: smallText.copyWith(
                            color: black, fontWeight: medium),
                        value: "Popularitas",
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: grey,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: DropdownButton(
                        enableFeedback: true,
                        isDense: true,
                        underline: const Divider(color: white),
                        elevation: 0,
                        items: <String>["Popularitas", "Durasi", "Rating"]
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: smallText.copyWith(
                                color: black,
                                fontWeight: regular,
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (x) {},
                        style: smallText.copyWith(
                            color: black, fontWeight: medium),
                        hint: const Text('filter'),
                      ),
                    ),
                  ],
                ),
                EduCard(
                  edumodels: EduModels(
                      title: "Cara memulai kebiasaan jurnaling setiap hari",
                      category: "Jurnaling",
                      dateMade: "2 minggu lalu",
                      id: 0,
                      imgUrl: "",
                      isVideo: true,
                      madeBy: "Dr. happy"),
                ),
                EduCard(
                  edumodels: EduModels(
                      title: "Cara mengatasi depresi",
                      category: "Depresi",
                      dateMade: "2 bulan lalu",
                      id: 1,
                      imgUrl: "",
                      isVideo: false,
                      madeBy: "Dr. not-so happy"),
                ),
                EduCard(
                  edumodels: EduModels(
                      title: "Depresi itu apa sih?",
                      category: "Edukasi",
                      dateMade: "1 tahun lalu",
                      id: 2,
                      imgUrl: "",
                      isVideo: false,
                      madeBy: "Dr. sad"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
