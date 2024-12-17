/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.jualmobil.beans;

/**
 *
 * @author Alma
 */
public abstract class Mobil {
    private String idMobil;
    private String nama;
    private String nomorRangka;
    private String nomorMesin;
    private String platNomor;
    private double kapasitasMesin;
    protected String tipe;
    private int ketersediaan;
    private double harga;
    private String warna;
    private int odoMeter;

    public Mobil(String idMobil, String nama, String nomorRangka, String nomorMesin, String platNomor, double kapasitasMesin, int ketersediaan, double harga, String warna, int odoMeter) {
        this.idMobil = idMobil;
        this.nama = nama;
        this.nomorRangka = nomorRangka;
        this.nomorMesin = nomorMesin;
        this.platNomor = platNomor;
        this.kapasitasMesin = kapasitasMesin;
        this.ketersediaan = ketersediaan;
        this.harga = harga;
        this.warna = warna;
        this.odoMeter = odoMeter;
    }

    public abstract void setTipe(String tipe);

    public void setIdMobil(String idMobil) {
        this.idMobil = idMobil;
    }

    public void setNama(String nama) {
        this.nama = nama;
    }

    public void setNomorRangka(String nomorRangka) {
        this.nomorRangka = nomorRangka;
    }

    public void setNomorMesin(String nomorMesin) {
        this.nomorMesin = nomorMesin;
    }

    public void setPlatNomor(String platNomor) {
        this.platNomor = platNomor;
    }

    public void setKapasitasMesin(double kapasitasMesin) {
        this.kapasitasMesin = kapasitasMesin;
    }

    public void setKetersediaan(int ketersediaan) {
        this.ketersediaan = ketersediaan;
    }

    public void setHarga(double harga) {
        this.harga = harga;
    }

    public void setWarna(String warna) {
        this.warna = warna;
    }

    public void setOdoMeter(int odoMeter) {
        this.odoMeter = odoMeter;
    }

    public String getIdMobil() {
        return idMobil;
    }

    public String getNama() {
        return nama;
    }

    public String getNomorRangka() {
        return nomorRangka;
    }

    public String getNomorMesin() {
        return nomorMesin;
    }

    public String getPlatNomor() {
        return platNomor;
    }

    public double getKapasitasMesin() {
        return kapasitasMesin;
    }

    public String getTipe() {
        return tipe;
    }

    public int getKetersediaan() {
        return ketersediaan;
    }

    public double getHarga() {
        return harga;
    }

    public String getWarna() {
        return warna;
    }

    public int getOdoMeter() {
        return odoMeter;
    }
    
    
}
