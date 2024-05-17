import 'dart:html';

import 'package:bubble/bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

import '../../../Controller/ChatScreen/ChatController.dart';
import '../../../Model/snapshot_handler.dart';
import '../../../Resource/color_handler.dart';
import '../../../Resource/icon_handler.dart';

class ChatScreenHandler extends StatelessWidget {
  const ChatScreenHandler({
    super.key,
    this.isComunityPage = true,
    this.Uid = '',
    this.FriendName = '',
    this.ImgSrc = '',
  });

  final bool isComunityPage;
  final String Uid;
  final String FriendName;
  final String ImgSrc;

  @override
  Widget build(BuildContext context) {
    final ChatController controller = Get.put(ChatController());

    return Scaffold(
      appBar: isComunityPage
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
                  ImgSrc,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              FriendName,
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
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Obx(() => Chat(
          messages: controller.messages,
          bubbleBuilder: _bubbleBuilder,
          onAttachmentPressed: () => _handleAttachmentPressed(context, controller),
          onMessageTap: _handleMessageTap,
          onPreviewDataFetched: _handlePreviewDataFetched,
          onSendPressed: (types.PartialText message) =>
              controller.sendTextMessage(message.text),
          scrollToUnreadOptions: const ScrollToUnreadOptions(
            lastReadMessageId: 'lastReadMessageId',
            scrollOnOpen: true,

          ),
          keyboardDismissBehavior:ScrollViewKeyboardDismissBehavior.onDrag,
          showUserAvatars: false,
          showUserNames: false,
          isLeftStatus: true,
          user: controller.user,
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
        )),
      ),
    );
  }

  void _handleAttachmentPressed(BuildContext context, ChatController controller) {
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
                  _handleImageSelection(controller);
                },
                child: const Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text('Photo'),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  _handleFileSelection(controller);
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

  void _handleFileSelection(ChatController controller) async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.any,
    );

    if (result != null && result.files.single.path != null) {
      final message = types.FileMessage(
        author: controller.user, // Get the actual user value from Rx<User>
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: const Uuid().v4(),
        mimeType: lookupMimeType(result.files.single.path!),
        name: result.files.single.name,
        size: result.files.single.size,
        uri: result.files.single.path!,
      );

      controller.addMessage(message);
    }
  }

  void _handleImageSelection(ChatController controller) async {
    final result = await ImagePicker().pickImage(
      imageQuality: 70,
      maxWidth: 1440,
      source: ImageSource.gallery,
    );

    if (result != null) {
      final bytes = await result.readAsBytes();
      final image = await decodeImageFromList(bytes);

      final message = types.ImageMessage(
        author: controller.user, // Get the actual user value from Rx<User>
        createdAt: DateTime.now().millisecondsSinceEpoch,
        height: image.height.toDouble(),
        id: const Uuid().v4(),
        name: result.name,
        size: bytes.length,
        uri: result.path,
        width: image.width.toDouble(),
      );

      controller.addMessage(message);
    }
  }

  void _handleMessageTap(BuildContext _, types.Message message) async {
    final ChatController controller = Get.find<ChatController>(); // Define the controller instance
    if (message is types.FileMessage) {
      var localPath = message.uri;

      if (message.uri.startsWith('http')) {
        try {
          final index = controller.messages.indexWhere((element) => element.id == message.id);
          final updatedMessage = (controller.messages[index] as types.FileMessage).copyWith(isLoading: true);

          controller.updateMessage(index, updatedMessage);

          final client = http.Client();
          final request = await client.get(Uri.parse(message.uri));
          final bytes = request.bodyBytes;
          final documentsDir = (await getApplicationDocumentsDirectory()).path;
          localPath = '$documentsDir/${message.name}';

          // if (!File(localPath).existsSync()) {
          //   final file = File(localPath);
          //   await file.writeAsBytes(bytes);
          // }
        } finally {
          final index = controller.messages.indexWhere((element) => element.id == message.id);
          final updatedMessage = (controller.messages[index] as types.FileMessage).copyWith(isLoading: null);

          controller.updateMessage(index, updatedMessage);
        }
      }

      await OpenFilex.open(localPath);
    }
  }


  void _handlePreviewDataFetched(types.TextMessage message, types.PreviewData previewData) {
    final ChatController controller = Get.find<ChatController>(); // Define the controller instance

    final index = controller.messages.indexWhere((element) => element.id == message.id);

    final updatedMessage = (controller.messages[index] as types.TextMessage).copyWith(previewData: previewData);

    controller.updateMessage(index, updatedMessage);
  }

  Widget _bubbleBuilder(Widget child, {required types.Message message, required bool nextMessageInGroup}) {
    final ChatController controller = Get.find<ChatController>(); // Define the controller instance
    return Bubble(
      color: controller.user.id != message.author.id || message.type == types.MessageType.image
          ? const Color(0xffa29ae1)
          : const Color(0xff6f61e8),
      margin: nextMessageInGroup ? const BubbleEdges.symmetric(horizontal: 0) : null,
      nip: nextMessageInGroup
          ? BubbleNip.no
          : controller.user.id != message.author.id
          ? BubbleNip.leftTop
          : BubbleNip.rightTop,
      child: child,
    );
  }
}
