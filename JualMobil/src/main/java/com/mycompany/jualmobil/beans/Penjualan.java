package com.mycompany.jualmobil.beans;

import java.util.Date; 

/**
 * Kelas yang merepresentasikan data penjualan mobil.
 * Kelas ini menyimpan informasi tentang penjualan, termasuk ID penjualan,
 * ID sales, ID mobil, tanggal penjualan, dan harga jual.
 * 
 * @author Kelompok Mobil
 * @version 1.0
 */

public class Penjualan {
    private String idPenjualan;
    private String idSales;
    private String idMobil;
    private Date tanggal;
    private double hargaJual; 

    /**
     * Konstruktor untuk membuat objek Penjualan.
     * 
     * @param idPenjualan ID unik untuk penjualan.
     * @param idSales ID sales yang melakukan penjualan.
     * @param idMobil ID mobil yang terjual.
     * @param tanggal Tanggal penjualan.
     * @param hargaJual Harga jual mobil.
     */
    public Penjualan(String idPenjualan, String idSales, String idMobil, Date tanggal, double hargaJual){
        this.idPenjualan = idPenjualan;
        this.idSales = idSales;
        this.idMobil = idMobil;
        this.tanggal = tanggal;
        this.hargaJual = hargaJual; 
    }  

    /**
     * Mengembalikan ID sales yang melakukan penjualan.
     * 
     * @return ID sales.
     */
    public String getIdSales() {
        return idSales;
    }

    /**
     * Mengembalikan harga jual mobil.
     * 
     * @return Harga jual mobil.
     */
    public double getHargaJual() {
        return hargaJual;
    }

     /**
     * Mengembalikan ID penjualan.
     * 
     * @return ID penjualan.
     */
    public String getIdPenjualan(){
        return this.idPenjualan;
    }

    /**
     * Mengembalikan tanggal penjualan.
     * 
     * @return Tanggal penjualan.
     */
    public Date getTanggal(){
        return this.tanggal;
    }

    /**
     * Mengembalikan ID mobil yang terjual.
     * 
     * @return ID mobil.
     */
    public String getIdMobil(){
        return this.idMobil;
    }
}