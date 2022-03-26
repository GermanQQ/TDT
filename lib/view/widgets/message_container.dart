import 'package:flutter/material.dart';

import '../../core/domain/constants/constans.dart';
import '../../core/domain/enums/enums.dart';

class MessageContainer extends StatelessWidget {
  final MessageType type;
  final String message;
  const MessageContainer({this.type = MessageType.output, this.message = ''});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: type == MessageType.output
          ? MainAxisAlignment.start
          : MainAxisAlignment.end,
      children: [
        Container(
          constraints: BoxConstraints(maxWidth: width - 60),
          padding:
              const EdgeInsets.only(left: 15, top: 11, bottom: 11, right: 15),
          decoration: BoxDecoration(
              color: type == MessageType.output ? Colors.white : accentColor,
              borderRadius: BorderRadius.only(
                bottomRight: type == MessageType.output
                    ? const Radius.circular(10)
                    : Radius.zero,
                bottomLeft: type == MessageType.output
                    ? Radius.zero
                    : const Radius.circular(10),
                topLeft: const Radius.circular(10),
                topRight: const Radius.circular(10),
              )),
          child: Text(
            message,
            style: type == MessageType.output
                ? TDTTheme.textStyleB
                : TDTTheme.textStyleW,
          ),
        ),
      ],
    );
  }
}
