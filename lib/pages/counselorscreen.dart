import '../files.dart';

class CounselorScreen extends StatelessWidget {
  const CounselorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Image.asset("images/detailimg.png",
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                        height: MediaQuery.of(context).size.height * 1 / 4),
                    Positioned(
                      left: 10,
                      top: 15,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.popAndPushNamed(context, "/nav-bar");
                        },
                        style: ElevatedButton.styleFrom(
                            alignment: Alignment.center,
                            backgroundColor: white,
                            elevation: 5,
                            padding: const EdgeInsets.all(15),
                            shape: const CircleBorder()),
                        child: Image.asset(
                          "images/arrow_back.png",
                          width: 24,
                          fit: BoxFit.cover,
                          alignment: Alignment.center,
                          color: purple,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                  child: Text(
                    "Dr. Ahmad Gunawan S.Pd, M.Pd",
                    style: subheading.copyWith(
                      color: black,
                      fontWeight: semiBold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 15,
                  ),
                  child: Text("Psikolog anak & remaja",
                      style: regularText.copyWith(
                        color: purple,
                        fontWeight: regular,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                      "Spesialis menangani Stress, Trauma, & Masalah Keluarga",
                      style: smallText.copyWith(
                        color: black,
                        fontWeight: regular,
                      )),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: green,
                  ),
                  child: Row(
                    children: [
                      Image.asset("images/info.png", width: 24, height: 24),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Text(
                          "60 Menit sesi konsultasi (via chat / telepon), saran profesional dari konselor, anonimitas pengguna, & history chat konsultasi",
                          style: smallText.copyWith(
                            color: white,
                            fontWeight: medium,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(color: grey, thickness: 2),
                Container(
                    margin: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 30),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: lightBlue),
                    child: Row(
                      children: [
                        Image.asset("images/clock.png", width: 24),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(
                          "Berpengalaman selama 9 tahun",
                          style: smallText.copyWith(
                            color: black,
                            fontWeight: medium,
                          ),
                        ),
                      ],
                    )),
                Container(
                    margin: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 30),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: lightBlue),
                    child: Row(
                      children: [
                        Image.asset("images/location.png", width: 24),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: Text(
                            "Bekerja  di Rs. Saiful Anwar, Kota Malang",
                            style: smallText.copyWith(
                              color: black,
                              fontWeight: medium,
                            ),
                          ),
                        ),
                      ],
                    )),
                Container(
                  margin: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: lightBlue),
                  child: Row(
                    children: [
                      Image.asset("images/thumbsup.png", width: 24),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: Text(
                          "Terverifikasi dengan rating 8.5/10",
                          style: smallText.copyWith(
                            color: black,
                            fontWeight: medium,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      bottomNavigationBar: BottomAppBar(
        elevation: 20,
        clipBehavior: Clip.antiAlias,
        height: MediaQuery.of(context).size.height / 10,
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Rp. 50.000",
                  style:
                      mediumText.copyWith(color: black, fontWeight: semiBold),
                ),
                Expanded(
                  child: Text(
                    "Untuk 1x sesi konsultasi",
                    maxLines: 1,
                    style:
                        smallText.copyWith(color: purple, fontWeight: regular),
                  ),
                )
              ],
            ),
            const Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                alignment: Alignment.center,
                backgroundColor: purple,
                elevation: 10,
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 10),
              ),
              child: Text(
                "Chat Sekarang",
                style: regularText.copyWith(
                  color: white,
                  fontWeight: regular,
                ),
              ),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
