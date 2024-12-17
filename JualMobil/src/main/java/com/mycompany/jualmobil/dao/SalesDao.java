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
import com.mycompany.jualmobil.beans.Sales;  

public class SalesDao {
    private JdbcTemplate template;    

    public SalesDao(JdbcTemplate template) {    
        this.template = template;    
    }
    
    public void tambahSales(Sales s){    
        String sql="INSERT INTO user (id, role, nama, username, password) VALUES (?, ?, ?, ?, ?)";    
        template.update(sql, s.getId(), "Sales", s.getNama(), s.getUsername(), s.getPassword());    
    }       

    public Sales getUserbyUsn(String username){    
        String sql="SELECT * FROM user WHERE username = ?";    
        return template.queryForObject(sql, new Object[]{username}, (rs, rowNum) -> {
            Sales s = null;
            if ("Sales".equals(rs.getString("role"))) {
                s=new Sales(rs.getString("id"), rs.getString("nama"), rs.getString("username"), rs.getString("password"));
            }
            return s;
        });    
    }
    
}
