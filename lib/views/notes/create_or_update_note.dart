import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_ui/controllers/notes_controller.dart';
import 'package:whatsapp_ui/models/note_model.dart';

class CreateOrUpdateNoteView extends StatefulWidget {
  final NoteModel? note;
  final int? index;

  const CreateOrUpdateNoteView({
    super.key,
    this.note,
    this.index,
  });

  @override
  State<CreateOrUpdateNoteView> createState() => _CreateOrUpdateNoteViewState();
}

class _CreateOrUpdateNoteViewState extends State<CreateOrUpdateNoteView> {
  final controller = Get.put(NotesController());

  @override
  void initState() {
    super.initState();
    if (widget.note != null) {
      controller.titleController.text = widget.note!.title;
      controller.descriptionController.text = widget.note!.description;
    }
  }

  @override
  void dispose() {
    super.dispose();
    controller.titleController.clear();
    controller.descriptionController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFf5f5f5),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
        title: Text('${widget.note == null ? 'Create' : 'Update'} Note'),
        centerTitle: false,
        actions: [
          TextButton(
            onPressed: () {
              if (widget.note == null) {
                controller.createNote();
              } else {
                controller.updateNote(
                  widget.index!,
                  widget.note!,
                );
              }
            },
            child: const Icon(Icons.done),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextFormField(
              controller: controller.titleController,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Title',
                hintStyle: TextStyle(
                  color: Colors.black.withOpacity(.4),
                ),
              ),
            ),
            Expanded(
              child: TextFormField(
                controller: controller.descriptionController,
                minLines: 40,
                maxLines: 40,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Note something down...',
                  hintStyle: TextStyle(
                    color: Colors.black.withOpacity(.4),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
