import '../files.dart';

class CategoryCard extends StatelessWidget {
  final CategoriesModel model;
  const CategoryCard({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:
            EdgeInsets.only(right: MediaQuery.of(context).size.width * 1 / 17),
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          enableFeedback: true,
          onTap: () {},
          child: SizedBox(
            child: Column(children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: lightBlue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.asset(
                  model.imgUrl == "" ? "images/thumbsup.png" : model.imgUrl,
                  fit: BoxFit.cover,
                  height: model.imgUrl == "" ? 1 : 34,
                  width: model.imgUrl == "" ? 1 : 34,
                ),
              ),
              const SizedBox(height: 5),
              Text(model.category,
                  maxLines: 1,
                  style: smallText.copyWith(
                    color: black,
                    fontWeight: regular,
                  )),
            ]),
          ),
        ));
  }
}
