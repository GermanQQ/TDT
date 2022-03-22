import 'package:flutter/material.dart';
import 'package:flutter_tdt/core/enums/enums.dart';
import 'package:flutter_tdt/core/navigation/router.dart';
import 'package:flutter_tdt/core/view_models/register_model.dart';
import 'package:flutter_tdt/view/widgets/widgets.dart';
import 'package:provider/provider.dart';


class RegisteringPage extends StatefulWidget {
  const RegisteringPage ({ Key? key }) : super(key: key);
  static MaterialPage page() {
    return MaterialPage(
      name: Routes.reqister,
      key: ValueKey(Routes.reqister),
      child: RegisteringPage(),
    );
  }

  @override
  State<RegisteringPage> createState() => _RegisteringPageState();
}

class _RegisteringPageState extends State<RegisteringPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RegisterModel>(
      create: (context) => RegisterModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Sign up',
            style: Theme.of(context).textTheme.headline3,
          ),
          leadingWidth: 60,
          leading: CustomBackBtn(),
        ),
        body: Stack(
          children: [
            Consumer<RegisterModel>(
              builder: (context, model, child) {
                switch (model.authStatus) {
                  case AuthStatus.Unauthenticated:
                  case AuthStatus.Uninitialized:
                    return Container(
                      padding: EdgeInsets.only(
                          left: 15, right: 15, top: 15, bottom: 80),
                      child: ListView.separated(
                        controller: _scrollController,
                        itemBuilder: (context, i) => MessageContainer(
                          message: model.messages[i].message,
                          type: model.messages[i].type,
                        ),
                        separatorBuilder: (context, i) => SizedBox(height: 10),
                        itemCount: model.messages.length,
                      ),
                    );
                  default:
                    return Center(child: CircularProgressIndicator());
                }
              },
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: MessageTextField(_scrollController),
            )
          ],
        ),
      ),
    );
  }
}
