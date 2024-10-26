import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_ui/controllers/notes_controller.dart';
import 'package:whatsapp_ui/views/notes/create_or_update_note.dart';
import 'package:whatsapp_ui/widgets/custom_notes_tile.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NotesController());

    return Scaffold(
      backgroundColor: const Color(0xFFf5f5f5),
      appBar: AppBar(
        backgroundColor: const Color(0xFFf5f5f5),
        centerTitle: false,
        title: const Text('Notes'),
        actions: [
          IconButton(onPressed: () {
            controller.loadNotes();
          }, icon: const Icon(Icons.settings)),
        ],
      ),
      body: Obx(() {
        if (controller.notes.isEmpty) {
          return const Center(
            child: Text('No Notes'),
          );
        } else {
          return ListView.separated(
            padding: const EdgeInsets.all(12),
            itemBuilder: (context, index) {
              return CustomNotesTile(
                index: index,
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 10,
              );
            },
            itemCount: controller.notes.length,
          );
        }
      }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        shape: const CircleBorder(),
        onPressed: () {
          Get.to(() => const CreateOrUpdateNoteView());
        },
        child: const Icon(
          Icons.add,
          color: Colors.blue,
        ),
      ),
    );
  }
}
