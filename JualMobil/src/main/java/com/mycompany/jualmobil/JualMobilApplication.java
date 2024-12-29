/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.jualmobil;

/**
 * Aplikasi utama untuk sistem penjualan mobil.
 * Kelas ini bertindak sebagai entry point untuk aplikasi Spring Boot.
 * 
 * @author Kelompok Mobil
 * @version 1.0
 */
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/** **/
@SpringBootApplication
public class JualMobilApplication {
    
    /**
     * Metode utama untuk menjalankan aplikasi.
     * Metode ini akan memulai aplikasi Spring Boot
     * @param args argumen baris perintah yang diteruskan saat menjalankan aplikasi.
     */
    
    public static void main(String[] args) {
        SpringApplication.run(JualMobilApplication.class, args);
    }
}
