import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_ai/constant/constant.dart';
import 'package:http/http.dart' as http;

class ChatServicesController extends GetxController {
  final scrollController = ScrollController();
  final List<ChatMessage> kMessageList = [];
  TextEditingController messageController = TextEditingController();
  Rx<bool> isLoading = false.obs;

  Future<String?> generateResponse(String prompt) async {
    final uri = Uri.parse("https://api.openai.com/v1/completions");
    final header = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $apiKey'
    };
    final body = jsonEncode({
      'model': 'text-davinci-003',
      'prompt': prompt,
      'temperature': 0,
      'max_token': 2000,
      'top_p': 1,
      'frequency': 0.0,
      'presence_penalty': 0.0,
    });

    try {
      final response = await http.post(uri, headers: header, body: body);
      print("response: ${response.body}");

      if (response.statusCode == 200) {
        final newresponse = jsonDecode(response.body);
        final String result = newresponse['choices'][0]['text'];
        return result.trim();
      }
    } catch (e) {
      print("e: ${e.toString()}");
    }

    return null;
  }

  kScrollDown() {
    scrollController.animateTo(scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  }
}

class ChatMessage {
  final String kText;
  final ChatMessageType kChatMessageType;

  ChatMessage({
    required this.kText,
    required this.kChatMessageType,
  });
}

enum ChatMessageType { user, bot }
