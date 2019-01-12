package DAO;

import CRUD.Delete;
import CRUD.Insert;
import CRUD.Select;
import CRUD.Update;
import Modules.Employee;

import java.sql.ResultSet;
import java.util.ArrayList;

public class EmployeeDao {
    public static void main(String[] args){
     /*  ArrayList<Employee> employees = getEmployees("60000");
       for(Employee e : employees){
           System.out.println(e.getNom());
       }*/

    }

    public static void updateEmployee(Employee employee){
        String q = "UPDATE Employee set nom="+"'"+employee.getNom()+"'"+" , prenom= "+"'"+employee.getPrenom()+"'"+" , gendre= "+"'"+employee.getGendre()+"'"+", phone="+"'"+employee.getPhone()+"'"+" , salaire= "+"'"+employee.getSalaire()+"'"+" , wilaya="+"'"+employee.getWilaya()+"'"+" , description="+"'"+employee.getDescription()+"'"+" , photo="+"'"+employee.getPhoto()+"'"+" WHERE idemp="+employee.getIdemp();
        Update.query(q);
    }

    public static void deleteEmployee(int id){
        Delete.query("DELETE FROM Employee WHERE idemp="+id);

    }

    public static Employee getEmployee(int id){
        Employee employee = new Employee();
        ResultSet resultSet = Select.query("SELECT * FROM Employee where idemp="+id);
        try {
           // System.out.println(resultSet);
            if (resultSet.next()){
                employee.setIdemp(resultSet.getString("idemp"));
                employee.setNom(resultSet.getString("nom"));
                employee.setPrenom(resultSet.getString("prenom"));
                employee.setGendre(resultSet.getString("gendre"));
                employee.setDatedemploi(resultSet.getString("datedemploi"));
                employee.setPhone(resultSet.getString("phone"));
                employee.setSalaire(resultSet.getString("salaire"));
                employee.setWilaya(resultSet.getString("wilaya"));
                employee.setPhoto(resultSet.getString("photo"));
                employee.setDescription(resultSet.getString("description"));
            }
        }
        catch (Exception e){
            System.out.println(e);
        }
        return employee;
    }

    public static void addEmployee(Employee employee){
        String q = "INSERT INTO Employee(Nom,Prenom,gendre,phone,Salaire,wilaya,Description,photo) VALUES("+"'"+employee.getNom()+"'"+","+"'"+employee.getPrenom()+"'"+","+"'"+employee.getGendre()+"'"+","+"'"+employee.getPhone()+"'"+","+"'"+employee.getSalaire()+"'"+','+"'"+employee.getWilaya()+"'"+","+"'"+employee.getDescription()+"'"+","+"'"+employee.getPhoto()+"');";
        Insert.query(q);
    }

    public static ArrayList<Employee> getEmployees(){
        ResultSet resultSet = Select.query("SELECT * FROM Employee ");
        ArrayList<Employee> employees = forEmployees(resultSet);
        return employees;
    }

    public static ArrayList<Employee> getEmployees(String search){
        ResultSet resultSet = Select.query("SELECT * FROM employee where nom like \"%"+search+"%\" or \n" +
                "\tprenom like \"%"+search+"%\" or gendre like \"%"+search+"%\" or \n" +
                "\tdatedemploi like \"%"+search+"%\" or phone like \"%"+search+"%\" or \n" +
                "\tsalaire like \"%"+search+"%\" or wilaya like \"%"+search+"%\" or \n" +
                "\tdescription like \"%"+search+"%\"  ;");
        ArrayList<Employee> employees = forEmployees(resultSet);
        return employees;

    }

    public static ArrayList<Employee> forEmployees(ResultSet resultSet){
        ArrayList<Employee> employees = new ArrayList<>();
        Employee employee ;
        try {
            // System.out.println(resultSet);
            while (resultSet.next()){
                employee = new Employee();
                employee.setIdemp(resultSet.getString("idemp"));
                employee.setNom(resultSet.getString("nom"));
                employee.setPrenom(resultSet.getString("prenom"));
                employee.setGendre(resultSet.getString("gendre"));
                employee.setDatedemploi(resultSet.getString("datedemploi"));
                employee.setPhone(resultSet.getString("phone"));
                employee.setSalaire(resultSet.getString("salaire"));
                employee.setWilaya(resultSet.getString("wilaya"));
                employee.setPhoto(resultSet.getString("photo"));
                employee.setDescription(resultSet.getString("description"));
                employees.add(employee);
            }
        }
        catch (Exception e){
            System.out.println(e);
        }
        return employees;


    }


}
