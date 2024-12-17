/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.jualmobil.dao;

/**
 *
 * @author Alma
 */

import java.sql.ResultSet;    
import java.sql.SQLException;    
import java.util.List;   
import org.springframework.stereotype.Repository;
import org.springframework.jdbc.core.BeanPropertyRowMapper;    
import org.springframework.jdbc.core.JdbcTemplate;    
import org.springframework.jdbc.core.RowMapper;    
import com.mycompany.jualmobil.beans.Penjualan;

public class PenjualanDao {
    private JdbcTemplate template;    

    public PenjualanDao(JdbcTemplate template) {    
        this.template = template;    
    }
    
    public void tambahPenjualan(Penjualan s){    
        String sql="INSERT INTO penjualan (idPenjualan, idSales, idMobil, tanggal) VALUES (?, ?, ?, ?)";    
        template.update(sql, s.getIdPenjualan(), s.getIdSales(), s.getIdMobil(), s.getTanggal());    
    }   
    
    public void hapusPenjualan(String idPenjualan){    
        String sql="DELETE FROM penjualan WHERE idPenjualan = ? ";    
        template.update(sql, idPenjualan);    
    }   

    public List<Penjualan> getPenjualan(){
        String sql="SELECT * FROM penjualan";    
        return template.query(sql, (rs, rowNum) -> {
            Penjualan p = new Penjualan(rs.getString("idPenjualan"), rs.getString("idSales"), rs.getString("idMobil"), rs.getDate("tanggal"), rs.getDouble("hargaJual"));
            return p;
        });    
    }
    
    public Penjualan getPenById(String idPenjualan){    
        String sql="SELECT * FROM penjualan WHERE idPenjualan = ?";    
        return template.queryForObject(sql, new Object[]{idPenjualan}, (rs, rowNum) -> {
            Penjualan p = new Penjualan(rs.getString("idPenjualan"), rs.getString("idSales"), rs.getString("idMobil"), rs.getDate("tanggal"), rs.getDouble("hargaJual"));
            return p;
        });    
    }
    
}
