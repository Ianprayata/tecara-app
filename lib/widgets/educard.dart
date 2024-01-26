import '../files.dart';

class EduCard extends StatelessWidget {
  final EduModels edumodels;

  const EduCard({Key? key, required this.edumodels}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: const <BoxShadow>[
            BoxShadow(
              blurRadius: 2,
              color: grey,
            ),
            BoxShadow(
              blurRadius: 2,
              color: grey,
              offset: Offset(2, 2),
            ),
          ]),
      width: MediaQuery.of(context).size.width * 330 / 390,
      height: MediaQuery.of(context).size.height / 3.25,
      child: InkWell(
        onTap: () {},
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Image.asset(
                  edumodels.imgUrl == ""
                      ? "images/course.png"
                      : edumodels.imgUrl,
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width * 330 / 390),
            ),
            Container(
              padding: const EdgeInsets.all(
                15,
              ),
              decoration: const BoxDecoration(
                color: white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    edumodels.title,
                    style: regularText.copyWith(
                        color: black, fontWeight: semiBold),
                  ),
                  Text(
                    edumodels.madeBy,
                    style: smallText.copyWith(color: grey, fontWeight: regular),
                  ),
                  const SizedBox(height: 35),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        edumodels.dateMade,
                        style: smallText.copyWith(
                            color: black, fontWeight: regular),
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: lightRed,
                        ),
                        child: Text(
                          edumodels.isVideo == true ? "Video" : "Artikel",
                          style: smallText.copyWith(
                            color: white,
                            fontWeight: light,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: purple,
                        ),
                        child: Text(
                          edumodels.category,
                          style: smallText.copyWith(
                            color: white,
                            fontWeight: light,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
