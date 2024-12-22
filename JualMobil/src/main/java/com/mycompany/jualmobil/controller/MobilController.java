/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.jualmobil.controller;

/**
 *
 * @author Aqila Hasya Nafisah
 */

import com.mycompany.jualmobil.beans.MPV;
import com.mycompany.jualmobil.beans.Mobil;
import com.mycompany.jualmobil.beans.SUV;
import com.mycompany.jualmobil.beans.Sedan;
import com.mycompany.jualmobil.dao.MobilDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import static java.lang.System.out;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "MobilController", urlPatterns = {"/mobilController"})
public class MobilController extends HttpServlet {      
    private MobilDao mobilDao;   
        
    @Override
    public void init() throws ServletException {
        try {
            mobilDao = new MobilDao();
        } catch (SQLException ex) {
            Logger.getLogger(MobilController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("tampil".equals(action)) {
            try {
                tampilMobil(request, response);
            } catch (SQLException ex) {
                Logger.getLogger(MobilController.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if ("getMobil".equals(action)) {
            getMobil(request, response);
        }
    } 
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("tambah".equals(action)) {
            tambahMobil(request, response);
        } else if ("delete".equals(action)) {
            hapusMobil(request, response);
        } else if ("edit".equals(action)) {
            ubahMobil(request, response);
        }
    } 
    
    private void tampilMobil(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        List<Mobil> daftarMobil = mobilDao.getMobil();
        request.setAttribute("daftarMobil", daftarMobil);
        
        request.getRequestDispatcher("produk.jsp").forward(request, response);
    } 
    
    private void ubahMobil(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("idMobil_edit"); 
        String nama = request.getParameter("nama_edit");
        String nomorRangka = request.getParameter("nomorRangka_edit");
        String nomorMesin = request.getParameter("nomorMesin_edit");
        String platNomor = request.getParameter("platNomor_edit");
        double kapasitasMesin = Double.parseDouble(request.getParameter("kapasitasMesin_edit"));
        int ketersediaan = Integer.parseInt(request.getParameter("ketersediaan_edit"));
        String tipe = request.getParameter("tipeMobil_edit");
        double harga = Double.parseDouble(request.getParameter("harga_edit"));
        String warna  = request.getParameter("warnaMobil_edit");
        int odoMeter = Integer.parseInt(request.getParameter("odoMeter_edit"));
        Mobil m = null;
        
        if ("SUV".equals(tipe)) {
            m = new SUV(id, nama, nomorRangka, nomorMesin, platNomor, kapasitasMesin, ketersediaan, harga, warna, odoMeter);
            m.setTipe(tipe);
        } else if ("MPV".equals(tipe)) {
            m = new MPV(id, nama, nomorRangka, nomorMesin, platNomor, kapasitasMesin, ketersediaan, harga, warna, odoMeter);
            m.setTipe(tipe);
        } else if ("Sedan".equals(tipe)) {
            m = new Sedan(id, nama, nomorRangka, nomorMesin, platNomor, kapasitasMesin, ketersediaan, harga, warna, odoMeter);
            m.setTipe(tipe);
        }
        
        mobilDao.ubahMobil(m);
        response.sendRedirect("mobilController?action=tampil");
    } 
    
    private void hapusMobil(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id"); 
        mobilDao.hapusMobil(id);
        response.sendRedirect("mobilController?action=tampil");
    } 
    
    private void tambahMobil(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("idMobil");
        String nama = request.getParameter("namaMobil");
        String nomorRangka = request.getParameter("nomorRangka");
        String nomorMesin = request.getParameter("nomorMesin");
        String platNomor = request.getParameter("platNomor");
        double kapasitasMesin = Double.parseDouble(request.getParameter("kapasitasMesin"));
        int ketersediaan = Integer.parseInt(request.getParameter("ketersediaan"));
        String tipe = request.getParameter("tipeMobil");
        double harga = Double.parseDouble(request.getParameter("harga"));
        String warna  = request.getParameter("warnaMobil");
        int odoMeter = Integer.parseInt(request.getParameter("odoMeter"));
       
        Mobil m = null;
        
        if ("SUV".equals(tipe)) {
            m = new SUV(id, nama, nomorRangka, nomorMesin, platNomor, kapasitasMesin, ketersediaan, harga, warna, odoMeter);
            m.setTipe(tipe);
        } else if ("MPV".equals(tipe)) {
            m = new MPV(id, nama, nomorRangka, nomorMesin, platNomor, kapasitasMesin, ketersediaan, harga, warna, odoMeter);
            m.setTipe(tipe);
        } else if ("Sedan".equals(tipe)) {
            m = new Sedan(id, nama, nomorRangka, nomorMesin, platNomor, kapasitasMesin, ketersediaan, harga, warna, odoMeter);
            m.setTipe(tipe);
        }
        
        mobilDao.tambahMobil(m);
        response.sendRedirect("mobilController?action=tampil");
    }
    
    private void getMobil(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("idMobil"); 
        request.setAttribute("mobil", mobilDao.getMobById(id));
        request.setAttribute("popUpEdit", true); 
        request.getRequestDispatcher("mobilController?action=tampil").forward(request, response);
    } 
}
