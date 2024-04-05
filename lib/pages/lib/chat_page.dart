import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../../models/models.dart';
import '../../widgets/widgets.dart';

List<ChatModel> chatList = [
  // ChatModel(
  //     id: "1",
  //     fullname: "Tuấn Hùng",
  //     currentMessgase: "Tối nay mình ăn gì?",
  //     avatar: "TH"),
  ChatModel(
      id: "2",
      fullname: "Tuấn Lê",
      currentMessgase: "H t chạy ra",
      avatar: "TL"),
  ChatModel(
      id: "3",
      fullname: "Ngọc Tring",
      currentMessgase: "Anh đang ở đâu",
      avatar: "NT"),
  ChatModel(
      id: "4",
      fullname: "Gia Túc Nguyễn",
      currentMessgase: "Khi nào qua tới?",
      avatar: "TN"),
  ChatModel(
      id: "5",
      fullname: "X Mai Luu",
      currentMessgase: "Khi nào qua tới?",
      avatar: "ML"),
  ChatModel(
      id: "6",
      fullname: "Hoàng Tuấn",
      currentMessgase: "Tks e nha",
      avatar: "HL"),
  ChatModel(
    id: "7",
    fullname: "Thanh Tâm",
    currentMessgase: "Alo",
    avatar: "TT",
  ),
  ChatModel(
    id: "8",
    fullname: "Tuấn Lưu",
    currentMessgase: "Bao nhiêu",
    avatar: "TL",
  ),
  ChatModel(
    id: "9",
    fullname: "Bine Nguyễn",
    currentMessgase: "Bao nhiêu?",
    avatar: "BN",
  ),
  ChatModel(
    id: "10",
    fullname: "Thong Doan",
    currentMessgase: "Bây giờ m đang làm gì?",
    avatar: "TD",
  ),
];

List<MessageModel> messages = [
  MessageModel(
    id: "1",
    chatId: "1",
    contents: ["đáy kasd ajsdn ijdsf sdf"],
    type: "text",
    senderId: "1",
  ),
  MessageModel(
    id: "2",
    chatId: "1",
    contents: [
      "đáy kasd ajsdn ijdsf sdf đáy kasd ajsdn ijdsf sdfđáy kasd ajsdn ijdsf sdfđáy kasd ajsdn ijdsf sdfđáy kasd ajsdn ijdsf sdf"
    ],
    type: "text",
    senderId: "1",
  ),
  MessageModel(
    id: "3",
    chatId: "1",
    contents: ["đáy kasd ajsdn ijdsf sdf"],
    type: "text",
    senderId: "2",
  ),
  MessageModel(
    id: "4",
    chatId: "1",
    contents: ["đáy kasd ajsdn ijdsf sdf"],
    type: "text",
    senderId: "1",
  ),
  MessageModel(
    id: "5",
    chatId: "1",
    contents: ["đáy kasd ajsdn ijdsf sdf"],
    type: "text",
    senderId: "1",
  ),
  MessageModel(
    id: "6",
    chatId: "1",
    contents: ["đáy kasd ajsdn ijdsf sdf"],
    type: "text",
    senderId: "2",
  ),
  MessageModel(
    id: "7",
    chatId: "1",
    contents: ["đáy kasd ajsdn ijdsf sdf"],
    type: "text",
    senderId: "1",
  ),
  MessageModel(
    id: "8",
    chatId: "1",
    contents: ["đáy kasd ajsdn ijdsf sdf"],
    type: "text",
    senderId: "1",
  ),
  MessageModel(
    id: "9",
    chatId: "1",
    contents: ["đáy kasd ajsdn ijdsf sdf"],
    type: "text",
    senderId: "1",
  ),
  MessageModel(
    id: "10",
    chatId: "1",
    contents: ["đáy kasd ajsdn ijdsf sdf"],
    type: "text",
    senderId: "1",
  ),
  MessageModel(
    id: "11",
    chatId: "1",
    contents: [
      "đáy kasd ajsdn ijdsf sdf đáy kasd ajsdn ijdsf sdfđáy kasd ajsdn ijdsf sdfđáy kasd ajsdn ijdsf sdfđáy kasd ajsdn ijdsf sdf"
    ],
    type: "text",
    senderId: "2",
  ),
  MessageModel(
    id: "12",
    chatId: "1",
    contents: ["đáy kasd ajsdn ijdsf sdf"],
    type: "text",
    senderId: "1",
  ),
  MessageModel(
    id: "13",
    chatId: "1",
    contents: [
      "đáy kasd ajsdn ijdsf sdf đáy kasd ajsdn ijdsf sdfđáy kasd ajsdn ijdsf sdfđáy kasd ajsdn ijdsf sdfđáy kasd ajsdn ijdsf sdf"
    ],
    type: "text",
    senderId: "2",
  ),
  MessageModel(
    id: "14",
    chatId: "1",
    contents: ["đáy kasd ajsdn ijdsf sdf"],
    type: "text",
    senderId: "1",
  ),
  MessageModel(
    id: "15",
    chatId: "1",
    contents: ["đáy kasd ajsdn ijdsf sdf"],
    type: "text",
    senderId: "1",
  ),
  MessageModel(
    id: "16",
    chatId: "1",
    contents: [
      "đáy kasd ajsdn ijdsf sdf đáy kasd ajsdn ijdsf sdfđáy kasd ajsdn ijdsf sdfđáy kasd ajsdn ijdsf sdfđáy kasd ajsdn ijdsf sdf"
    ],
    type: "text",
    senderId: "2",
    replyId: "15",
  ),
  MessageModel(
    id: "17",
    chatId: "1",
    contents: ["đáy kasd ajsdn ijdsf sdf"],
    type: "text",
    senderId: "2",
  ),
  MessageModel(
    id: "18",
    chatId: "1",
    contents: [
      "đáy kasd ajsdn ijd 44kasd ajsdn ijd 44kasd ajsdn ijd 44kasd ajsdn ijd 44kasd ajsdn ijd 44kasd ajsdn ijd 44 32 e 432 f sdf"
    ],
    type: "text",
    senderId: "2",
  ),
  MessageModel(
    id: "19",
    chatId: "1",
    contents: ["đáy kasd ajsdn ijdsf sdf"],
    type: "text",
    senderId: "1",
  ),
  MessageModel(
    id: "20",
    chatId: "1",
    contents: ["đáy kasd ajsdn ijdsf sdf"],
    type: "text",
    senderId: "1",
  ),
  MessageModel(
    id: "21",
    chatId: "1",
    contents: ["đáy kasd ajsdn ijdsf sdf"],
    type: "text",
    senderId: "1",
  ),
  MessageModel(
    id: "22",
    chatId: "1",
    contents: ["đáy kasd ajsdn ijdsf sdf"],
    type: "text",
    senderId: "1",
  ),
  MessageModel(
    id: "23",
    chatId: "1",
    contents: ["đáy kasd ajsdn ijdsf sdf"],
    type: "text",
    senderId: "1",
  ),
  MessageModel(
    id: "24",
    chatId: "1",
    contents: ["đáy kasd ajsdn ijdsf sdf"],
    type: "text",
    senderId: "1",
    replyId: "18",
  ),
];

