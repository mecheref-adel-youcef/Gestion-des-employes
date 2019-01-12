package CRUD;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class Select {
    public static void main(String[] args){

        ResultSet resultSet = query("select * from employee;");
        if(resultSet!=null)
            System.out.println("not null");
        else
            System.out.println("null");
        try {
            while (resultSet.next()){
                System.out.println(resultSet.getString("nom"));
            }
        }
        catch (Exception e){

        }




    }


    public static ResultSet query(String q){
        DB_connection db_connection = new DB_connection();
        Connection connection = db_connection.getConnection();
        Statement statement = null;
        ResultSet resultSet = null;
        try {
            //read from db

          statement = connection.createStatement();
          resultSet  = statement.executeQuery(q);
            return  resultSet;
        }
        catch (Exception e){
            return  resultSet;

        }


    }
}
