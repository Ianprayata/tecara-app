import '../files.dart';

class JournalingCard extends StatelessWidget {
  final JournalModels model;

  const JournalingCard({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 0, 30, 10),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => JournalScreen(
                        models: model,
                      )));
        },
        child: Stack(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 295 / 390,
              child: ClipRRect(
                clipBehavior: Clip.antiAlias,
                borderRadius: BorderRadius.circular(10),
                child: CustomPaint(
                  isComplex: true,
                  willChange: true,
                  painter: _MyPainter(),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          model.title,
                          style: mediumText.copyWith(
                            color: white,
                            fontWeight: bold,
                          ),
                        ),
                        const Divider(color: white, thickness: 2),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Text(
                            model.dateMade,
                            style: smallText.copyWith(
                              color: white,
                              fontWeight: light,
                            ),
                          ),
                        ),
                        Text(
                          model.description,
                          style: regularText.copyWith(
                            color: white,
                            fontWeight: regular,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 34),
                child: CircleAvatar(
                  backgroundColor: purple,
                  maxRadius: 30,
                  child: Image.asset("images/arrow_front.png",
                      width: 24, height: 24),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _MyPainter extends CustomPainter {
  final avatarRadius = 33.0;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..style = PaintingStyle.fill
      ..isAntiAlias = true
      ..color = lightRed;

    Offset circleCenter = Offset(size.width, size.height / 2);

    Offset bottomLeft = Offset(0, size.height);
    Offset topRight = Offset(size.width, 0);
    Offset bottomRight = Offset(size.width, size.height);

    Offset leftCurveControlPoint = Offset(circleCenter.dx, size.height);

    const arcStartAngle = pi / 1.5;
    final avatarLeftPointX =
        circleCenter.dx + avatarRadius * cos(arcStartAngle);
    final avatarLeftPointY =
        circleCenter.dy + avatarRadius * sin(arcStartAngle);
    Offset avatarLeftPoint =
        Offset(avatarLeftPointX, avatarLeftPointY); // the left point of the arc

    const arcEndAngle = -pi / 1.5;
    final avatarRightPointX = circleCenter.dx + avatarRadius * cos(arcEndAngle);
    final avatarRightPointY = circleCenter.dy + avatarRadius * sin(arcEndAngle);
    Offset avatarRightPoint = Offset(
        avatarRightPointX, avatarRightPointY); // the right point of the arc

    Path path = Path()
      ..lineTo(bottomLeft.dx, bottomLeft.dy)
      ..lineTo(bottomRight.dx, bottomRight.dy)
      ..quadraticBezierTo(leftCurveControlPoint.dx, leftCurveControlPoint.dy,
          avatarLeftPoint.dx, avatarLeftPoint.dy)
      ..arcToPoint(avatarRightPoint, radius: Radius.circular(avatarRadius))
      ..lineTo(topRight.dx, topRight.dy)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
