import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';





class ChatController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  var messages = <types.Message>[].obs;
  final user = types.User(id: FirebaseAuth.instance.currentUser!.uid).obs;
  //User who get messages

  late final String getUser;
  ChatController(this.getUser);




  DateTime now = DateTime.now();
  late DateTime date = DateTime(now.year, now.month, now.day);

  @override
  void onInit() {
    super.onInit();

    loadMessages();
  }

  void loadMessages() async {
    var loadMessage;
    var sendMessage;

    try {
      // Load sent messages
      await firestore
          .collection('Messages')
          .doc(getUser)
          .collection("messages")
          .doc(auth.currentUser?.uid)
          .collection(date.toString())
          .get()
          .then((QuerySnapshot querySnapshot) {
        for (var doc in querySnapshot.docs) {
          sendMessage = types.TextMessage(
              author: types.User.fromJson(doc['author'] as Map<String, dynamic>),
              createdAt: doc["createdAt"],
              id: doc["id"],
              text: doc["text"],
              //metadata: doc["metadata"]
          );

          messages.add(sendMessage);
        }
      });
    } catch (e) {
      // Handle error
    }

    try {
      // Load response messages
      await firestore
          .collection('Messages')
          .doc(auth.currentUser?.uid)
          .collection("messages")
          .doc(getUser)
          .collection(date.toString())
          .get()
          .then((QuerySnapshot querySnapshot) {
        for (var doc in querySnapshot.docs) {
          loadMessage = types.TextMessage(
              author: types.User.fromJson(doc['author'] as Map<String, dynamic>),
              createdAt: doc["createdAt"],
              id: doc["id"],
              text: doc["text"],
              //metadata: doc["metadata"]
          );
          messages.add(loadMessage);
        }
      });
    } catch (e) {
      // Handle error
    }
  }

  void addMessage(types.Message message) {
    messages.add(message);
  }

  void sendTextMessage(String text) {
    final textMessage = types.TextMessage(
      author:user.value,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: const Uuid().v4(),
      text: text,
    );
    addMessageToFirestore(textMessage);
  }

  void addMessageToFirestore(types.TextMessage message) async {
    final messageData = {
      "author": message.author.toJson(),
     // "metadata": message.metadata,
      'text': message.text,
      'createdAt': message.createdAt,
      "id": message.id,
    };

    await firestore
        .collection('Messages')
        .doc(getUser)
        .collection("messages")
        .doc(message.author.id)
        .collection(date.toString())
        .doc(message.id)
        .set(messageData);

    addMessage(message);
  }

  void updateMessage(int index, types.Message updatedMessage) {}
}

