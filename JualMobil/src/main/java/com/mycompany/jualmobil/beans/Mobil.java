/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.jualmobil.beans;

/**
 * Kelas abstrak yang merepresentasikan atribut dan method dari sebuah mobil.
 * Kelas ini digunakan sebagai dasar untuk berbagai jenis mobil yaitu MPV, Sedan, dan SUV.
 * 
 * <p>Kelas ini menyediakan atribut umum seperti ID mobil, nama, nomor rangka, nomor mesin,
 * kapasitas mesin, tipe, ketersediaan, harga, warna, dan odometer, serta metode getter dan setter
 * untuk atribut tersebut.</p>
 * 
 * @author Kelompok Mobil
 * @version 1.0
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

    /**
     * Konstruktor untuk membuat objek Mobil dengan semua atribut yang diperlukan.
     * 
     * @param idMobil ID unik untuk mobil.
     * @param nama Nama mobil.
     * @param nomorRangka Nomor rangka mobil.
     * @param nomorMesin Nomor mesin mobil.
     * @param platNomor Plat nomor mobil.
     * @param kapasitasMesin Kapasitas mesin mobil.
     * @param ketersediaan Jumlah unit mobil yang tersedia.
     * @param harga Harga mobil.
     * @param warna Warna mobil.
     * @param odoMeter Odometer (jarak tempuh) mobil.
     */
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
    
     /**
     * Metode abstrak untuk menyetel tipe mobil.
     * 
     * <p>Kelas turunan harus mengimplementasikan metode ini untuk menentukan tipe mobil
     * yang spesifik seperti "MPV", "Sedan", atau "SUV".</p>
     * 
     * @param tipe Tipe mobil.
     */
    public abstract void setTipe(String tipe);

    /**
     * Mengatur ID mobil.
     * @param idMobil ID mobil.
     */
    public void setIdMobil(String idMobil) {
        this.idMobil = idMobil;
    }

    /**
     * Mengatur nama mobil.
     * @param nama Nama mobil.
     */
    public void setNama(String nama) {
        this.nama = nama;
    }

    /**
     * Mengatur nomor rangka mobil.
     * @param nomorRangka Nomor rangka mobil.
     */
    public void setNomorRangka(String nomorRangka) {
        this.nomorRangka = nomorRangka;
    }

    /**
     * Mengatur nomor mesin mobil.
     * @param nomorMesin Nomor mesin mobil.
     */
    public void setNomorMesin(String nomorMesin) {
        this.nomorMesin = nomorMesin;
    }

    /**
     * Mengatur plat nomor mobil.
     * @param platNomor Plat nomor mobil.
     */
    public void setPlatNomor(String platNomor) {
        this.platNomor = platNomor;
    }

    /**
     * Mengatur kapasitas mesin mobil.
     * @param kapasitasMesin Kapasitas mesin mobil.
     */
    public void setKapasitasMesin(double kapasitasMesin) {
        this.kapasitasMesin = kapasitasMesin;
    }

    /**
     * Mengatur jumlah ketersediaan mobil.
     * @param ketersediaan Jumlah ketersediaan mobil.
     */
    public void setKetersediaan(int ketersediaan) {
        this.ketersediaan = ketersediaan;
    }

    /**
     * Mengatur harga mobil.
     * @param harga Harga mobil.
     */
    public void setHarga(double harga) {
        this.harga = harga;
    }

    /**
     * Mengatur warna mobil.
     * @param warna Warna mobil.
     */
    public void setWarna(String warna) {
        this.warna = warna;
    }

    /**
     * Mengatur odometer (jarak tempuh) mobil.
     * @param odoMeter Odometer mobil.
     */
    public void setOdoMeter(int odoMeter) {
        this.odoMeter = odoMeter;
    }

    /**
     * Mengembalikan ID mobil.
     * @return ID mobil.
     */
    public String getIdMobil() {
        return idMobil;
    }

    /**
     * Mengembalikan nama mobil.
     * @return Nama mobil.
     */
    public String getNama() {
        return nama;
    }

    /**
     * Mengembalikan nomor rangka mobil.
     * @return Nomor rangka mobil.
     */
    public String getNomorRangka() {
        return nomorRangka;
    }

    /**
     * Mengembalikan nomor mesin mobil.
     * @return Nomor mesin mobil.
     */
    public String getNomorMesin() {
        return nomorMesin;
    }
    
     /**
     * Mengembalikan plat nomor mobil.
     * @return Plat nomor mobil.
     */
    public String getPlatNomor() {
        return platNomor;
    }

    /**
     * Mengembalikan kapasitas mesin mobil.
     * @return Kapasitas mesin mobil.
     */
    public double getKapasitasMesin() {
        return kapasitasMesin;
    }

    /**
     * Mengembalikan tipe mobil.
     * @return Tipe mobil.
     */
    public String getTipe() {
        return tipe;
    }

    /**
     * Mengembalikan jumlah ketersediaan mobil.
     * @return Jumlah ketersediaan mobil.
     */
    public int getKetersediaan() {
        return ketersediaan;
    }

    /**
     * Mengembalikan harga mobil.
     * @return Harga mobil.
     */
    public double getHarga() {
        return harga;
    }

    /**
     * Mengembalikan warna mobil.
     * @return Warna mobil.
     */
    public String getWarna() {
        return warna;
    }

    /**
     * Mengembalikan odometer (jarak tempuh) mobil.
     * @return Odometer mobil.
     */
    public int getOdoMeter() {
        return odoMeter;
    }
    
    
}
