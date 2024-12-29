/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.jualmobil.beans;
import java.util.ArrayList;
import java.util.List;

/**
 * Kelas yang merepresentasikan data petugas.
 * Petugas memiliki kemampuan untuk mengelola data mobil, termasuk menambah, menghapus,
 * mengubah, dan menampilkan mobil berdasarkan nama.
 * 
 * <p>Kelas ini mengimplementasikan antarmuka {@link TampilMobilable}, yang menyediakan metode
 * untuk menampilkan mobil berdasarkan nama.</p>
 * 
 * @author Kelompok Mobil
 * @version 1.0
 */
public class Petugas implements TampilMobilable {
    private String idPetugas;
    private String nama;
    private String username;
    private String password;

     /**
     * Konstruktor untuk membuat objek Petugas.
     * 
     * @param idPetugas ID petugas.
     * @param nama Nama petugas.
     * @param username Username petugas
     * @param password Password petugas.
     */
    public Petugas(String idPetugas, String nama, String username, String password) {
        this.idPetugas = idPetugas;
        this.nama = nama;
        this.username = username;
        this.password = password;
    }

    /**
     * Mengembalikan ID petugas.
     * 
     * @return ID petugas.
     */
    public String getIdPetugas() {
        return idPetugas;
    }

    /**
     * Mengembalikan nama petugas.
     * 
     * @return Nama petugas.
     */
    public String getNama() {
        return nama;
    }

     /**
     * Mengembalikan username petugas.
     * 
     * @return Username petugas.
     */
    public String getUsername() {
        return username;
    }

     /**
     * Mengembalikan password petugas.
     * 
     * @return Password petugas.
     */
    public String getPassword() {
        return password;
    }
    
    /**
     * Menambahkan mobil baru ke dalam daftar mobil.
     * 
     * @param m Objek mobil yang akan ditambahkan.
     * @param ListMobil Daftar mobil yang ada.
     */
    public void tambahMobil(Mobil m, List<Mobil> ListMobil) {
        ListMobil.add(m);
    }
    
     /**
     * Menghapus mobil dari daftar berdasarkan ID mobil.
     * 
     * @param idMobil ID mobil yang akan dihapus.
     * @param ListMobil Daftar mobil yang ada.
     */
    public void hapusMobil(String idMobil, List<Mobil> ListMobil) {
        Mobil mobilHapus=null;
        for (Mobil m : ListMobil) {
            if (m.getIdMobil().equals(idMobil)) {
                mobilHapus=m;
                break;
            }
        }
        if (mobilHapus!=null) {
            ListMobil.remove(mobilHapus);
        }
    }
    
     /**
     * Mengubah data mobil berdasarkan ID mobil.
     * 
     * @param idMobil ID mobil yang akan diubah.
     * @param m Objek mobil dengan data baru.
     * @param ListMobil Daftar mobil yang ada.
     */
    public void ubahMobil(String idMobil, Mobil m, List<Mobil> ListMobil) {
        for (Mobil m_array : ListMobil) {
            if (m_array.getIdMobil().equals(idMobil)) {
                m_array.setNama(m.getNama());
                m_array.setNomorRangka(m.getNomorRangka());
                m_array.setNomorMesin(m.getNomorMesin());
                m_array.setPlatNomor(m.getPlatNomor());
                m_array.setKapasitasMesin(m.getKapasitasMesin());
                m_array.setTipe(m.getTipe());
                m_array.setKetersediaan(m.getKetersediaan());
                break;
            }
        }
    }
    
    /**
     * Menampilkan daftar mobil berdasarkan nama.
     * 
     * @param nama Nama mobil yang akan dicari.
     * @param ListMobil Daftar mobil yang ada.
     * @return Daftar mobil yang sesuai dengan nama yang diberikan.
     */
    @Override
    public List<Mobil> tampilkanMobilBerdasarkanNama(String nama, List<Mobil> ListMobil) {
       List<Mobil> listNamaMobil = new ArrayList<>();
       for (Mobil m : ListMobil) {
            if (m.getNama().equals(nama)) {
                listNamaMobil.add(m);
            }
        }
       return listNamaMobil;
    }
}