class ChatPage extends StatefulWidget {
  const ChatPage({
    super.key,
    required this.id,
  });

  final String id;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<MessageModel> messages1 = [];
  TextEditingController messageController = TextEditingController(text: "");
  final focusNode = FocusNode();
  List<XFile> images = [];
  ScrollController scrollController = ScrollController();
  late ChatModel chatItem;

  @override
  void initState() {
    super.initState();
    messageController.addListener(() {
      setState(() {});
    });
    chatItem = chatList.where((element) => element.id == widget.id).first;
    messages1 = [...messages];
  }

  @override
  void didUpdateWidget(covariant ChatPage oldWidget) {
    chatItem = chatList.where((element) => element.id == widget.id).first;
    messages1 = [...messages];
    messageController.clear();
    images.clear();
    refreshScrollView();
    FocusScope.of(context).requestFocus(focusNode);

    super.didUpdateWidget(oldWidget);
  }

  void sendMessage() {
    if (messageController.text.isNotEmpty || images.isNotEmpty) {
      MessageModel item = MessageModel(
        id: messages1.length.toString(),
        type: images.isEmpty ? "text" : "images",
        contents: [messageController.text],
        images: images.map((e) => e.path).toList(),
        senderId: "1",
        chatId: "1",
      );
      setState(() {
        messages1.add(item);
        images.clear();
        messageController.clear();
      });
      refreshScrollView();
      FocusScope.of(context).requestFocus(focusNode);
    }
  }

  void addImage() async {
    final ImagePicker picker = ImagePicker();
    List<XFile> a = await picker.pickMultipleMedia();
    if (a.isNotEmpty) {
      setState(() {
        images.addAll(a);
      });
    }
  }

  void removeImage(int index) {
    setState(() {
      images.removeAt(index);
    });
  }

  void refreshScrollView() {
    if (scrollController.hasClients) {
      final position = scrollController.position.minScrollExtent;
      scrollController.jumpTo(position);
    }
  }

  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: maxWidth < 1100 ? -20 : -65,
          leading: maxWidth < 1100
              ? IconButton(
                  padding: const EdgeInsets.only(left: 8),
                  onPressed: () => context.pop("/"),
                  icon: const Icon(Icons.arrow_back_ios),
                )
              : Container(),
          title: ListTile(
            leading: CircleAvatar(
              child: Text(chatItem.avatar),
            ),
            title: Text(chatItem.fullname),
            subtitle: const Text("Active now"),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.info,
                  color: colorScheme.primary,
                ),
              ),
            ),
          ],
        ),
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              Expanded(
                child: MessagesView(
                  chatItem: chatItem,
                  messages: messages1,
                  controller: scrollController,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: colorScheme.background,
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 228, 228, 228)
                          .withOpacity(0.3),
                      spreadRadius: 3,
                      blurRadius: 2,
                      offset: const Offset(2, 0),
                    ),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.add,
                        color: colorScheme.primary,
                      ),
                    ),
                    if (messageController.text.isEmpty && images.isEmpty) ...[
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.camera_alt,
                          color: colorScheme.primary,
                        ),
                      ),
                      IconButton(
                        onPressed: () async {
                          final ImagePicker picker = ImagePicker();
                          List<XFile> a = await picker.pickMultipleMedia();
                          setState(() {
                            images = a;
                          });
                        },
                        icon: Icon(
                          Icons.image,
                          color: colorScheme.primary,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.mic,
                          color: colorScheme.primary,
                        ),
                      ),
                    ],
                    TextFieldMessage(
                      controller: messageController,
                      sendMessage: sendMessage,
                      focusNode: focusNode,
                      images: images,
                      addImage: addImage,
                      removeImage: removeImage,
                    ),
                    IconButton(
                      padding: const EdgeInsets.only(bottom: 2, left: 2),
                      onPressed: () => sendMessage(),
                      icon: messageController.text.isEmpty && images.isEmpty
                          ? SvgPicture.asset(
                              "assets/icons/svg_like.svg",
                              colorFilter: ColorFilter.mode(
                                  colorScheme.primary, BlendMode.srcIn),
                              height: 20,
                              width: 20,
                            )
                          : Icon(Icons.send, color: colorScheme.primary),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
