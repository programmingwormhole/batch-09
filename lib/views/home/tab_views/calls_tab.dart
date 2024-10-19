import 'package:flutter/material.dart';

class CallsTab extends StatelessWidget {
  const CallsTab({super.key});

  @override
  Widget build(BuildContext context) {

    List<Map<String, dynamic>> calls = [
      {
        'name': 'Md Shirajul Islam',
        'profile_picture':
        'https://pics.craiyon.com/2023-11-26/oMNPpACzTtO5OVERUZwh3Q.webp',
        'time' : '7 minutes ago',
        'type' : 'ingoing',
        'video_or_audio' : 'audio',
      },
      {
        'name': 'Mazharul Islam',
        'profile_picture':
        'https://lh3.googleusercontent.com/a/ACg8ocIA3EGdXjM75THclUZ0MwJSU-qUe3d_g7YG7AFmT3Ci62yRTq4T=s192-c-mo',
        'time' : 'Today, 8:04 PM',
        'type' : 'outgoing',
        'video_or_audio' : 'audio',
      },
      {
        'name': 'Md Rahman',
        'profile_picture':
        'https://lh3.googleusercontent.com/a/ACg8ocJUs_Ov-V91PIodHPDZabTaAdJfwv3UwB_pGj5Lr-m87lMG5RnH=s192-c-mo',
        'time' : 'Today, 7:31 PM',
        'type' : 'ingoing',
        'video_or_audio' : 'video',
      },
    ];


    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Recent updates'),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: const CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage('https://lh3.googleusercontent.com/a/ACg8ocI4b7bdUrxKm742HoV4FXL77X1zG_5O-ZNgOhwwavfg9s0_W3to=s192-c-mo'),
            ),
            title: const Text('Md Farhan',
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),),
            subtitle: const Row(
              children: [
                Icon(Icons.call_made, size: 18,),
                SizedBox(
                  width: 5,
                ),
                Text('20 minutes ago',),
              ],
            ),
            trailing: IconButton(onPressed: () {}, icon: const Icon(Icons.call)),
          ),
        ],
      ),
    );
  }
}
