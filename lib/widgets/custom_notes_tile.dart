import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_ui/controllers/notes_controller.dart';
import 'package:whatsapp_ui/views/notes/create_or_update_note.dart';

class CustomNotesTile extends StatelessWidget {
  final int index;

  const CustomNotesTile({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NotesController());

    final note = controller.notes[index];

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(13),
      ),
      child: ListTile(
        onTap: () {
          Get.to(() => CreateOrUpdateNoteView(
            note: note,
          ));
        },
        contentPadding: const EdgeInsets.fromLTRB(10, 5, 0, 5),
        title: Text(
          note.title,
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              note.description,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.black.withOpacity(.5),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Created At: ${note.createdAt.day}/${note.createdAt.month}/${note.createdAt.year}',
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.black.withOpacity(.5),
                  ),
                ),
                if (note.updatedAt != null)
                  Text(
                    'Updated At: ${note.updatedAt!.day}/${note.updatedAt!.month}/${note.updatedAt!.year}',
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.black.withOpacity(.5),
                    ),
                  )
              ],
            ),
          ],
        ),
        trailing: IconButton(
          onPressed: () {
            controller.deleteNote(index);
          },
          icon: Icon(
            Icons.delete,
            color: Colors.black.withOpacity(.5),
          ),
        ),
      ),
    );
  }
}
