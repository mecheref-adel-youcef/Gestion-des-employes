package Servlets;

import DAO.EmployeeDao;
import Modules.Employee;
import Modules.GestionFichier;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.PageContext;
import java.io.IOException;
@MultipartConfig(location="C:\\Users\\JOSEPH\\IdeaProjects\\StageElitMVC\\web\\photo_stagetmp\\", fileSizeThreshold=1024*1024,
        maxFileSize=1024*1024*10, maxRequestSize=1024*1024*10*5)


@WebServlet(name = "ModifierEmployeeServlet",value = "/modifierEmployee")
public class ModifierEmployeeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        GestionFichier fichier = new GestionFichier();
        String nomFichier = fichier.uploadFichier(request,"Mphoto");

        String nom = request.getParameter("Mnom");
        String prenom = request.getParameter("Mprenom");
        String gendre = request.getParameter("Mgendre");
        String phone = request.getParameter("Mphone");
        String salaire = request.getParameter("Msalaire");
        String wilaya = request.getParameter("Mwilaya");
        String description = request.getParameter("Mdescription");
        String photo = "photo_stage/"+nomFichier;
        Employee employee = new Employee(nom,prenom,gendre,phone,salaire,wilaya,photo,description);
        employee.setIdemp(""+request.getParameter("id"));
            EmployeeDao.updateEmployee(employee);
            response.sendRedirect("/getEmployees");


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
