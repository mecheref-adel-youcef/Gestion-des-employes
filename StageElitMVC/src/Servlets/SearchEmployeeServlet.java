package Servlets;

import DAO.EmployeeDao;
import Modules.Employee;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "SearchEmployeeServlet",value = "/SearchEmployee")
public class SearchEmployeeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String search = request.getParameter("search");
        ArrayList<Employee> employees = EmployeeDao.getEmployees(search);
        request.setAttribute("employees",employees);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/employees.jsp");
        dispatcher.forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
