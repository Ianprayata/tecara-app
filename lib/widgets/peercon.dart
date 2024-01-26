import '../files.dart';

class CounselorCard extends StatelessWidget {
  final CounselorModel cons;
  const CounselorCard({required this.cons, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () {
          Navigator.pushNamed(
            context,
            "/detail_counselor",
            arguments: {
              "name": cons.name,
              "categories:": cons.categories,
              "specialist": cons.specialist,
            },
          );
        },
        child: Container(
          width: MediaQuery.of(context).size.width * 330 / 390,
          height: MediaQuery.of(context).size.height * 100 / 844,
          padding: const EdgeInsets.only(left: 15, top: 15, bottom: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: white,
            border: Border.all(
              strokeAlign: 0.5,
              color: grey,
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                cons.imgUrl == "" ? "images/circularprofile.png" : cons.imgUrl,
                fit: BoxFit.cover,
              ),
              const SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(cons.name,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: regularText.copyWith(
                          color: black, fontWeight: semiBold)),
                  Text(
                    cons.categories,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: smallText.copyWith(color: purple, fontWeight: bold),
                  ),
                  const Spacer(),
                  Text(
                    cons.specialist,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: smallText.copyWith(color: grey, fontWeight: regular),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
