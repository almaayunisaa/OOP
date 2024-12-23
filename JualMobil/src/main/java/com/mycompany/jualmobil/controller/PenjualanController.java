/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.jualmobil.controller;

/**
 *
 * @author Alma
 */
  
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import com.mycompany.jualmobil.beans.Penjualan;
import com.mycompany.jualmobil.dao.PenjualanDao; 

@WebServlet(name = "PenjualanController", urlPatterns = {"/penjualanController"})
public class PenjualanController extends HttpServlet {
    private PenjualanDao penjualanDao;   

    @Override
    public void init() throws ServletException {
        try {
            penjualanDao = new PenjualanDao();
        } catch (SQLException ex) {
            Logger.getLogger(PenjualanController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
     @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("tampil".equals(action)) {
            tampilPenjualan(request, response);
        } else if ("getPenjualan".equals(action)) {
            getPenjualan(request, response);
        } else if ("getPenjualan_tanggal".equals(action)) {
            getPenjualanTanggal(request, response);
        } 
    } 
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("tambah".equals(action)) {
            tambahPenjualan(request, response);
        } else if ("delete".equals(action)) {
            hapusPenjualan(request, response);
        } else if ("edit".equals(action)) {
            ubahPenjualan(request, response);
        }
    } 
        
    public void tampilPenjualan(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Penjualan> daftarPenjualan = penjualanDao.getPenjualan();
        request.setAttribute("daftarPenjualan", daftarPenjualan);
        String user = request.getParameter("user");
        request.setAttribute("user", user);
        request.getRequestDispatcher("pencatatan.jsp").forward(request, response);
    } 
    
    public void ubahPenjualan(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idPenjualan = request.getParameter("idPenjualan_edit");
        String idSales = request.getParameter("idSales_edit");
        String idMobil = request.getParameter("idMobil_edit");
        String tanggal_form = request.getParameter("tanggal_edit");
        double hargaJual = Double.parseDouble(request.getParameter("hargaJual_edit"));
        java.sql.Date tanggal = null;
        if (tanggal_form != null && !tanggal_form.isEmpty()) {
            tanggal = java.sql.Date.valueOf(tanggal_form); 
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Tanggal tidak boleh kosong");
            return;
        }
        Penjualan p = new Penjualan(idPenjualan,idSales, idMobil, tanggal, hargaJual);
        penjualanDao.ubahPenjualan(p);
        response.sendRedirect("penjualanController?action=tampil");
    } 
    
    public void tambahPenjualan(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idPenjualan = request.getParameter("idPenjualan");
        String idSales = request.getParameter("idSales");
        String idMobil = request.getParameter("idMobil");
        String tanggal_form = request.getParameter("tanggal");
        double hargaJual = Double.parseDouble(request.getParameter("hargaJual"));
        java.sql.Date tanggal = null;
        if (tanggal_form != null && !tanggal_form.isEmpty()) {
            tanggal = java.sql.Date.valueOf(tanggal_form); 
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Tanggal tidak boleh kosong");
            return;
        }
        Penjualan p = new Penjualan(idPenjualan,idSales, idMobil, tanggal, hargaJual);
        penjualanDao.tambahPenjualan(p);
        request.getRequestDispatcher("pencatatan.jsp").forward(request, response); 
    } 
    
    public void hapusPenjualan(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id"); 
        penjualanDao.hapusPenjualan(id);
        response.sendRedirect("penjualanController?action=tampil");
    } 
    
    private void getPenjualan(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("idPenjualan"); 
        request.setAttribute("penjualan", penjualanDao.getPenById(id) );
        request.setAttribute("popUpEdit", true); 
        request.getRequestDispatcher("penjualanController?action=tampil").forward(request, response);
    } 
    
    private void getPenjualanTanggal(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String tanggalMulai_n = request.getParameter("tanggalMulai"); 
        String tanggalAkhir_n = request.getParameter("tanggalAkhir"); 
        
        java.sql.Date tanggalMulai = null;
        java.sql.Date tanggalAkhir = null;
        if (tanggalMulai_n != null && !tanggalMulai_n.isEmpty() && tanggalAkhir_n != null && !tanggalAkhir_n.isEmpty()) {
            tanggalMulai = java.sql.Date.valueOf(tanggalMulai_n); 
            tanggalAkhir = java.sql.Date.valueOf(tanggalAkhir_n); 
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Tanggal tidak boleh kosong");
            return;
        }
        
        request.setAttribute("daftarPenjualanTanggal", penjualanDao.getPenjualanbyTanggal(tanggalMulai, tanggalAkhir));
        request.getRequestDispatcher("pencatatan.jsp").forward(request, response);
    } 
}
