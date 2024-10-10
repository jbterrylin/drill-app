import 'package:drill_app/component/tmp_components/network_image_with_loader.dart';
import 'package:drill_app/constant/design.dart';
import 'package:drill_app/model/group.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

class UiGroupInfo extends StatefulWidget {
  const UiGroupInfo({super.key, required this.group});

  final Group? group;

  @override
  State<UiGroupInfo> createState() => _UiGroupInfoState();
}

class _UiGroupInfoState extends State<UiGroupInfo> {
  final log = Logger('UiGroupInfo');

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {}

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 157,
          child: NetworkImageWithLoader("https://i.imgur.com/CGCyp1d.png",
              radius: 0),
        ),
        Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.group?.name ?? "",
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: defaultPadding / 2),
              Text(
                "This is a badminton group",
                maxLines: 2,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: defaultPadding),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(defaultPadding / 2),
                    decoration: const BoxDecoration(
                      color: successColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(defaultBorderRadious / 2),
                      ),
                    ),
                    child: Text(
                      "Badminton",
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                          color: Colors.white, fontWeight: FontWeight.w500),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
