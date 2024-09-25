import 'package:flutter/material.dart';

import 'package:drill_app/constant/design.dart';

import './network_image_with_loader.dart';

class HorizontalCard extends StatelessWidget {
  const HorizontalCard({
    super.key,
    this.image,
    this.grayTitle,
    this.title,
    this.content,
    this.tag,
    required this.press,
    this.minimumSize = const Size(140, 220),
    this.maximumSize = const Size(140, 220),
    this.extra,
  });
  final String? image, grayTitle, title, content, tag;
  final VoidCallback press;
  final Size minimumSize, maximumSize;
  final Widget? extra;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: press,
      style: OutlinedButton.styleFrom(
          minimumSize: minimumSize,
          maximumSize: maximumSize,
          padding: const EdgeInsets.all(8)),
      child: Row(children: [
        if (image != null)
          AspectRatio(
            aspectRatio: 1.15,
            child: Stack(
              children: [
                if (image != null)
                  NetworkImageWithLoader(image!, radius: defaultBorderRadious),
                if (tag != null)
                  Positioned(
                    right: defaultPadding / 2,
                    top: defaultPadding / 2,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: defaultPadding / 2),
                      height: 16,
                      decoration: const BoxDecoration(
                        color: errorColor,
                        borderRadius: BorderRadius.all(
                            Radius.circular(defaultBorderRadious)),
                      ),
                      child: Text(
                        tag!,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  )
              ],
            ),
          ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: defaultPadding / 2, vertical: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (grayTitle != null)
                      Text(
                        grayTitle!,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(fontSize: 10),
                      ),
                    if (grayTitle != null)
                      const SizedBox(height: defaultPadding / 2),
                    if (title != null)
                      Text(
                        title!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(fontSize: 12),
                      ),
                    if (content != null)
                      Text(
                        content!,
                        style: const TextStyle(
                          color: Color(0xFF31B0D8),
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                        ),
                      ),
                    if (extra != null) const Spacer(),
                    if (extra != null) extra!,
                  ],
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
