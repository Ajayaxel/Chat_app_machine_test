import 'package:chat_app/Controller/chat_controller.dart';
import 'package:chat_app/View/chat_screnn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({super.key});

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  final ChatController _chatController = Get.find<ChatController>();

  @override
  void initState() {
    _chatController.getChat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back button + Title
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.arrow_back, color: Colors.black),
                  ),
                  const SizedBox(width: 16),
                  const Text(
                    "Messages",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                      color: Color(0xff2E0E16),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 27),

              // Horizontal List of Profiles
              Obx(
                () => SizedBox(
                  height: 80,
                  child: _chatController.chatData.value == null
                      ? const Center(child: CircularProgressIndicator())
                      : ListView(
                          scrollDirection: Axis.horizontal,
                          children: List.generate(
                            _chatController.chatData.value!.included?.length ?? 0,
                            (index) {
                              final user = _chatController.chatData.value!.included?[index];
                              return _UserAvatar(
                                name: user?.attributes?.name ?? "",
                                imageUrl: user?.attributes?.profilePhotoUrl ?? '',
                              );
                            },
                          ),
                        ),
                ),
              ),

              const SizedBox(height: 20),

              // Search Bar
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: const Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Search",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Icon(Icons.search),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              const Text(
                "Chat",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),

              const SizedBox(height: 16),

              // Chat List
              Expanded(
                child: Obx(
                  () {
                    final chatList = _chatController.chatData.value?.included ?? [];

                    if (chatList.isEmpty) {
                      return const Center(child: Text("No messages yet"));
                    }

                    return ListView.separated(
                      itemCount: chatList.length,
                      separatorBuilder: (context, index) => const Divider(),
                      itemBuilder: (context, index) {
                        final user = chatList[index];
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(user.attributes?.profilePhotoUrl ?? ''),
                            radius: 25,
                          ),
                          title: Text(
                            user.attributes?.name ?? '',
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          trailing: const Text(
                            '10:00 AM', // You can make this dynamic if needed
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'Poppins',
                              color: Colors.grey,
                            ),
                          ),
                          onTap: () {
                            // Navigate to ChatScreen with user data
                            Get.to(() => ChatScreen(name: user.attributes?.name ?? '', imageUrl: user.attributes?.profilePhotoUrl ?? ''));
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _UserAvatar extends StatelessWidget {
  final String name;
  final String imageUrl;

  const _UserAvatar({required this.name, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      margin: const EdgeInsets.only(right: 15),
      child: Column(
        children: [
          CircleAvatar(radius: 25, backgroundImage: NetworkImage(imageUrl)),
          const SizedBox(height: 5),
          Text(
            name,
            style: const TextStyle(
              fontSize: 12,
              fontFamily: 'Poppins',
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

