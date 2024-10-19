import 'package:flutter/material.dart';

import '../../../utils/colors.dart';

class ChatsTab extends StatelessWidget {
  ChatsTab({super.key});

  List<Map<String, dynamic>> chats = [
    {
      'name': 'Md Shirajul Islam',
      'profile_picture':
          'https://pics.craiyon.com/2023-11-26/oMNPpACzTtO5OVERUZwh3Q.webp',
      'last_message': 'How are you?',
      'last_message_time': '08:11 PM',
      'unread': 0,
    },
    {
      'name': 'Mazharul Islam',
      'profile_picture':
          'https://lh3.googleusercontent.com/a/ACg8ocIA3EGdXjM75THclUZ0MwJSU-qUe3d_g7YG7AFmT3Ci62yRTq4T=s192-c-mo',
      'last_message': 'Hi there, Are you hear me?',
      'last_message_time': '09:00 PM',
      'unread': 6,
    },
    {
      'name': 'Md Rahman',
      'profile_picture':
          'https://lh3.googleusercontent.com/a/ACg8ocJUs_Ov-V91PIodHPDZabTaAdJfwv3UwB_pGj5Lr-m87lMG5RnH=s192-c-mo',
      'last_message': 'Assalamu Alaikum.',
      'last_message_time': '07:51 PM',
      'unread': 1,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: chats.length,
      itemBuilder: (context, index) {
        var data = chats[index];

        return ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(data['profile_picture']),
          ),
          title: Text(
            data['name'],
            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          subtitle: Text(
            data['last_message'],
            style: TextStyle(
              color: Colors.black.withOpacity(.5),
            ),
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                data['last_message_time'],
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w700,
                ),
              ),

              // if (unread == 0) {} else {}

              // unread == 0 ? Text() : Text(),

              data['unread'] != 0
                  ? Container(
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          data['unread'].toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    )
                  : const SizedBox()
            ],
          ),
        );
      },
    );
  }
}
