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
            const TextFormFieldBlr()
          ],
        ),
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
    );
  }
}
