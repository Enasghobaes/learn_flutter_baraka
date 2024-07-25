
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';


// class ChatPage extends ConsumerWidget {
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final chatStream = ref.watch(chatStreamProvider);
//     final chatNotifier = ref.watch(chatNotifierProvider.notifier);
//     final messageController = TextEditingController();

//     return Scaffold(
//       body: Center(
//         child: chatStream.when(
//           data: (data) {
//             return Column(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 Expanded(
//                   child: ListView.builder(
//                     itemCount: data.length,
//                     itemBuilder: (context, index) {
//                       final isMe = data[index]['is_me'] as bool;
//                       final message = data[index]['message'] as String;

//                       return SizedBox(
//                         width: 100,
//                         height: 60,
//                         child: Align(
//                           alignment: isMe ? Alignment.topRight : Alignment.topLeft,
//                           child: Card(
//                             child: Container(
//                               decoration: BoxDecoration(
//                                 color: isMe ? Colors.blue : Colors.grey[300],
//                                 borderRadius: BorderRadius.only(
//                                   bottomLeft: isMe ? Radius.circular(20) : Radius.zero,
//                                   bottomRight: isMe ? Radius.zero : Radius.circular(20),
//                                   topLeft: Radius.circular(20),
//                                   topRight: Radius.circular(20),
//                                 ),
//                               ),
//                               width: 300,
//                               height: 100,
//                               child: Center(
//                                 child: Text(message),
//                               ),
//                             ),
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//                 Row(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: SizedBox(
//                         width: MediaQuery.of(context).size.width * 0.8,
//                         child: TextField(
//                           controller: messageController,
//                           decoration: InputDecoration(
//                             border: OutlineInputBorder(),
//                           ),
//                         ),
//                       ),
//                     ),
//                     IconButton(
//                       onPressed: () async {
//                         await chatNotifier.sendMessage(messageController.text);
//                         messageController.clear();
//                       },
//                       icon: Icon(Icons.send),
//                     ),
//                   ],
//                 ),
//               ],
//             );
//           },
//           loading: () => CircularProgressIndicator(),
//           error: (error, stack) => Text('Error: $error'),
//         ),
//       ),
//     );
//   }
// }
