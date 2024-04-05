class MessageModel {
  final String id;
  final String type;
  final List<String> contents;
  final List<String>? images;
  final String? replyId;
  final String senderId;
  final String chatId;

  MessageModel({
    required this.id,
    required this.type,
    required this.contents,
    this.replyId,
    required this.senderId,
    required this.chatId,
    this.images,
  });
}
