/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.jualmobil.dao;

/**
 *
 * @author Aqila Hasya Nafisah
 */

import java.sql.*;
import java.util.ArrayList;
import java.util.List;    
import com.mycompany.jualmobil.beans.Mobil;  
import com.mycompany.jualmobil.beans.SUV;  
import com.mycompany.jualmobil.beans.Sedan;
import com.mycompany.jualmobil.beans.MPV;

public class MobilDao {
    private Connection conn;
    

    public MobilDao() throws SQLException {
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

    
    public void tambahMobil(Mobil m) {   
         if (m == null) {
            throw new IllegalArgumentException("Mobil tidak boleh null");
        }
        String sql="INSERT INTO mobil (idMobil, nama, nomorRangka, nomorMesin, platNomor, kapasitasMesin, ketersediaan, tipe, harga, warna, odoMeter) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";    
        try (
            PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, m.getIdMobil());
            stmt.setString(2, m.getNama());
            stmt.setString(3, m.getNomorRangka());
            stmt.setString(4, m.getNomorMesin());
            stmt.setString(5, m.getPlatNomor());
            stmt.setDouble(6, m.getKapasitasMesin());
            stmt.setInt(7, m.getKetersediaan());
            stmt.setString(8, m.getTipe());
            stmt.setDouble(9, m.getHarga());
            stmt.setString(10, m.getWarna());
            stmt.setInt(11, m.getOdoMeter());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }    
    
    public void ubahMobil(Mobil m){    
        String sql="UPDATE mobil set nama =?, nomorRangka= ?, nomorMesin =?, platNomor =?, kapasitasMesin=?, ketersediaan=?, tipe=?, harga=?, warna=?, odoMeter=? WHERE idMobil=?)";    
        try (
            PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, m.getNama());
            stmt.setString(2, m.getNomorRangka());
            stmt.setString(3, m.getNomorMesin());
            stmt.setString(4, m.getPlatNomor());
            stmt.setDouble(5, m.getKapasitasMesin());
            stmt.setInt(6, m.getKetersediaan());
            stmt.setString(7, m.getTipe());
            stmt.setDouble(8, m.getHarga());
            stmt.setString(9, m.getWarna());
            stmt.setInt(10, m.getOdoMeter());
            stmt.setString(11, m.getIdMobil());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public void hapusMobil(String idMobil){    
        String sql="DELETE FROM mobil WHERE idMobil = ?";    
        try (
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, idMobil);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }    
    
    public Mobil getMobById(String idMobil){    
        String sql="SELECT * FROM mobil WHERE idMobil = ?";    
        try (
            PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, idMobil);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                Mobil m=null;
                String tipe = rs.getString("tipe");
                if ("SUV".equals(tipe)) {
                    m = new SUV(rs.getString("idMobil"), rs.getString("nama"), rs.getString("nomorRangka"), rs.getString("nomorMesin"), rs.getString("platNomor"), rs.getDouble("kapasitasMesin"), rs.getInt("ketersediaan"), rs.getDouble("harga"), rs.getString("warna"), rs.getInt("odoMeter"));
                } else if ("MPV".equals(tipe)) {
                    m = new MPV(rs.getString("idMobil"), rs.getString("nama"), rs.getString("nomorRangka"), rs.getString("nomorMesin"), rs.getString("platNomor"), rs.getDouble("kapasitasMesin"), rs.getInt("ketersediaan"), rs.getDouble("harga"), rs.getString("warna"), rs.getInt("odoMeter"));
                } else if ("Sedan".equals(tipe)) {
                    m = new Sedan(rs.getString("idMobil"), rs.getString("nama"), rs.getString("nomorRangka"), rs.getString("nomorMesin"), rs.getString("platNomor"), rs.getDouble("kapasitasMesin"), rs.getInt("ketersediaan"), rs.getDouble("harga"), rs.getString("warna"), rs.getInt("odoMeter"));
                }
                m.setTipe(rs.getString("tipe"));
                return m;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }    
        return null;
    }

    public Mobil getMobByNama(String nama){    
        String sql="SELECT * FROM mobil WHERE nama = ?";    
        try (
            PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, nama);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                Mobil m=null;
                String tipe = rs.getString("tipe");
                if ("SUV".equals(tipe)) {
                    m = new SUV(rs.getString("idMobil"), rs.getString("nama"), rs.getString("nomorRangka"), rs.getString("nomorMesin"), rs.getString("platNomor"), rs.getDouble("kapasitasMesin"), rs.getInt("ketersediaan"), rs.getDouble("harga"), rs.getString("warna"), rs.getInt("odoMeter"));
                } else if ("MPV".equals(tipe)) {
                    m = new MPV(rs.getString("idMobil"), rs.getString("nama"), rs.getString("nomorRangka"), rs.getString("nomorMesin"), rs.getString("platNomor"), rs.getDouble("kapasitasMesin"), rs.getInt("ketersediaan"), rs.getDouble("harga"), rs.getString("warna"), rs.getInt("odoMeter"));
                } else if ("Sedan".equals(tipe)) {
                    m = new Sedan(rs.getString("idMobil"), rs.getString("nama"), rs.getString("nomorRangka"), rs.getString("nomorMesin"), rs.getString("platNomor"), rs.getDouble("kapasitasMesin"), rs.getInt("ketersediaan"), rs.getDouble("harga"), rs.getString("warna"), rs.getInt("odoMeter"));
                }
                m.setTipe(rs.getString("tipe"));
                return m;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }    
        return null;    
    }
    
    public List<Mobil> getMobil() throws SQLException {
        List<Mobil> daftarMobil = new ArrayList<>();
        String sql="SELECT * FROM mobil";   
        PreparedStatement ps = conn.prepareStatement(sql);
        ResultSet rs = ps.executeQuery(sql);
        while (rs.next()) {
                Mobil m=null;
                String tipe = rs.getString("tipe");
                if ("SUV".equals(tipe)) {
                    m = new SUV(rs.getString("idMobil"), rs.getString("nama"), rs.getString("nomorRangka"), rs.getString("nomorMesin"), rs.getString("platNomor"), rs.getDouble("kapasitasMesin"), rs.getInt("ketersediaan"), rs.getDouble("harga"), rs.getString("warna"), rs.getInt("odoMeter"));
                } else if ("MPV".equals(tipe)) {
                    m = new MPV(rs.getString("idMobil"), rs.getString("nama"), rs.getString("nomorRangka"), rs.getString("nomorMesin"), rs.getString("platNomor"), rs.getDouble("kapasitasMesin"), rs.getInt("ketersediaan"), rs.getDouble("harga"), rs.getString("warna"), rs.getInt("odoMeter"));
                } else if ("Sedan".equals(tipe)) {
                    m = new Sedan(rs.getString("idMobil"), rs.getString("nama"), rs.getString("nomorRangka"), rs.getString("nomorMesin"), rs.getString("platNomor"), rs.getDouble("kapasitasMesin"), rs.getInt("ketersediaan"), rs.getDouble("harga"), rs.getString("warna"), rs.getInt("odoMeter"));
                }
                System.out.println(m.getNama());
                m.setTipe(rs.getString("tipe"));
                daftarMobil.add(m);
         } 
        return daftarMobil;    
    }    
}
