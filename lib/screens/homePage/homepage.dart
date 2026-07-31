import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chat_gpt/routs/routs.dart';
import 'package:chat_gpt/services/servies.dart';
import 'package:chat_gpt/constans/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:chat_gpt/widgets/chat_widget.dart';
import 'package:chat_gpt/widgets/text_widget.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:chat_gpt/providers/chat_provider.dart';
import 'package:chat_gpt/services/assets_manager.dart';
import 'package:chat_gpt/providers/model_providers.dart';

// ignore_for_file: sized_box_for_whitespace, use_build_context_synchronously

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FirebaseAuth auth = FirebaseAuth.instance;
  bool _isTyping = false;

  late TextEditingController textEditingController;
  late FocusNode focusNode;
  late ScrollController _listScrollController;

  @override
  void initState() {
    _listScrollController = ScrollController();
    textEditingController = TextEditingController();
    focusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _listScrollController.dispose();
    textEditingController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final modelsProviders = Provider.of<ModelsProviders>(context);
    final chatProvider = Provider.of<ChatProvider>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image(image: AssetImage(AssetsManager.openaiLogo)),
        ),
        title: const Text("ChatGPT"),
        centerTitle: true,
        // actions: [
        //   IconButton(
        //       onPressed: () async {
        //         await Services.showModelsheet(context: context);
        //       },
        //       icon: const Icon(Icons.more_vert_rounded, color: Colors.white)),
        //   InkWell(
        //       onTap: () async {
        //         await FirebaseAuth.instance.signOut().then(
        //               (value) => Navigator.push(
        //                   context,
        //                   MaterialPageRoute(
        //                     builder: (context) => SignInButtonPage(),
        //                   )),
        //             );
        //       },
        //       child: Icon(Icons.logout, color: Colors.white)),
        //   SizedBox(
        //     width: 10,
        //   )
        // ],
      ),
      endDrawer: Drawer(
        width: 250,
        backgroundColor: cardColor,
        elevation: 2,
        shadowColor: Colors.white,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), bottomLeft: Radius.circular(30))),
        child: Column(
          children: [
            Container(
              height: 200,
              child: DrawerHeader(
                  padding: const EdgeInsets.all(5),
                  child: UserAccountsDrawerHeader(
                      decoration: BoxDecoration(
                          color: scaffoldBackgroundColor,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5))),
                      accountName: auth.currentUser!.displayName == null
                          ? const Text(
                              "UserName",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic),
                            )
                          : Text(
                              auth.currentUser!.displayName.toString(),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic),
                            ),
                      accountEmail: Text(
                        auth.currentUser!.email.toString(),
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontStyle: FontStyle.italic),
                      ),
                      currentAccountPicture: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: CircleAvatar(
                          child: auth.currentUser!.photoURL == null
                              ? Image.asset("assets/images/emoji.png")
                              : Image.network(
                                  auth.currentUser!.photoURL.toString()),
                        ),
                      ))),
            ),
            InkWell(
              onTap: () async {
                await Services.showModelsheet(context: context);
              },
              child: Card(
                color: scaffoldBackgroundColor,
                child: const ListTile(
                  title: Center(
                    child: Text(
                      'Your Models are here',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  hoverColor: Colors.cyan,
                ),
              ),
            ),
            const SizedBox(
              height: 200,
            ),
            InkWell(
              onTap: () async {
                auth.signOut();
                Navigator.pushNamedAndRemoveUntil(
                    context, Pages.GOOGLESIGNINPAGE, (route) => false);
              },
              child: const Card(
                color: Colors.lightBlue,
                child: ListTile(
                  title: Center(
                    child: Text(
                      'LogOut',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  hoverColor: Colors.cyan,
                ),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Flexible(
            child: ListView.builder(
                controller: _listScrollController,
                itemCount: chatProvider.getChatList.length,
                itemBuilder: (context, index) {
                  return ChatWidget(
                    msg: chatProvider.getChatList[index].msg,
                    chatindex: chatProvider.getChatList[index].chatIndex,
                    shouldAnimate: chatProvider.getChatList.length - 1 == index,
                  );
                }),
          ),
          if (_isTyping) ...[
            const SpinKitThreeBounce(
              color: Colors.white,
              size: 20,
            )
          ],
          const SizedBox(
            height: 15,
          ),
          Material(
            color: cardColor,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                      child: TextField(
                    focusNode: focusNode,
                    style: const TextStyle(color: Colors.white),
                    controller: textEditingController,
                    onSubmitted: (value) async {
                      await sendMessageFCT(
                          modelsProvider: modelsProviders,
                          chatProvider: chatProvider);
                    },
                    decoration: const InputDecoration.collapsed(
                        hintText: "How Can I Help You",
                        hintStyle: TextStyle(color: Colors.grey)),
                  )),
                  IconButton(
                      onPressed: () async {
                        await sendMessageFCT(
                            modelsProvider: modelsProviders,
                            chatProvider: chatProvider);
                      },
                      icon: const Icon(Icons.send, color: Colors.white))
                ],
              ),
            ),
          )
        ],
      )),
    );
  }

  void scrollListToEND() {
    _listScrollController.animateTo(
        _listScrollController.position.maxScrollExtent,
        duration: const Duration(seconds: 2),
        curve: Curves.easeOut);
  }

  Future<void> sendMessageFCT(
      {required ModelsProviders modelsProvider,
      required ChatProvider chatProvider}) async {
    if (_isTyping) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: TextWidget(
            label: "You cant send multiple messages at a time",
          ),
          backgroundColor: Color.fromARGB(255, 235, 21, 6),
        ),
      );
      return;
    }
    if (textEditingController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: TextWidget(
            label: "Please type a message",
          ),
          backgroundColor: Color.fromARGB(255, 52, 230, 212),
        ),
      );
      return;
    }
    try {
      String msg = textEditingController.text;
      setState(() {
        _isTyping = true;

        chatProvider.addUserMessage(msg: msg);
        textEditingController.clear();
        focusNode.unfocus();
      });
      await chatProvider.sendMessageAndGetAnswers(
          msg: msg, chosenModelId: modelsProvider.getCurrentModel);

      setState(() {});
    } catch (error) {
      log("error $error");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: TextWidget(
          label: error.toString(),
        ),
        backgroundColor: const Color.fromARGB(255, 4, 134, 194),
      ));
    } finally {
      setState(() {
        scrollListToEND();
        _isTyping = false;
      });
    }
  }
}
