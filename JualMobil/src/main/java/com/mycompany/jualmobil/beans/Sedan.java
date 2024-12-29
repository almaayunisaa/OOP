/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.jualmobil.beans;

/**
 * Kelas untuk merepresentasikan tipe mobil
 * Sedan adalah turunan dari kelas {@link Mobil}
 * 
 * @author Kelompok Mobil
 * @version 1.0
 */
public class Sedan extends Mobil {

    /**
     * Konstruktor untuk membuat objek Sedan dengan semua atribut yang diperlukan.
     * 
     * @param idMobil ID unik untuk mobil.
     * @param nama Nama mobil.
     * @param nomorRangka Nomor rangka mobil.
     * @param nomorMesin Nomor mesin mobil.
     * @param platNomor Plat nomor mobil.
     * @param kapasitasMesin Kapasitas mesin mobil
     * @param ketersediaan Jumlah unit mobil yang tersedia.
     * @param harga Harga mobil.
     * @param warna Warna mobil.
     * @param odoMeter Odometer/jarak tempuh mobil.
     */
    public Sedan(String idMobil, String nama, String nomorRangka, String nomorMesin, String platNomor, double kapasitasMesin, int ketersediaan, double harga, String warna, int odoMeter) {
        super(idMobil, nama, nomorRangka, nomorMesin, platNomor, kapasitasMesin, ketersediaan, harga, warna, odoMeter);
    }
    
    /**
     * Menyetel tipe mobil ke dalam atribut tipe.
     * 
     * @param tipe Tipe mobil Sedan.
     */
    @Override
    public void setTipe(String tipe) {
        super.tipe=tipe;
    }
    
}
