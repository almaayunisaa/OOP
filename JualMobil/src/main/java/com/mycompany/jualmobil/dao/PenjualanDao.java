/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.jualmobil.dao;

/**
 *
 * @author Alma
 */

import com.mycompany.jualmobil.beans.MPV;
import com.mycompany.jualmobil.beans.Mobil;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;  
import com.mycompany.jualmobil.beans.Penjualan;
import com.mycompany.jualmobil.beans.SUV;
import com.mycompany.jualmobil.beans.Sedan;
import java.text.SimpleDateFormat;

public class PenjualanDao {
   private final String path = "jdbc:mysql://localhost:3306/db_mobil"; 
    private final String user = "root";
    private final  String password = "Alma2004!";

    private Connection getConnection() throws SQLException {
        return DriverManager.getConnection(path, user, password);
    }
    
    public void tambahPenjualan(Penjualan s){    
        String sql="INSERT INTO penjualan (idPenjualan, idSales, idMobil, tanggal, hargaJual) VALUES (?, ?, ?, ?, ?)";    
       try (Connection conn = getConnection();
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
        String sql="UPDATE penjualan SET idSales = ?, idMobil = ?, tanggal = ?, hargaJual = ?) VALUES (?, ?, ?, ?)";    
       try (Connection conn = getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, s.getIdSales());
            stmt.setString(2, s.getIdMobil());
            stmt.setDate(3, (Date) s.getTanggal());
            stmt.setDouble(4, s.getHargaJual());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public void hapusPenjualan(String idPenjualan){    
        String sql="DELETE FROM penjualan WHERE idPenjualan = ? ";    
        try (Connection conn = getConnection();
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
        try (Connection conn = getConnection();
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
        try (Connection conn = getConnection();
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
    
}
