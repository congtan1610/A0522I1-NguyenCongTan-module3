package manager.controller;

import manager.model.Note;
import manager.service.NoteService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/note")
public class NoteServlet extends HttpServlet {
    private NoteService noteService = new NoteService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "list";
        }
        switch (action) {
            case "list":
                findAll(req, resp);
                break;
            case "add":
                showAdd(req, resp);
                break;
            default:
                findAll(req, resp);
        }
    }

    private void showAdd(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/note/add.jsp").forward(req, resp);
    }

    private void findAll(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("list", noteService.findAll());
        req.getRequestDispatcher("/note/list.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "list";
        }
        switch (action) {
            case "list":
                findAll(req, resp);
                break;
            case "add":
                addNote(req, resp);
                break;
            default:
                findAll(req, resp);
        }
    }

    private void addNote(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String title = req.getParameter("title");
        String content = req.getParameter("content");
        Note note = new Note(title, content);
        noteService.addNnote(note);
        resp.sendRedirect("/note");
    }
}
