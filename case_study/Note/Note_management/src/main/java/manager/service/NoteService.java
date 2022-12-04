package manager.service;

import manager.model.Note;
import manager.repository.NoteRepo;

import java.util.List;

public class NoteService implements INoteService {
    private NoteRepo noteRepo = new NoteRepo();

    @Override
    public List<Note> findAll() {
        return noteRepo.findAll();
    }

    @Override
    public void searchNote(String title) {
        noteRepo.searchNote(title);
    }

    @Override
    public void addNnote(Note note) {
        noteRepo.addNnote(note);
    }

    @Override
    public void removeNote(String id) {
        noteRepo.removeNote(id);
    }
}
