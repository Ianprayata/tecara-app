class MessageModel {
  String senderId = '';
  String receiverId = '';
  String message = "";
  String username = "";
  String userImage = "";
  bool isOnline = true;

  MessageModel(
      {this.senderId = '',
      this.receiverId = '',
      this.message = "",
      this.isOnline = true,
      this.username = "",
      this.userImage = ""});
}
