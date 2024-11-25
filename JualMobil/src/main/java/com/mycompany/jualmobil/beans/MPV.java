/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.jualmobil.beans;

/**
 *
 * @author Alma
 */
public class MPV extends Mobil {

    public MPV(String idMobil, String nama, String nomorRangka, String nomorMesin, String platNomor, double kapasitasMesin, int ketersediaan, double harga, String warna, int odoMeter) {
        super(idMobil, nama, nomorRangka, nomorMesin, platNomor, kapasitasMesin, ketersediaan, harga, warna, odoMeter);
    }
    
    @Override
    public void setTipe(String tipe) {
        super.tipe=tipe;
    }
}
