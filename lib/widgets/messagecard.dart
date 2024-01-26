import '../files.dart';

class ContactCard extends StatefulWidget {
  final ContactModel contactInfo;

  const ContactCard({Key? key, required this.contactInfo}) : super(key: key);

  @override
  State<ContactCard> createState() => _ContactCardState();
}

class _ContactCardState extends State<ContactCard> {
  late String username;
  @override
  Widget build(BuildContext context) {
    void getUsername() async {
      await FirebaseFirestore.instance
          .collection('users')
          .where('id', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .get()
          .then((value) {
        setState(() {
          username = value.docs[0]['username'];
        });
        debugPrint(username);
      });
    }

    getUsername();
    chatRoomId(String sender, String receiver) {
      if (sender[0].toLowerCase().codeUnits[0] >
          receiver.toLowerCase().codeUnits[0]) {
        return "$sender$receiver";
      } else {
        return "$receiver$sender";
      }
    }

    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: ((BuildContext context) {
          return ChatScreen(
            chatRoomId:
                chatRoomId(username, widget.contactInfo.name).toString(),
            contactInfo: widget.contactInfo ,
          );
        })));
      },
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.104,
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: grey,
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                widget.contactInfo.imgUrl == ""
                    ? "images/profilepict.png"
                    : widget.contactInfo.imgUrl,
                width: 50,
                height: 50,
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.contactInfo.name,
                      style: mediumText.copyWith(
                        color: black,
                        fontWeight: regular,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      widget.contactInfo.msg,
                      overflow: TextOverflow.fade,
                      softWrap: true,
                      maxLines: 1,
                      style: regularText.copyWith(
                          color: darkGrey, fontWeight: regular),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
