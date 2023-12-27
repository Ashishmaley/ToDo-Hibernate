package com.servelet;

import java.util.Date;
import com.entity.Note;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entity.FactoryHelper;

public class UpdateServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
    public UpdateServelet() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			int nodeId = Integer.parseInt(request.getParameter("noteId").trim());
			Session s = FactoryHelper.getFactory().openSession();
			Transaction tx = s.beginTransaction();
			Note note = (Note) s.get(Note.class,nodeId);
			note.setTitle(title);
			note.setContent(content);
			note.setTime(new Date());
			tx.commit();
			s.close();
			response.sendRedirect("AllNotes.jsp");
		}
		catch(Exception e){
			System.out.println(e);
		}
	}

}
