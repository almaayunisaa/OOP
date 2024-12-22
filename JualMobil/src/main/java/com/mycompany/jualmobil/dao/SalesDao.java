/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.jualmobil.dao;

/**
 *
 * @author Alma
 */

import java.sql.*; 
import com.mycompany.jualmobil.beans.Sales;  

public class SalesDao {
    private final String path = "jdbc:mysql://localhost:3306/db_mobil"; 
    private final String user = "root";
    private final  String password = "Alma2004!";

    private Connection getConnection() throws SQLException {
        return DriverManager.getConnection(path, user, password);
    }
    
    public void tambahPetugas(Sales s){    
        String sql="INSERT INTO user (id, role, nama, username, password) VALUES (?, ?, ?, ?, ?)";    
        try (Connection conn = getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, s.getId());
            stmt.setString(2, "Sales");
            stmt.setString(3, s.getNama());
            stmt.setString(4, s.getUsername());
            stmt.setString(5, s.getPassword());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }   
    }       

    public Sales getUserbyUsn(String username){    
        String sql="SELECT * FROM user WHERE username = ?";    
        try (Connection conn = getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, username);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return new Sales(rs.getString("idPetugas"), rs.getString("nama"), rs.getString("username"), rs.getString("password"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }    
        return null;    
    }
    
}
