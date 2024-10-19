import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_ui/utils/colors.dart';

class UpdatesTab extends StatelessWidget {
  const UpdatesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Status'),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Stack(
              alignment: Alignment.bottomRight,
              children: [
                const CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage('https://lh3.googleusercontent.com/a/ACg8ocI4b7bdUrxKm742HoV4FXL77X1zG_5O-ZNgOhwwavfg9s0_W3to=s192-c-mo'),
                ),
                Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Icon(Icons.add, color: Colors.white, size: 20,),
                  ),
                )
              ],
            ),
            title: const Text('My status',
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),),
            subtitle: const Text('Tap to add status update',),
          ),

          const SizedBox(
            height: 10,
          ),
          const Text('Recent updates'),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.primaryColor,
                  width: 2,
                )
              ),
              child: const CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage('https://lh3.googleusercontent.com/a/ACg8ocI4b7bdUrxKm742HoV4FXL77X1zG_5O-ZNgOhwwavfg9s0_W3to=s192-c-mo'),
              ),
            ),
            title: const Text('Md Farhan',
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),),
            subtitle: const Text('20 minutes ago',),
          ),
        ],
      ),
    );
  }
}
