package com.mycompany.jualmobil.beans;

import java.util.List;
import java.util.ArrayList;
import java.util.Date; 
 
public class Sales {
    private String idSales;
    private String nama;
    private String username;
    private String password;
    private List<Penjualan> daftarPenjualan;

    public Sales(String idSales, String nama, String username, String password){
        this.idSales = idSales;
        this.nama = nama;
        this.username = username;
        this.password = password;
    }

    public String getId(){
        return this.idSales;
    }

    public String getNama(){
        return this.nama;
    }

    public String getUsername(){
        return this.username;
    }

    public String getPassword(){
        return this.password;
    }

    public void catatPenjualan(String idMobil, Date tanggalPenjualan, double hargaJual){
        int currentId = daftarPenjualan.size() + 1;
        Penjualan penjualan = new Penjualan(String.valueOf(currentId), idSales, idMobil, tanggalPenjualan, hargaJual);
        daftarPenjualan.add(penjualan);
    }

    public List<Penjualan> rekapPenjualan(Date tanggalMulai, Date tanggalAkhir){
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

}