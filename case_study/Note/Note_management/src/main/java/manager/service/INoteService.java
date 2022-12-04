package manager.service;

import manager.model.Note;

import java.util.List;

public interface INoteService {
    List<Note> findAll();
    void searchNote(String title);
    void addNnote(Note  note);
    void removeNote(String id);
}
