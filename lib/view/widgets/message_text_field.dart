import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/constants/constans.dart';
import '../../core/enums/enums.dart';
import '../../core/providers/register_provider.dart';
import 'buttons.dart';

class MessageTextField extends StatelessWidget {
  final TextEditingController _textController = TextEditingController();
  final ScrollController _scrollController;
  MessageTextField(this._scrollController);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<RegisterProvider>(context, listen: false);

    _sendMessage() {
      if (_textController.text.length > 0 &&
          provider.messages.last.type == MessageType.output) {
        provider.addMessage(_textController.text);
        _textController.text = '';
        _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
      }
    }

    return Container(
      padding: EdgeInsets.all(15),
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 2, color: accentColor),
                  borderRadius: BorderRadius.circular(15)),
              child: TextField(
                maxLines: 1,
                cursorColor: accentColor,
                style: Theme.of(context).textTheme.headline4,
                onSubmitted: (_) => _sendMessage(),
                maxLength: 64,
                controller: _textController,
                autocorrect: false,
                autofocus: true,
                decoration: InputDecoration(
                    hintText: 'Message...',
                    counterText: "",
                    hintStyle: Theme.of(context).textTheme.headline5,
                    labelStyle: TextStyle(color: Colors.white),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    enabledBorder: InputBorder.none,
                    isDense: true,
                    focusedBorder: InputBorder.none),
              ),
            ),
          ),
          SizedBox(width: 4),
          SendBtn(onPressed: () => _sendMessage())
        ],
      ),
    );
  }
}