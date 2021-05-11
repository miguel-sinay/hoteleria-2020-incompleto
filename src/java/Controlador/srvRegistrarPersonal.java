package Controlador;

import Modelo.personal;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class srvRegistrarPersonal extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String nombres,apellidos,dpi,nacimiento="Vacio",direccion,profesion,telefono,email,estatus;
            double salario;
            int idPuesto, resp=0;
            RequestDispatcher rd=null;
            if(request.getParameter("btnRegistrarPersonal")!=null)
            {
                nombres = request.getParameter("txtNombres");
                apellidos = request.getParameter("txtApellidos");
                dpi = request.getParameter("txtDPI");
                nacimiento = request.getParameter("txtFechaNacimiento");
                direccion = request.getParameter("txtDireccion");
                profesion = request.getParameter("txtProfesion");
                telefono = request.getParameter("txtTelefono");
                email = request.getParameter("txtEmail");
                salario = Double.parseDouble(request.getParameter("txtSalario"));
                idPuesto = Integer.parseInt(request.getParameter("txtPuesto"));
                estatus = request.getParameter("txtEstatus");
                personal p = new personal();
                resp=p.insertarPersonal(nombres, apellidos, dpi, nacimiento, direccion, profesion, telefono, email, salario, idPuesto, estatus);
                
                request.setAttribute("operacion", resp);
                rd=request.getRequestDispatcher("registrarPersonal.jsp");
            }
            rd.forward(request, response);
            /* TODO output your page here. You may use following sample code.*/
            /*out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet srvRegistrarPersonal</title>"); 
            out.println("<meta charset='UTF-8'>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet srvRegistrarPersonal at " + request.getContextPath() + "</h1>");
            out.println("<p>Mostrando dato: " + request.getParameter("txtNombres") + "</p>");
            out.println("<p>Mostrando dato: " + resp + "</p>");
            out.println("<p>Mostrando dato: " + nacimiento + "</p><hr>");
            out.println("<p>Mostrando dato: " + request.getParameter("txtApellidos") + "</p>");
            out.println("<p>Mostrando dato: " + request.getParameter("txtDPI") + "</p>");
            out.println("<p>Mostrando dato: " + request.getParameter("txtDireccion") + "</p>");
            out.println("<p>Mostrando dato: " + request.getParameter("txtProfesion") + "</p>");
            out.println("<p>Mostrando dato: " + request.getParameter("txtTelefono") + "</p>");
            out.println("<p>Mostrando dato: " + request.getParameter("txtEmail") + "</p>");
            out.println("<p>Mostrando dato: " + request.getParameter("txtSalario") + "</p>");
            out.println("<p>Mostrando dato: " + request.getParameter("txtPuesto") + "</p>");
            out.println("<p>Mostrando dato: " + request.getParameter("txtEstatus") + " " + "</p>");
            out.println("</body>");
            out.println("</html>");*/
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
