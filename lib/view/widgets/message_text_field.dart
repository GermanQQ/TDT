import 'package:flutter/material.dart';
import 'package:flutter_tdt/core/view_models/register_view.dart';
import 'package:provider/provider.dart';

import '../../core/domain/constants/constans.dart';
import '../../core/domain/enums/enums.dart';
import 'buttons.dart';

class MessageTextField extends StatelessWidget {
  final TextEditingController _textController = TextEditingController();
  final ScrollController _scrollController;
  MessageTextField(this._scrollController);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<RegisterView>(context, listen: false);

    _sendMessage() {
      if (_textController.text.isNotEmpty &&
          provider.messages.last.type == MessageType.output) {
        provider.addMessage(_textController.text);
        _textController.text = '';
        _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
      }
    }

    return Container(
      padding: const EdgeInsets.all(15),
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
                    counterText:'',
                    hintStyle: Theme.of(context).textTheme.headline5,
                    labelStyle: const TextStyle(color: Colors.white),
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    enabledBorder: InputBorder.none,
                    isDense: true,
                    focusedBorder: InputBorder.none),
              ),
            ),
          ),
          const SizedBox(width: 4),
          SendBtn(onPressed: () => _sendMessage())
        ],
      ),
    );
  }
}