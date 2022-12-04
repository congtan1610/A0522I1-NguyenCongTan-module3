package manager.repository;

import manager.model.Note;

import java.util.List;

public interface INoteRepo {
    List<Note> findAll();
    void searchNote(String title);
    void addNnote(Note  note);
    void removeNote(String id);
}
