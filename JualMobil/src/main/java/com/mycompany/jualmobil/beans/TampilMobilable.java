package com.mycompany.jualmobil.beans;


import com.mycompany.jualmobil.beans.Mobil;
import java.util.List;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */

/**
 *
 * @author Alma
 */
public interface TampilMobilable {
   abstract public List<Mobil> tampilkanMobilBerdasarkanNama(String nama, List<Mobil> ListMobil);
   abstract public Mobil tampilkanMobil(String idMobil,  List<Mobil> ListMobil);
}
