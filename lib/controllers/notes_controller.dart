import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
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

    storeData();

    update();

    titleController.clear();
    descriptionController.clear();

    Get.back();
  }

  void deleteNote(int index) {
    notes.removeAt(index);
    Get.snackbar(
      'Success',
      'The note has been deleted.',
      snackPosition: SnackPosition.BOTTOM,
    );
    storeData();
  }

  void updateNote (int index, NoteModel note) {
    notes[index] = NoteModel(
      title: titleController.text,
      description: descriptionController.text,
      createdAt: note.createdAt,
      updatedAt: DateTime.now(),
    );

    storeData();

    update();

    titleController.clear();
    descriptionController.clear();

    Get.back();
  }

  void storeData() async {
    var prefs = await SharedPreferences.getInstance();

    var notesListMap = notes.map((note) {
      return {
        'title': note.title,
        'description': note.description,
        'created_at': note.createdAt.toString(),
        'updated_at': note.updatedAt.toString(),
      };
    }).toList();

    var notesListString = jsonEncode(notesListMap);

    prefs.setString('notes', notesListString);
  }

  void loadNotes() async {
    var prefs = await SharedPreferences.getInstance();

    var notesListString = prefs.getString('notes');

    if (notesListString != null) {
      var notesListMap = jsonDecode(notesListString) as List;

      print(notesListMap);

      var notesListModel = notesListMap.map((note) {
        return NoteModel(
          title: note['title'],
          description: note['description'],
          createdAt: DateTime.parse(note['created_at']),
          updatedAt: note['updated_at'] == 'null' ? null : DateTime.now(),
        );
      }).toList();

      notes.addAll(notesListModel);
      update();

    }
  }

  @override
  void onInit() {
    super.onInit();
    loadNotes();
  }

}
