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
import javax.servlet.http.Part;
import java.io.*;

@MultipartConfig(location="C:\\Users\\JOSEPH\\IdeaProjects\\StageElitMVC\\web\\photo_stagetmp\\", fileSizeThreshold=1024*1024,
        maxFileSize=1024*1024*10, maxRequestSize=1024*1024*10*5)

@WebServlet(name = "FormulaireServlet",value = "/Formulaire")
public class FormulaireServlet extends HttpServlet {


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

            GestionFichier fichier = new GestionFichier();
            String nomFichier = fichier.uploadFichier(request,"photo");

            String nom = request.getParameter("nom");
            String prenom = request.getParameter("prenom");
            String gendre = request.getParameter("gendre");
            String phone = request.getParameter("phone");
            String salaire = request.getParameter("salaire");
            String wilaya = request.getParameter("wilaya");
            String description = request.getParameter("description");
            String photo = "photo_stage/" + nomFichier;
            Employee employee = new Employee(nom, prenom,gendre, phone, salaire, wilaya, photo, description);
                EmployeeDao.addEmployee(employee);
                response.sendRedirect("/getEmployees");

    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }


}
