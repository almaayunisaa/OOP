/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.jualmobil.dao;

import java.sql.*; 
import com.mycompany.jualmobil.beans.Sales;  

/**
 * Kelas DAO untuk mengelola operasi database terkait entitas Sales.
 * 
 * <p>Kelas ini berfungsi untuk melakukan koneksi ke database dan menjalankan operasi
 * seperti mengambil data pengguna berdasarkan username.</p>
 * 
 * <p>Kelas ini memanfaatkan JDBC untuk memanipulasi dengan database MySQL.</p>
 * 
 * @author Kelompok Mobil
 * @version 1.0
 */
public class SalesDao {
    private Connection conn;

    /**
     * Konstruktor untuk menginisialisasi koneksi database.
     * 
     * @throws SQLException jika terjadi kesalahan dalam memuat driver JDBC atau koneksi ke database.
     */
    public SalesDao() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); 
        } catch (ClassNotFoundException e) {
            throw new SQLException("Driver JDBC tidak ditemukan.", e);
        }

        String PATH = "jdbc:mysql://localhost:3306/db_mobil?useSSL=false&allowPublicKeyRetrieval=true"; 
        String USER = "root";
        String PASSWORD = "Alma2004!";
        conn = DriverManager.getConnection(PATH, USER, PASSWORD);
    }

    /**
     * Mengambil data pengguna dari database berdasarkan username.
     * 
     * <p>Metode ini memeriksa apakah pengguna dengan username memiliki peran sebagai Sales.
     * Jika iya, maka data pengguna tersebut dikembalikan dalam bentuk objek {@link Sales}.
     * Jika tidak, atau jika username tidak ditemukan, metode ini mengembalikan null.</p>
     * 
     * @param username Username yang akan dicari.
     * @return Objek {@link Sales} jika pengguna ditemukan dan memiliki peran "Sales", atau null jika tidak ditemukan.
     */
    public Sales getUserbyUsn(String username){    
        String sql="SELECT * FROM user WHERE username = ?";    
        try (
            PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, username);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                if ("Sales".equals(rs.getString("role"))) {
                    return new Sales(rs.getString("id"), rs.getString("nama"), rs.getString("username"), rs.getString("password"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }    
        return null;    
    }
    
}
