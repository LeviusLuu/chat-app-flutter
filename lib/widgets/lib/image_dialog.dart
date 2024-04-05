import 'package:flutter/material.dart';

class ImageDialog extends StatelessWidget {
  const ImageDialog({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    Size maxSize = MediaQuery.of(context).size;
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Container(
      color: Colors.black.withOpacity(0.8),
      width: maxSize.width,
      height: maxSize.height,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CircleAvatar(
                  radius: 18,
                  backgroundColor: colorScheme.background,
                  child: IconButton(
                    padding: const EdgeInsets.only(top: 3),
                    onPressed: () {},
                    icon: Icon(
                      Icons.download,
                      color: colorScheme.secondary,
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                CircleAvatar(
                  radius: 18,
                  backgroundColor: colorScheme.background,
                  child: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(
                      Icons.close_sharp,
                      color: colorScheme.secondary,
                      size: 20,
                    ),
                  ),
                ),
                const SizedBox(width: 5),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: maxSize.height * 0.9,
                  maxWidth: maxSize.width * 0.9,
                ),
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: Image.network(image),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
