package com.mycompany.jualmobil.beans;

import java.util.Date; 

public class Penjualan {
    private String idPenjualan;
    private String idSales;
    private String idMobil;
    private Date tanggal;
    private double hargaJual; //new addition :D 

    public Penjualan(String idPenjualan, String idSales, String idMobil, Date tanggal, double hargaJual){
        this.idPenjualan = idPenjualan;
        this.idSales = idSales;
        this.idMobil = idMobil;
        this.tanggal = tanggal;
        this.hargaJual = hargaJual; //new addition :D 
    }

    public String getIdSales() {
        return idSales;
    }

    public double getHargaJual() {
        return hargaJual;
    }

    public String getIdPenjualan(){
        return this.idPenjualan;
    }

    public Date getTanggal(){
        return this.tanggal;
    }

    public String getIdMobil(){
        return this.idMobil;
    }
}