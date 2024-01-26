import '../files.dart';

class ChatScreen extends StatefulWidget {
  final ContactModel contactInfo;
  String chatRoomId;
  ChatScreen({Key? key, required this.chatRoomId, required this.contactInfo})
      : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textMessage = TextEditingController();
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

  void onSendMessage() async {
    if (_textMessage.text.isNotEmpty) {
      await FirebaseFirestore.instance
          .collection('chatroom')
          .doc(widget.chatRoomId)
          .collection('chats')
          .add({
        'sendBy': username,
        'message': _textMessage.text,
        'time': FieldValue.serverTimestamp()
      });

      _textMessage.clear();
    }
  }

  @override
  void initState() {
    getUsername();
    super.initState();
  }

  late String username;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: true,
      backgroundColor: backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: white,
        leading: InkWell(
            enableFeedback: true,
            onTap: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Image.asset(
                "images/Back_Icon.png",
                width: 20,
                height: 20,
              ),
            )),
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child:
                  Image.asset("images/profilepict.png", width: 50, height: 50),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.contactInfo.name,
                  style: mediumText.copyWith(color: black, fontWeight: medium),
                ),
                Text(
                  "Online",
                  style: regularText.copyWith(color: grey, fontWeight: regular),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        decoration: const BoxDecoration(color: Colors.transparent),
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: white,
                  border: Border.all(
                    color: grey,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                child: TextFormField(
                  controller: _textMessage,
                  decoration: const InputDecoration.collapsed(
                    hintText: "Type message...",
                  ),
                ),
              ),
            ),
            InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: onSendMessage,
              child: Container(
                padding: const EdgeInsets.all(15),
                margin: const EdgeInsets.only(left: 15),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  gradient: linearGradient,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Image.asset("images/send_message.png", height: 20),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('chatroom')
              .doc(widget.chatRoomId)
              .collection('chats')
              .orderBy("time", descending: false)
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            while (snapshot.data == null) {
              return const Center(
                  child: CircularProgressIndicator.adaptive(
                backgroundColor: purple,
              ));
            }
            if (snapshot.hasData) {
              return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, index) {
                    return messages(snapshot, index);
                  },
                  itemCount: snapshot.data!.docs.length);
            } else {
              return const Center(
                  child: CircularProgressIndicator.adaptive(
                      backgroundColor: purple));
            }
          },
        ),
        // SingleChildScrollView(
        //   physics: const BouncingScrollPhysics(),
        //   child: SizedBox(
        //     height: MediaQuery.of(context).size.height,
        //     width: MediaQuery.of(context).size.width,
        //     child: Column(
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: [
        //         Align(
        //           alignment: Alignment.centerRight,
        //           child: Container(
        //             margin: const EdgeInsets.only(top: 20, left: 15, right: 15),
        //             padding: const EdgeInsets.symmetric(
        //                 horizontal: 15, vertical: 10),
        //             decoration: const BoxDecoration(
        //                 color: lightBlue,
        //                 borderRadius: BorderRadius.only(
        //                     topRight: Radius.circular(0),
        //                     topLeft: Radius.circular(12),
        //                     bottomLeft: Radius.circular(12),
        //                     bottomRight: Radius.circular(12))),
        //             child: Text(
        //               textAlign: TextAlign.end,
        //               "Apa benar dengan bapak ian disini?",
        //               style: regularText.copyWith(
        //                   color: black, fontWeight: regular),
        //             ),
        //           ),
        //         ),
        //         Align(
        //           alignment: Alignment.centerLeft,
        //           child: Container(
        //             margin: const EdgeInsets.only(top: 20, left: 15, right: 15),
        //             padding: const EdgeInsets.symmetric(
        //                 horizontal: 15, vertical: 10),
        //             decoration: const BoxDecoration(
        //                 color: white,
        //                 borderRadius: BorderRadius.only(
        //                     topRight: Radius.circular(12),
        //                     topLeft: Radius.circular(0),
        //                     bottomLeft: Radius.circular(12),
        //                     bottomRight: Radius.circular(12))),
        //             child: Text(
        //               textAlign: TextAlign.start,
        //               "Benar, ada yang bisa dibantu?",
        //               style: regularText.copyWith(
        //                   color: black, fontWeight: regular),
        //             ),
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
      ),
    );
  }

  Widget messages(snapshot, index) {
    return Align(
      alignment: snapshot.data!.docs[index]['sendBy'] == username
          ? Alignment.centerRight
          : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(top: 20, left: 15, right: 15),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
            color: snapshot.data!.docs[index]['sendBy'] == username
                ? lightBlue
                : white,
            borderRadius: snapshot.data!.docs[index]['sendBy'] == username
                ? const BorderRadius.only(
                    topRight: Radius.circular(0),
                    topLeft: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12))
                : const BorderRadius.only(
                    topRight: Radius.circular(12),
                    topLeft: Radius.circular(0),
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12))),
        child: Text(
          snapshot.data!.docs[index]['message'].toString(),
          textAlign: snapshot.data!.docs[index]['sendBy'] == username
              ? TextAlign.end
              : TextAlign.start,
          style: regularText.copyWith(color: black, fontWeight: regular),
        ),
      ),
    );
  }
}
