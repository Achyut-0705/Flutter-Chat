import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  var messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat App'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                ChatMessage(
                  text: 'Hello!',
                  isMe: false,
                  time: '10:00 AM',
                  avatar: 'assets/images/avatar.jpeg',
                ),
                ChatMessage(
                  text: 'Hi there!',
                  isMe: true,
                  time: '10:05 AM',
                  avatar: 'assets/images/avatar.jpeg',
                ),
                // Add more messages here
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: messageController,
                    decoration: const InputDecoration(
                      hintText: 'Type a message...',
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    // Add send message functionality here
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  final String text;
  final bool isMe;
  final String time;
  final String avatar;

  ChatMessage({
    required this.text,
    required this.isMe,
    required this.time,
    required this.avatar,
  });

  @override
  Widget build(BuildContext context) {
    final messageColor = isMe ? Colors.blue : Colors.green;
    final messageAlignment =
        isMe ? MainAxisAlignment.end : MainAxisAlignment.start;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: messageAlignment,
        children: [
          if (!isMe)
            CircleAvatar(
              backgroundImage: AssetImage(avatar),
              radius: 20.0,
            ),
          Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.7,
            ),
            padding: EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: messageColor,
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Column(
              crossAxisAlignment:
                  isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                Text(
                  text,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(height: 4.0),
                Text(
                  time,
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          if (isMe)
            CircleAvatar(
              backgroundImage: AssetImage(avatar),
              radius: 20.0,
            ),
        ],
      ),
    );
  }
}
