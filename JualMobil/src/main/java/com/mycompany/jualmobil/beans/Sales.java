package com.mycompany.jualmobil.beans;

import java.util.List;
import java.util.ArrayList;
import java.util.Date; 
 
/**
 * Kelas yang merepresentasikan data sales.
 * Sales memiliki kemampuan untuk mengelola data penjualan/catatan, termasuk menambah catatan penjualan, 
 * rekap penjualan sesuai tanggal, dan menampilkan mobil berdasarkan nama.
 * 
 * <p>Kelas ini mengimplementasikan antarmuka {@link TampilMobilable}, yang menyediakan metode
 * untuk menampilkan mobil berdasarkan nama.</p>
 * 
 * @author Kelompok Mobil
 * @version 1.0
 */

public class Sales implements TampilMobilable {
    private String idSales;
    private String nama;
    private String username;
    private String password;

    /**
     * Konstruktor untuk membuat objek Sales.
     * 
     * @param idSales ID Sales.
     * @param nama Nama sales.
     * @param username Username sales
     * @param password Password sales.
     */
    
    public Sales(String idSales, String nama, String username, String password){
        this.idSales = idSales;
        this.nama = nama;
        this.username = username;
        this.password = password;
    }

     /**
     * Mengembalikan ID sales.
     * 
     * @return ID sales.
     */
    public String getId(){
        return this.idSales;
    }

    /**
     * Mengembalikan nama sales.
     * 
     * @return Nama sales.
     */
    public String getNama(){
        return this.nama;
    }

     /**
     * Mengembalikan username sales.
     * 
     * @return Username sales.
     */
    public String getUsername(){
        return this.username;
    }

    /**
     * Mengembalikan password sales.
     * 
     * @return Password sales.
     */
    public String getPassword(){
        return this.password;
    }

     /**
     * Mencatat penjualan baru ke dalam daftar penjualan.
     * 
     * @param idMobil ID mobil yang terjual.
     * @param tanggalPenjualan Tanggal penjualan.
     * @param hargaJual Harga jual mobil.
     * @param daftarPenjualan Daftar penjualan di sistem.
     */
    public void catatPenjualan(String idMobil, Date tanggalPenjualan, double hargaJual, List<Penjualan> daftarPenjualan){
        int currentId = daftarPenjualan.size() + 1;
        Penjualan penjualan = new Penjualan(String.valueOf(currentId), idSales, idMobil, tanggalPenjualan, hargaJual);
        daftarPenjualan.add(penjualan);
    }

    /**
     * Merekap penjualan dalam rentang tanggal tertentu.
     * 
     * @param tanggalMulai Tanggal mulai untuk rekap penjualan.
     * @param tanggalAkhir Tanggal akhir untuk rekap penjualan.
     * @param daftarPenjualan Daftar penjualan yang ada.
     * @return Daftar penjualan yang terjadi dalam rentang tanggal tertentu.
     */
    public List<Penjualan> rekapPenjualan(Date tanggalMulai, Date tanggalAkhir, List<Penjualan> daftarPenjualan){
        List<Penjualan> rekap = new ArrayList<>();
        for (Penjualan penjualan : daftarPenjualan) {
            Date tanggalPenjualan = penjualan.getTanggal();
            if ((tanggalPenjualan.equals(tanggalMulai) || tanggalPenjualan.after(tanggalMulai)) && 
                (tanggalPenjualan.equals(tanggalAkhir) || tanggalPenjualan.before(tanggalAkhir))) {
                rekap.add(penjualan);
            }
        }
        return rekap;
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
                listNamaMobil.add(m); //ubah berdasarkan table
            }
        }
       return listNamaMobil;
   }
   
}