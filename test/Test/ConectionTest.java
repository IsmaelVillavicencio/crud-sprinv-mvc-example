/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Test;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author villa
 */
public class ConectionTest {

    //162.241.60.127
    public static void main(String[] args) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
//here sonoo is database name, root is username and password
            try (Connection con = DriverManager.getConnection(
                    "jdbc:mysql://107.180.43.4:3306/i6181572_ci1", "emp_root", "Qwerty123")) {
                //here sonoo is database name, root is username and password
                Statement stmt = (Statement) con.createStatement();
                ResultSet rs = stmt.executeQuery("select * from emp");
                while (rs.next()) {
                    System.out.println(rs.getInt(1) + "  " + rs.getString(2) + "  " + rs.getString(3));
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e);
        }
    }
}
