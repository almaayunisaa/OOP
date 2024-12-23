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
import java.util.ArrayList;
import java.util.List; 
import com.mycompany.jualmobil.beans.Penjualan;

public class PenjualanDao {
    private Connection conn;
    

    public PenjualanDao() throws SQLException {
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
    
    public void tambahPenjualan(Penjualan s){ 
       if (s == null) {
          throw new IllegalArgumentException("Penjualan tidak boleh null");
       } 
       String sql="INSERT INTO penjualan (idPenjualan, idSales, idMobil, tanggal, hargaJual) VALUES (?, ?, ?, ?, ?)";    
       try (
            PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, s.getIdPenjualan());
            stmt.setString(2, s.getIdSales());
            stmt.setString(3, s.getIdMobil());
            stmt.setDate(4, (Date) s.getTanggal());
            stmt.setDouble(5, s.getHargaJual());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public void ubahPenjualan(Penjualan s){    
        String sql="UPDATE penjualan SET idSales = ?, idMobil = ?, tanggal = ?, hargaJual = ? WHERE idPenjualan = ?";    
       try (
            PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, s.getIdSales());
            stmt.setString(2, s.getIdMobil());
            stmt.setDate(3, (Date) s.getTanggal());
            stmt.setDouble(4, s.getHargaJual());
            stmt.setString(5, s.getIdPenjualan());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public void hapusPenjualan(String idPenjualan){    
        String sql="DELETE FROM penjualan WHERE idPenjualan = ? ";    
        try (
            PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, idPenjualan);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }  
    }   

    public List<Penjualan> getPenjualan(){
        List<Penjualan> daftarPenjualan = new ArrayList<>();
        String sql="SELECT * FROM penjualan";    
        try (
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql)){
            while (rs.next()) {
                Penjualan p = new Penjualan(rs.getString("idPenjualan"), rs.getString("idSales"), rs.getString("idMobil"), rs.getDate("tanggal"), rs.getDouble("hargaJual"));
                daftarPenjualan.add(p);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }    
        return daftarPenjualan;   
    }
    
    public Penjualan getPenById(String idPenjualan){    
        String sql="SELECT * FROM penjualan WHERE idPenjualan = ?";    
        try (
            PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, idPenjualan);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return new Penjualan(rs.getString("idPenjualan"), rs.getString("idSales"), rs.getString("idMobil"), rs.getDate("tanggal"), rs.getDouble("hargaJual"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }    
        return null;   
    }
    
    public List<Penjualan> getPenjualanbyTanggal(java.sql.Date tanggalMulai, java.sql.Date tanggalAkhir){
        List<Penjualan> daftarPenjualan = new ArrayList<>();
        String sql="SELECT * FROM penjualan WHERE tanggal BETWEEN ? AND ?";    
        try (
            PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setDate(1, (Date) tanggalMulai);
            stmt.setDate(2, (Date) tanggalAkhir);
            ResultSet rs = stmt.executeQuery();
            
            while (rs.next()) {
                Penjualan p = new Penjualan(rs.getString("idPenjualan"), rs.getString("idSales"), rs.getString("idMobil"), rs.getDate("tanggal"), rs.getDouble("hargaJual"));
                daftarPenjualan.add(p);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }    
        return daftarPenjualan;   
    }
    
}
