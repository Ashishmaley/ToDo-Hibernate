package com.servelet;


import java.io.IOException;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entity.FactoryHelper;
import com.entity.Note;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


public class DeleteServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public DeleteServelet() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			int noteId = Integer.parseInt(request.getParameter("note_id").trim());
			Session s = FactoryHelper.getFactory().openSession();
			Transaction tx = s.beginTransaction();
			Note note = (Note) s.get(Note.class,noteId);
			s.delete(note);
			tx.commit();
			s.close();
			response.sendRedirect("AllNotes.jsp");
			}catch(Exception e){
				System.out.println(e);
			}
		}

}
