import 'package:flutter/material.dart';
import 'package:whatsapp_ui/utils/colors.dart';
import 'package:whatsapp_ui/views/home/tab_views/calls_tab.dart';
import 'package:whatsapp_ui/views/home/tab_views/chats_tab.dart';
import 'package:whatsapp_ui/views/home/tab_views/community.dart';
import 'package:whatsapp_ui/views/home/tab_views/updates_tab.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          centerTitle: false,
          title: const Text(
            'WhatsApp',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.camera_alt_outlined,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search_rounded,
                color: Colors.white,
              ),
            ),
            PopupMenuButton(
              itemBuilder: (context) {
                return [
                  const PopupMenuItem(child: Text('New Group')),
                  const PopupMenuItem(child: Text('New broadcast')),
                  const PopupMenuItem(child: Text('Linked Device')),
                  const PopupMenuItem(child: Text('Starred messages')),
                  const PopupMenuItem(child: Text('Settings')),
                ];
              },
              icon: const Icon(
                Icons.more_vert,
                color: Colors.white,
              ),
            ),
          ],
          bottom: TabBar(
            labelColor: Colors.white,
            labelStyle: const TextStyle(
              fontWeight: FontWeight.w700,
            ),
            unselectedLabelColor: Colors.white.withOpacity(.5),
            dividerColor: Colors.white,
            indicatorColor: Colors.white,
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: const [
              Tab(
                icon: Icon(Icons.groups),
              ),
              Tab(
                text: 'Chats',
              ),
              Tab(
                text: 'Updates',
              ),
              Tab(
                text: 'Calls',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            const CommunityTab(),
            ChatsTab(),
            const UpdatesTab(),
            const CallsTab(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.primaryColor,
          onPressed: () {},
          child: const Icon(
            Icons.message,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
