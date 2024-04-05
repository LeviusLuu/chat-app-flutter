import 'package:flutter/material.dart';

import '../widgets.dart';

// ignore: must_be_immutable
class ContentMessage extends StatefulWidget {
  ContentMessage({
    super.key,
    required this.widget,
    required this.isPre,
    required this.isNext,
    this.isDialog,
  });

  final LayoutMessage widget;
  final bool isPre;
  final bool isNext;
  bool? isDialog;

  @override
  State<ContentMessage> createState() => _ContentMessageState();
}

class _ContentMessageState extends State<ContentMessage> {
  late Widget content;

  Future<void> imageDialogBuilder(String image) {
    return showDialog<void>(
      useSafeArea: false,
      context: context,
      builder: (context) {
        return ImageDialog(image: image);
      },
    );
  }

  @override
  void initState() {
    super.initState();

    if (widget.widget.messageItem.type == "text") {
      content = ContentMessageTypeText(widget: widget);
    }

    if (widget.widget.messageItem.type == "images") {
      List<String>? imageList = widget.widget.messageItem.images;
      content = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            constraints: const BoxConstraints(maxWidth: 300),
            child: GridView.count(
              crossAxisSpacing: 2,
              crossAxisCount: imageList!.length > 2 ? 3 : imageList.length,
              shrinkWrap: true,
              children: List.generate(imageList.length, (index) {
                return GestureDetector(
                  onTap: () => imageDialogBuilder(imageList[index]),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: FittedBox(
                      fit: BoxFit.fill,
                      child: Image.network(imageList[index]),
                    ),
                  ),
                );
              }),
            ),
          ),
          if (widget.widget.messageItem.contents[0] != "")
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ContentMessageTypeText(widget: widget),
            ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Radius topBorderRadius = Radius.circular(widget.isPre ? 5 : 20);
    Radius bottomBorderRadius = Radius.circular(widget.isNext ? 5 : 20);
    return Container(
      constraints: const BoxConstraints(maxWidth: 300),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        color: widget.widget.isSender
            ? widget.widget.colorScheme.onSecondaryContainer
            : widget.widget.colorScheme.primary,
        borderRadius: widget.isDialog == true
            ? BorderRadius.circular(20)
            : BorderRadius.only(
                topLeft: topBorderRadius,
                topRight: topBorderRadius,
                bottomRight: bottomBorderRadius,
                bottomLeft: bottomBorderRadius,
              ),
      ),
      child: widget.widget.replyMessage != null
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ReplyContentMessage(
                  isSender: widget.widget.isSender,
                  colorScheme: widget.widget.colorScheme,
                  messageItem: widget.widget.replyMessage!,
                ),
                content,
              ],
            )
          : content,
    );
  }
}

class ContentMessageTypeText extends StatelessWidget {
  const ContentMessageTypeText({
    super.key,
    required this.widget,
  });

  final ContentMessage widget;

  @override
  Widget build(BuildContext context) {
    return Text(
      widget.widget.messageItem.contents[0],
      style: TextStyle(
        color: widget.widget.isSender
            ? widget.widget.colorScheme.onSecondary
            : Colors.white,
        fontSize: 17,
      ),
    );
  }
}
