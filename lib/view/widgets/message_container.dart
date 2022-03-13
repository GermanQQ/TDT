import 'package:flutter/material.dart';

import '../../core/constants/constans.dart';
import '../../core/enums/enums.dart';

class MessageContainer extends StatelessWidget {
  final MessageType type;
  final String message;
  MessageContainer({this.type = MessageType.output, this.message = ''});

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
          padding: EdgeInsets.only(left: 15, top: 11, bottom: 11, right: 15),
          decoration: BoxDecoration(
              color: type == MessageType.output ? Colors.white : accentColor,
              borderRadius: BorderRadius.only(
                bottomRight: type == MessageType.output
                    ? Radius.circular(10)
                    : Radius.zero,
                bottomLeft: type == MessageType.output
                    ? Radius.zero
                    : Radius.circular(10),
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
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