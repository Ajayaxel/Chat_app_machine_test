import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final String name;
  final String imageUrl;

  const ChatScreen({super.key, required this.name, required this.imageUrl});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<String> messages = ["Hi"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              children: [
                // Header
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: const Icon(Icons.arrow_back, color: Colors.black),
                      ),
                      const SizedBox(width: 10),
                      Stack(
                        children: [
                          CircleAvatar(
                            radius: 24,
                            backgroundImage: NetworkImage(widget.imageUrl),
                          ),
                          Positioned(
                            bottom: -2,
                            right: -2,
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.keyboard_alt_outlined,
                                size: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          const Text(
                            "Online",
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 12,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 10),
                const Text("Today", style: TextStyle(fontFamily: 'Poppins')),

                // Chat Bubble Section
                Expanded(
                  child: Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(top: 16),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(30)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
                      child: ListView.builder(
                        reverse: true, // Latest at bottom
                        itemCount: messages.length,
                        padding: EdgeInsets.only(bottom: 20),
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 12,
                                ),
                                margin: const EdgeInsets.only(bottom: 4),
                                decoration: BoxDecoration(
                                  color: Colors.pink.shade300,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  messages[index],
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ),
                              const Text(
                                "10:00 AM ✓✓",
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.black54,
                                ),
                              ),
                              const SizedBox(height: 10),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ),

                // Bottom Input Section
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.only(
                    left: 16,
                    right: 16,
                    bottom: MediaQuery.of(context).viewInsets.bottom + 10,
                    top: 10,
                  ),
                  child: SafeArea(
                    top: false,
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 18),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: TextField(
                              controller: _controller,
                              style: const TextStyle(fontFamily: 'Poppins'),
                              decoration: InputDecoration(
                                hintText: "Happy Birthday",
                                hintStyle:
                                    const TextStyle(fontFamily: 'Poppins'),
                                border: InputBorder.none,
                                isDense: true,
                                contentPadding:
                                    const EdgeInsets.symmetric(vertical: 14),
                                suffixIcon: IconButton(
                                  icon: const Icon(Icons.send,
                                      color: Colors.red),
                                  onPressed: () {
                                    if (_controller.text.trim().isNotEmpty) {
                                      setState(() {
                                        messages.insert(
                                            0, _controller.text.trim());
                                        _controller.clear();
                                      });
                                    }
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

