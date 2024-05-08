import 'dart:convert';
import 'dart:io';

import 'package:bubble/bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

import '../../../Model/snapshot_handler.dart';
import '../../coreRes/color_handler.dart';
import '../../coreRes/icon_handler.dart';

class ChatScreenHandler extends StatefulWidget {
  const ChatScreenHandler(
      {super.key,
        this.isComunityPage = true,
        this.Uid = '',
        this.FriendName = '',
        this.ImgSrc = ''});
  final isComunityPage;
  final String Uid;
  final String FriendName;
  final String ImgSrc;

  @override
  State<ChatScreenHandler> createState() => _ChatScreenHandlerState();
}

class _ChatScreenHandlerState extends State<ChatScreenHandler> {
  List<types.Message> _messages = [];
  final FirebaseAuth auth = FirebaseAuth.instance;
  DateTime now = DateTime.now();

  late DateTime date = DateTime(now.year, now.month, now.day);

  late final _user = types.User(
    id: auth.currentUser!.uid,
  );

  @override
  void initState() {
    super.initState();
    setState(() {
      _loadMessages();
    });
  }

  void _loadMessages() async {
    var loadMessage;
    var sendMessage;

    try {
      //load send messages
      await FirebaseFirestore.instance
          .collection('Messages')
          .doc(widget.Uid)
          .collection("messages")
          .doc(auth.currentUser?.uid)
          .collection(date.toString())
          .get()
          .then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((doc) {
          sendMessage = types.TextMessage(
              author:
              types.User.fromJson(doc['author'] as Map<String, dynamic>),
              createdAt: doc["createdAt"],
              id: doc["id"],
              text: doc["text"],
              metadata: doc["metadata"]);
          setState(() {
            _messages.add(sendMessage);
          });
        });
      });
    } catch (e) {}

    try {
      //load response  messages

      await FirebaseFirestore.instance
          .collection('Messages')
          .doc(auth.currentUser?.uid)
          .collection("messages")
          .doc(widget.Uid)
          .collection(date.toString())
          .get()
          .then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((doc) {
          loadMessage = types.TextMessage(
              author:
              types.User.fromJson(doc['author'] as Map<String, dynamic>),
              createdAt: doc["createdAt"],
              id: doc["id"],
              text: doc["text"],
              metadata: doc["metadata"]);

          setState(() {
            _messages.add(loadMessage);
          });
        });
      });
    } catch (e) {}
  }

  void _addMessage(types.Message message) {
    setState(() {
      _messages.add(message);
    });
  }

  void _handleAttachmentPressed() {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) => SafeArea(
        child: Container(
          color: ColorHandler.bgColor.withOpacity(0.8),
          height: 144,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  _handleImageSelection();
                },
                child: const Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    'Photo',
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  _handleFileSelection();
                },
                child: const Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text('File'),
                ),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text('Cancel'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleFileSelection() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.any,
    );

    if (result != null && result.files.single.path != null) {
      final message = types.FileMessage(
        author: _user,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: const Uuid().v4(),
        mimeType: lookupMimeType(result.files.single.path!),
        name: result.files.single.name,
        size: result.files.single.size,
        uri: result.files.single.path!,
      );

      _addMessage(message);
    }
  }

  void _handleImageSelection() async {
    final result = await ImagePicker().pickImage(
      imageQuality: 70,
      maxWidth: 1440,
      source: ImageSource.gallery,
    );

    if (result != null) {
      final bytes = await result.readAsBytes();
      final image = await decodeImageFromList(bytes);

      final message = types.ImageMessage(
        author: _user,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        height: image.height.toDouble(),
        id: const Uuid().v4(),
        name: result.name,
        size: bytes.length,
        uri: result.path,
        width: image.width.toDouble(),
      );

      _addMessage(message);
    }
  }

  void _handleMessageTap(BuildContext _, types.Message message) async {
    if (message is types.FileMessage) {
      var localPath = message.uri;

      if (message.uri.startsWith('http')) {
        try {
          final index =
          _messages.indexWhere((element) => element.id == message.id);
          final updatedMessage =
          (_messages[index] as types.FileMessage).copyWith(
            isLoading: true,
          );

          setState(() {
            _messages[index] = updatedMessage;
          });

          final client = http.Client();
          final request = await client.get(Uri.parse(message.uri));
          final bytes = request.bodyBytes;
          final documentsDir = (await getApplicationDocumentsDirectory()).path;
          localPath = '$documentsDir/${message.name}';

          if (!File(localPath).existsSync()) {
            final file = File(localPath);
            await file.writeAsBytes(bytes);
          }
        } finally {
          final index =
          _messages.indexWhere((element) => element.id == message.id);
          final updatedMessage =
          (_messages[index] as types.FileMessage).copyWith(
            isLoading: null,
          );

          setState(() {
            _messages[index] = updatedMessage;
          });
        }
      }

      await OpenFilex.open(localPath);
    }
  }

  void _handlePreviewDataFetched(
      types.TextMessage message,
      types.PreviewData previewData,
      ) {
    final index = _messages.indexWhere((element) => element.id == message.id);
    final updatedMessage = (_messages[index] as types.TextMessage).copyWith(
      previewData: previewData,
    );

    setState(() {
      _messages[index] = updatedMessage;
    });
  }

  void _handleSendPressed(types.PartialText message) {
    final textMessage = types.TextMessage(
        author: _user,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: const Uuid().v4(),
        text: message.text,
        metadata: message.metadata);

    _addMessageToFirestore(textMessage);
  }

  void _addMessageToFirestore(types.TextMessage message) async {
    final messageData = {
      "author": message.author.toJson(),
      "metadata": message.metadata,
      'text': message.text,
      'createdAt': message.createdAt,
      "id": message.id,
    };

    await SnapShotHandler.SetData(
        FirebaseFirestore.instance
            .collection('Messages')
            .doc(widget.Uid)
            .collection("messages")
            .doc(message.author.id)
            .collection(date.toString())
            .doc(message.id),
        messageData);
    _addMessage(message);
  }

  Widget _bubbleBuilder(
      Widget child, {
        required types.Message message,
        required bool nextMessageInGroup,
      }) =>
      Bubble(
          color: _user.id != message.author.id ||
              message.type == types.MessageType.image
              ? const Color(0xffa29ae1) // Color for other user's messages
              : const Color(0xff6f61e8), // Color for current user's messages
          margin: nextMessageInGroup
              ? const BubbleEdges.symmetric(horizontal: 6)
              : null,
          nip: nextMessageInGroup
              ? BubbleNip.no
              : _user.id != message.author.id
              ? BubbleNip.leftTop
              : BubbleNip.rightTop,
          alignment: _user.id != message.author
              ? Alignment.bottomRight
              : Alignment.bottomLeft,
          padding: const BubbleEdges.all(8), // Padding for the bubble
          radius: const Radius.circular(20), // Border radius for the bubble
          nipWidth: 8, // Width of the arrow
          nipHeight: 16, // Height of the arrow
          nipRadius: 2, // Radius of the arrow
          elevation: 100,
          nipOffset: 2,
          borderUp: true,
          child: child);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.isComunityPage
          ? AppBar(
        centerTitle: true,
        backgroundColor: ColorHandler.bgColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            IconHandler.angle_left,
            color: ColorHandler.normalFont,
          ),
        ),
        title: Row(
          children: [
            SizedBox(
              width: 35.sp,
              height: 35.sp,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100.sp),
                child: Image.network(
                  widget.ImgSrc,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              widget.FriendName,
              style: TextStyle(
                color: ColorHandler.normalFont,
                fontWeight: FontWeight.normal,
                fontSize: 20.sp,
              ),
              textDirection: TextDirection.ltr,
              textAlign: TextAlign.left,
            ),
          ],
        ),
      )
          : null,
      body: Chat(
        messages: _messages,
        bubbleBuilder: _bubbleBuilder,
        onAttachmentPressed: _handleAttachmentPressed,
        onMessageTap: _handleMessageTap,
        onPreviewDataFetched: _handlePreviewDataFetched,
        onSendPressed: _handleSendPressed,
        scrollToUnreadOptions: const ScrollToUnreadOptions(
          lastReadMessageId: 'lastReadMessageId',
          scrollOnOpen: true,
        ),
        showUserAvatars: false, // Hide user avatars
        showUserNames: false, // Hide user names
        isLeftStatus: true, // Show status on the left side
        user: _user,
        theme: const DefaultChatTheme(
          backgroundColor: ColorHandler.bgColor,
          seenIcon: Text(
            'read',
            style: TextStyle(
              fontSize: 10.0,
            ),
          ),
        ),
        messageWidthRatio: 0.80,
      ),
    );
  }
}
