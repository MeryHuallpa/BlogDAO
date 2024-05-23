
package com.emergentes.controlador;

import com.emergentes.dao.PostDAO;
import com.emergentes.dao.PostDAOimpl;
import com.emergentes.modelo.Post;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "Inicio", urlPatterns = {"/Inicio"})
public class Inicio extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         try {
            PostDAO dao = new PostDAOimpl();
            int id;
            Post pos = new Post();
            String action = (request.getParameter("action") != null) ? request.getParameter("action") : "view";

            switch (action) {
                case "add":
                    request.setAttribute("pos", pos);
                    request.getRequestDispatcher("frmpost.jsp").forward(request, response);
                    break;
                case "edit":
                    id = Integer.parseInt(request.getParameter("id"));
                    pos = dao.getById(id);
                    request.setAttribute("pos", pos);
                    request.getRequestDispatcher("frmpost.jsp").forward(request, response);
                    break;
                case "delete":
                    id = Integer.parseInt(request.getParameter("id"));
                    dao.delete(id);
                    response.sendRedirect(request.getContextPath() + "/Inicio");
                    break;
                case "view":
                default:
                    List<Post> lista = dao.getAll();
                    request.setAttribute("poss", lista);
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                    break;
            }

        } catch (Exception ex) {
            System.out.println("Error: " + ex.getMessage());
        }
      
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    int id = Integer.parseInt(request.getParameter("id"));
        String fecha = request.getParameter("fecha");
        String titulo = request.getParameter("titulo");
        String contenido = request.getParameter("contenido");

        Post pos = new Post();
        pos.setId(id);
        pos.setFecha(fecha);
        pos.setTitulo(titulo);
        pos.setContenido(contenido);

        try {
            PostDAO dao = new PostDAOimpl();
            if (id == 0) {
                dao.insert(pos);
            } else {
                dao.update(pos);
            }
            response.sendRedirect(request.getContextPath() + "/Inicio");
        } catch (Exception ex) {
            System.out.println("Error: " + ex.getMessage());
        }
    }

}
