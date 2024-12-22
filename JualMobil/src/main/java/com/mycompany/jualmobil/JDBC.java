/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.jualmobil;

/**
 *
 * @author Alma
 */

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import java.sql.Connection;
import javax.sql.DataSource;
import java.sql.SQLException;

public class JDBC {
    @Bean
    public DataSource data() {
        DriverManagerDataSource data = new DriverManagerDataSource();
        data.setUrl("jdbc:mysql://localhost:3306/jualmobil");
        data.setUsername("root");
        data.setPassword("Alma2004!");
        data.setDriverClassName("com.mysql.cj.jdbc.Driver");
        
        try (Connection connection = data.getConnection()) {
            System.out.println("Koneksi ke database berhasil!");
        } catch (SQLException e) {
            System.err.println("Koneksi ke database gagal: " + e.getMessage());
        }
        
        return data;
    }
    
    @Bean
    public JdbcTemplate jdbcTemplate(DataSource data) {
        return new JdbcTemplate(data);
    }
}
