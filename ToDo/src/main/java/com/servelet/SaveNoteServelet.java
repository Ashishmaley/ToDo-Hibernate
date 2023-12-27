package com.servelet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.w3c.dom.ls.LSOutput;

import com.entity.FactoryHelper;
import com.entity.Note;

/**
 * Servlet implementation class SaveNoteServelet
 */
public class SaveNoteServelet extends HttpServlet {       
    public SaveNoteServelet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			Note note = new Note(title,content,new Date());
			System.out.println(note);
			Session s = FactoryHelper.getFactory().openSession();
			Transaction tx = s.beginTransaction() ;
			s.save(note);
			tx.commit();
			s.close();
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			out.println("<h1 style = 'text-align : center;'>New Node is Added</h1>");
			out.println("<h1 style = 'text-align : center;'><a href = 'AllNotes.jsp'> All Notes </a></h1>");
		}
		catch(Exception e){
			System.out.println(e);
		}
	}

}
