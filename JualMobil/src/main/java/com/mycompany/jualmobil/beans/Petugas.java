/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.jualmobil.beans;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Alma
 */
public class Petugas implements TampilMobilable {
    private String idPetugas;
    private String nama;
    private String username;
    private String password;

    public Petugas(String idPetugas, String nama, String username, String password) {
        this.idPetugas = idPetugas;
        this.nama = nama;
        this.username = username;
        this.password = password;
    }

    public String getIdPetugas() {
        return idPetugas;
    }

    public String getNama() {
        return nama;
    }

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }
    
    public void tambahMobil(Mobil m, List<Mobil> ListMobil) {
        ListMobil.add(m);
    }
    
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
   
    @Override
   public Mobil tampilkanMobil(String idMobil,  List<Mobil> ListMobil) {
       Mobil mBalik = null;
       for (Mobil m : ListMobil) {
            if (m.getNama().equals(nama)) {
                mBalik=m;
                break;
            }
        }
       return mBalik;
   }
   

}
