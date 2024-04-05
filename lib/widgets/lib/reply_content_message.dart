import 'package:chat_app_v_0_2/models/models.dart';
import 'package:flutter/material.dart';

import '../widgets.dart';

class ReplyContentMessage extends StatefulWidget {
  const ReplyContentMessage({
    super.key,
    required this.isSender,
    required this.colorScheme,
    required this.messageItem,
  });

  final bool isSender;
  final ColorScheme colorScheme;

  final MessageModel messageItem;

  @override
  State<ReplyContentMessage> createState() => _ReplyContentMessageState();
}

class _ReplyContentMessageState extends State<ReplyContentMessage> {
  late Widget content;

  @override
  void initState() {
    super.initState();

    if (widget.messageItem.type == "images") {
      List<String>? imageList = widget.messageItem.images;
      content = ReplyContentTypeImages(imageList: imageList, widget: widget);
    }

    if (widget.messageItem.type == "text") {
      content = ReplyMessageTypeText(widget: widget);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: widget.colorScheme.background,
        borderRadius: const BorderRadius.all(Radius.circular(15)),
      ),
      child: content,
    );
  }
}

class ReplyMessageTypeText extends StatelessWidget {
  const ReplyMessageTypeText({
    super.key,
    required this.widget,
  });

  final ReplyContentMessage widget;

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return IntrinsicHeight(
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              color: colorScheme.primary,
              borderRadius: BorderRadius.circular(18),
            ),
            width: 5,
          ),
          Expanded(
            child: Text(
              widget.messageItem.contents[0],
              style: TextStyle(
                color: colorScheme.onSecondary,
                fontSize: 16,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ReplyContentTypeImages extends StatelessWidget {
  const ReplyContentTypeImages({
    super.key,
    required this.imageList,
    required this.widget,
  });

  final List<String>? imageList;
  final ReplyContentMessage widget;

  @override
  Widget build(BuildContext context) {
    Future<void> imageDialogBuilder(String image) {
      return showDialog<void>(
        useSafeArea: false,
        context: context,
        builder: (context) {
          return ImageDialog(image: image);
        },
      );
    }

    return Expanded(
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: GridView.count(
              crossAxisSpacing: 2,
              crossAxisCount: imageList!.length > 2 ? 3 : imageList!.length,
              shrinkWrap: true,
              children: List.generate(imageList!.length, (index) {
                return GestureDetector(
                  onTap: () => imageDialogBuilder(imageList![index]),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: FittedBox(
                      fit: BoxFit.fill,
                      child: Image.asset(imageList![index]),
                    ),
                  ),
                );
              }),
            ),
          ),
          Positioned(
            top: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                color: widget.colorScheme.primary,
                borderRadius: BorderRadius.circular(18),
              ),
              width: 5,
            ),
          )
        ],
      ),
    );
  }
}
