/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.jualmobil.dao;

/**
 *
 * @author Aqila Hasya Nafisah
 */

import java.sql.ResultSet;    
import java.sql.SQLException;    
import java.util.List;   
import org.springframework.stereotype.Repository;
import org.springframework.jdbc.core.BeanPropertyRowMapper;    
import org.springframework.jdbc.core.JdbcTemplate;    
import org.springframework.jdbc.core.RowMapper;    
import com.mycompany.jualmobil.beans.Mobil;  
import com.mycompany.jualmobil.beans.SUV;  
import com.mycompany.jualmobil.beans.Sedan;
import com.mycompany.jualmobil.beans.MPV;

public class MobilDao {
    private JdbcTemplate template;    

    public MobilDao(JdbcTemplate template) {    
        this.template = template;    
    }
    
    public void tambahMobil(Mobil m){    
        String sql="INSERT INTO mobil (idMobil, nama, nomorRangka, nomorMesin, platNomor, kapasitasMesin, ketersediaan, tipe, harga, warna, odoMeter) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";    
        template.update(sql, m.getIdMobil(), m.getNama(), m.getNomorRangka(), m.getNomorMesin(), m.getPlatNomor(), m.getKapasitasMesin(), m.getKetersediaan(), m.getTipe(), m.getHarga(), m.getWarna(), m.getOdoMeter());    
    }    
    
    public void ubahMobil(Mobil m){    
        String sql="UPDATE mobil set nama =?, nomorRangka= ?, nomorMesin =?, platNomor =?, kapasitasMesin=?, ketersediaan=?, tipe=?, harga=?, warna=?, odoMeter=?)";    
        template.update(sql, m.getNama(), m.getNomorRangka(), m.getNomorMesin(), m.getPlatNomor(), m.getKapasitasMesin(), m.getKetersediaan(), m.getTipe(), m.getHarga(), m.getWarna(), m.getOdoMeter());       
    }    
    
    public void hapusMobil(String idMobil){    
        String sql="DELETE FROM mobil WHERE idMobil = ?";    
        template.update(sql, idMobil);    
    }    
    
    public Mobil getMobById(String idMobil){    
        String sql="SELECT * FROM mobil WHERE idMobil = ?";    
        return template.queryForObject(sql, new Object[]{idMobil}, (rs, rowNum) -> {
            Mobil m=null;
            String tipe = rs.getString("tipe");
            if ("SUV".equals(tipe)) {
                m = new SUV(rs.getString("idMobil"), rs.getString("nama"), rs.getString("nomorRangka"), rs.getString("nomorMesin"), rs.getString("platNomor"), rs.getDouble("kapasitasMesin"), rs.getInt("ketersediaan"), rs.getDouble("harga"), rs.getString("warna"), rs.getInt("odoMeter"));
            } else if ("MPV".equals(tipe)) {
                m = new MPV(rs.getString("idMobil"), rs.getString("nama"), rs.getString("nomorRangka"), rs.getString("nomorMesin"), rs.getString("platNomor"), rs.getDouble("kapasitasMesin"), rs.getInt("ketersediaan"), rs.getDouble("harga"), rs.getString("warna"), rs.getInt("odoMeter"));
            } else if ("Sedan".equals(tipe)) {
                m = new Sedan(rs.getString("idMobil"), rs.getString("nama"), rs.getString("nomorRangka"), rs.getString("nomorMesin"), rs.getString("platNomor"), rs.getDouble("kapasitasMesin"), rs.getInt("ketersediaan"), rs.getDouble("harga"), rs.getString("warna"), rs.getInt("odoMeter"));
            }
            return m;
        });    
    }

    public Mobil getMobByNama(String nama){    
        String sql="SELECT * FROM mobil WHERE nama = ?";    
        return template.queryForObject(sql, new Object[]{nama}, (rs, rowNum) -> {
            Mobil m=null;
            String tipe = rs.getString("tipe");
            if ("SUV".equals(tipe)) {
                m = new SUV(rs.getString("idMobil"), rs.getString("nama"), rs.getString("nomorRangka"), rs.getString("nomorMesin"), rs.getString("platNomor"), rs.getDouble("kapasitasMesin"), rs.getInt("ketersediaan"), rs.getDouble("harga"), rs.getString("warna"), rs.getInt("odoMeter"));
            } else if ("MPV".equals(tipe)) {
                m = new MPV(rs.getString("idMobil"), rs.getString("nama"), rs.getString("nomorRangka"), rs.getString("nomorMesin"), rs.getString("platNomor"), rs.getDouble("kapasitasMesin"), rs.getInt("ketersediaan"), rs.getDouble("harga"), rs.getString("warna"), rs.getInt("odoMeter"));
            } else if ("Sedan".equals(tipe)) {
                m = new Sedan(rs.getString("idMobil"), rs.getString("nama"), rs.getString("nomorRangka"), rs.getString("nomorMesin"), rs.getString("platNomor"), rs.getDouble("kapasitasMesin"), rs.getInt("ketersediaan"), rs.getDouble("harga"), rs.getString("warna"), rs.getInt("odoMeter"));
            }
            return m;
        });    
    }
    
    public List<Mobil> getMobil(){
        String sql="SELECT * FROM mobil";    
        return template.query(sql, (rs, rowNum) -> {
            Mobil m = null;
            String tipe = rs.getString("tipe");
            if ("SUV".equals(tipe)) {
                m = new SUV(rs.getString("idMobil"), rs.getString("nama"), rs.getString("nomorRangka"), rs.getString("nomorMesin"), rs.getString("platNomor"), rs.getDouble("kapasitasMesin"), rs.getInt("ketersediaan"), rs.getDouble("harga"), rs.getString("warna"), rs.getInt("odoMeter"));
            } else if ("MPV".equals(tipe)) {
                m = new MPV(rs.getString("idMobil"), rs.getString("nama"), rs.getString("nomorRangka"), rs.getString("nomorMesin"), rs.getString("platNomor"), rs.getDouble("kapasitasMesin"), rs.getInt("ketersediaan"), rs.getDouble("harga"), rs.getString("warna"), rs.getInt("odoMeter"));
            } else if ("Sedan".equals(tipe)) {
                m = new Sedan(rs.getString("idMobil"), rs.getString("nama"), rs.getString("nomorRangka"), rs.getString("nomorMesin"), rs.getString("platNomor"), rs.getDouble("kapasitasMesin"), rs.getInt("ketersediaan"), rs.getDouble("harga"), rs.getString("warna"), rs.getInt("odoMeter"));
            }
            return m;
        });    
    }    
}
