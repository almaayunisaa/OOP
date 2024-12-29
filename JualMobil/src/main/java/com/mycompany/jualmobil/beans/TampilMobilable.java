package com.mycompany.jualmobil.beans;
import java.util.List;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */

/**
 * Interface yang menyediakan metode untuk menampilkan daftar mobil berdasarkan nama.
 * Interface ini dapat diimplementasikan oleh kelas yang ingin menyediakan
 * fitur pencarian mobil berdasarkan nama.
 * 
 * <p>Kelas yang mengimplementasikan antarmuka ini harus mengimplementasikan
 * metode {@link #tampilkanMobilBerdasarkanNama(String, List)}.</p>
 * 
 * @author Kelompok Mobil
 * @version 1.0
 */
public interface TampilMobilable {
   
    /**
     * Method abstract untuk menampilkan daftar mobil berdasarkan nama.
     * 
     * @param nama Nama mobil yang akan dicari.
     * @param ListMobil Daftar mobil yang ada.
     * @return Daftar mobil yang sesuai dengan nama yang diberikan.
     */
   abstract public List<Mobil> tampilkanMobilBerdasarkanNama(String nama, List<Mobil> ListMobil);
}
