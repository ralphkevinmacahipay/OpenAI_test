import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_ai/constant/constant.dart';
import 'package:open_ai/statemanagement/get.dart';
import 'package:velocity_x/velocity_x.dart';

class MyHomePage extends GetView<ChatServicesController> {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kUserbackgroundColor,
        appBar: AppBar(
            backgroundColor: kBotBackgroundColor,
            centerTitle: true,
            title: const Text(
              "Open AI by Ralph",
              maxLines: 2,
              textAlign: TextAlign.center,
            )),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => Visibility(
                  visible: controller.isLoading.value,
                  child: const Center(child: CircularProgressIndicator())),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: controller.kMessageList.length,
                controller: controller.scrollController,
                itemBuilder: (context, index) {
                  final message = controller.kMessageList[index];
                  print("message : $message");
                  return MessageWidget(
                      kText: message.kText,
                      kChatMessageType: message.kChatMessageType);
                },
              ),
            ),
            const TextFormFieldBlr()
          ],
        ).p(20),
      ),
    );
  }
}

class TextFormFieldBlr extends GetView<ChatServicesController> {
  const TextFormFieldBlr({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(kBorderRadius)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: TextFormField(
              style: const TextStyle(color: kWhite),
              controller: controller.messageController,
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  hintStyle: TextStyle(color: kWhite),
                  filled: true,
                  fillColor: kBotBackgroundColor,
                  hintText: "Ask me question"),
            ),
          ),
          IconButton(
              onPressed: () {
                controller.isLoading.value = true;
                controller.kMessageList.add(ChatMessage(
                    kText: controller.messageController.text,
                    kChatMessageType: ChatMessageType.user));

                // var input = controller.messageController.text;
                // controller.messageController.clear();
                // Future.delayed(const Duration(milliseconds: 50))
                //     .then((value) => controller.kScrollDown());
                // controller.generateResponse(input).then((value) {
                //   controller.isLoading.value = false;
                //   controller.kMessageList.add(ChatMessage(
                //       kText: value!, kChatMessageType: ChatMessageType.bot));
                // });
                // controller.messageController.clear();
                // Future.delayed(const Duration(milliseconds: 50))
                //     .then((value) => controller.kScrollDown());
              },
              icon: const Icon(Icons.send))
        ],
      ),
    );
  }
}

class MessageWidget extends StatelessWidget {
  final String kText;
  final ChatMessageType kChatMessageType;
  const MessageWidget(
      {super.key, required this.kText, required this.kChatMessageType});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kChatMessageType == ChatMessageType.bot
          ? kBotBackgroundColor
          : kUserbackgroundColor,
      child: Row(children: [
        kChatMessageType == ChatMessageType.bot
            ? const Icon(Icons.android_outlined)
            : const Icon(Icons.person),
        Expanded(
            child: Column(
          children: [
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    kBorderRadius,
                  ),
                ),
                child: Text(
                  kText,
                  style: const TextStyle(color: kWhite),
                )).p(8)
          ],
        ))
      ]),
    );
  }
}
