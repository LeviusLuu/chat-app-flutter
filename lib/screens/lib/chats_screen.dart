import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return SizedBox.expand(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              width: double.infinity,
              child: const CupertinoSearchTextField(),
            ),
            ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                ChatModel chatItem = chatList[index];
                return ItemChat(
                  chatItem: chatItem,
                  colorScheme: colorScheme,
                );
              },
              separatorBuilder: (context, index) => const SizedBox(height: 3),
              itemCount: chatList.length,
            ),
          ],
        ),
      ),
    );
  }
}
