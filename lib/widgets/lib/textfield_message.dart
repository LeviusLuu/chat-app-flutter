import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class TextFieldMessage extends StatefulWidget {
  const TextFieldMessage({
    super.key,
    required this.controller,
    required this.sendMessage,
    required this.focusNode,
    required this.images,
    required this.addImage,
    required this.removeImage,
  });

  final TextEditingController controller;
  final void Function() sendMessage;
  final FocusNode focusNode;
  final List<XFile> images;
  final void Function() addImage;
  final void Function(int index) removeImage;

  @override
  State<TextFieldMessage> createState() => _TextFieldMessageState();
}

class _TextFieldMessageState extends State<TextFieldMessage> {
  final ScrollController _horizontal = ScrollController();
  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(left: 5, right: 5, bottom: 3),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: colorScheme.onSecondaryContainer,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            if (widget.images.isNotEmpty)
              Container(
                height: 120,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                child: Scrollbar(
                  controller: _horizontal,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: ListView.separated(
                      controller: _horizontal,
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.images.length,
                      itemBuilder: (context, index) {
                        Widget image = Stack(
                          children: [
                            Container(
                              height: 80,
                              width: 80,
                              margin: const EdgeInsets.only(
                                top: 10,
                                right: 10,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.network(
                                  widget.images[index].path,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 0,
                              right: 0,
                              height: 25,
                              width: 25,
                              child: InkWell(
                                onTap: () => widget.removeImage(index),
                                child: CircleAvatar(
                                  backgroundColor: colorScheme.background,
                                  radius: 10,
                                  child: Icon(
                                    Icons.close,
                                    size: 16,
                                    color: colorScheme.secondary,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                        if (index == 0) {
                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: () async => widget.addImage(),
                                child: SizedBox(
                                  height: 80,
                                  width: 80,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: DecoratedBox(
                                      decoration: BoxDecoration(
                                        color: colorScheme.onBackground,
                                      ),
                                      child: const Icon(Icons.image),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 15),
                              image,
                            ],
                          );
                        }
                        return Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: image,
                        );
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 5),
                    ),
                  ),
                ),
              ),
            SizedBox(
              height: 35,
              child: TextField(
                onSubmitted: (value) => widget.sendMessage(),
                controller: widget.controller,
                focusNode: widget.focusNode,
                onChanged: (value) {},
                autofocus: true,
                decoration: InputDecoration(
                  hintText: "Aa",
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  suffixIconConstraints: const BoxConstraints(maxWidth: 35),
                  suffixIcon: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    icon: Icon(
                      Icons.emoji_emotions,
                      color: colorScheme.primary,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
