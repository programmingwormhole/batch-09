import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/note_model.dart';

class NotesController extends GetxController {
  RxList<NoteModel> notes = <NoteModel>[].obs;

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  void createNote() {
    if (titleController.text.isEmpty || descriptionController.text.isEmpty) {
      Get.snackbar(
        'Error',
        'All fields is required.',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    notes.add(
      NoteModel(
        title: titleController.text,
        description: descriptionController.text,
        createdAt: DateTime.now(),
      ),
    );

    update();

    titleController.clear();
    descriptionController.clear();

    Get.back();
  }

  void deleteNote (int index) {
    notes.removeAt(index);
    Get.snackbar(
      'Success',
      'The note has been deleted.',
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
