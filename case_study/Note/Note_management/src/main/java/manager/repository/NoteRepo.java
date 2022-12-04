package manager.repository;

import manager.model.Note;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class NoteRepo implements INoteRepo {
    private List<Note> list = new ArrayList<>();
    Baserepo baserepo = new Baserepo();

    @Override
    public List<Note> findAll() {
        List<Note> noteList = new ArrayList<>();
        try (Connection connection = baserepo.getConnectionJavaToDB();
             PreparedStatement preparedStatement = connection.prepareStatement("select * from note");
             ResultSet rs = preparedStatement.executeQuery();
        ) {
            Note note;
            while (rs.next()) {
                note = new Note();
                note.setTypeId(rs.getInt("type_id"));
                note.setTitle(rs.getString("title"));
                note.setContent(rs.getString("content"));
                noteList.add(note);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return noteList;
    }

    @Override
    public void searchNote(String title) {

    }

    @Override
    public void addNnote(Note note) {
        try (Connection connection = baserepo.getConnectionJavaToDB();
             PreparedStatement preparedStatement = connection.prepareStatement("insert into note(title,content) value (?,?)");) {
            preparedStatement.setString(1,note.getTitle());
            preparedStatement.setString(2,note.getContent());
            preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public void removeNote(String id) {

    }
}
