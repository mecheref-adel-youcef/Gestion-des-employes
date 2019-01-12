package CRUD;

import java.sql.Connection;
import java.sql.PreparedStatement;


public class Insert {
    public static void main(String[] args){
        String nom = "hamidi";
        String prenom ="oussama";
        String trimestre = "1";
        String note = "17";
        String wilaya = "alger";
        String description = "sdfg";
        String photo = "hhh";
        String q = "INSERT INTO Employee(Nom,Prenom,Trimestre,Note,wilaya,Description,photo) VALUES("+"'"+nom+"'"+","+"'"+prenom+"'"+","+"'"+trimestre+"'"+","+"'"+note+"'"+','+"'"+wilaya+"'"+","+"'"+description+"'"+","+"'"+photo+"');";

        query(q);

    }


    public static void query(String q){
        DB_connection db_connection = new DB_connection();
        Connection connection = db_connection.getConnection();


        try {
            // add to db
           connection.prepareStatement(q).executeUpdate();
           // PreparedStatement preparedStatement =  connection.prepareStatement(q);
           // preparedStatement.setString(1,donnée);
            // ....

        }
        catch (Exception e){

        }


    }


}
