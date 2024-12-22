/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.jualmobil.controller;

/**
 *
 * @author Alma
 */

import com.mycompany.jualmobil.beans.MPV;
import com.mycompany.jualmobil.beans.Mobil;
import java.util.List;    
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;
import com.mycompany.jualmobil.beans.Penjualan;
import com.mycompany.jualmobil.beans.SUV;
import com.mycompany.jualmobil.beans.Sedan;
import com.mycompany.jualmobil.dao.MobilDao;
import com.mycompany.jualmobil.dao.PenjualanDao; 
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet("/penjualan/*")
public class PenjualanController extends HttpServlet {
    private PenjualanDao penjualanDao;   

    @Override
    public void init() throws ServletException {
        penjualanDao = new PenjualanDao();
    }
    
     @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        if (path==null || path.equals("/list")) {
            tampilPenjualan(request, response);
        } else if (path.startsWith("/edit/")) {
            ubahPenjualan(request, response);
        } else if (path.startsWith("/delete/")) {
            hapusPenjualan(request, response);
        }
    } 
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idPenjualan = request.getParameter("idPenjualan");
        String idSales = request.getParameter("idSales");
        String idMobil = request.getParameter("idMobil");
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        Date tanggal = null;
        try {
            tanggal = formatter.parse(request.getParameter("tanggal"));
        } catch (ParseException ex) {
            Logger.getLogger(PenjualanController.class.getName()).log(Level.SEVERE, null, ex);
        }
        double hargaJual = Double.parseDouble(request.getParameter("hargaJual"));
        
        Penjualan p = new Penjualan(idPenjualan, idSales, idMobil, tanggal, hargaJual);
        
        if (idPenjualan!=null && !idPenjualan.isEmpty()) {
            penjualanDao.ubahPenjualan(p);
        } else {
            penjualanDao.tambahPenjualan(p);
        }
        
        response.sendRedirect(request.getContextPath() + "/penjualan/list");
    } 
        
    public void tampilPenjualan(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Penjualan> daftarPenjualan = penjualanDao.getPenjualan();
        request.setAttribute("daftarPenjualan", daftarPenjualan);
        request.getRequestDispatcher("/").forward(request, response); // diubah "" nya
    } 
    
    public void ubahPenjualan(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getPathInfo().split("/")[2];
        Penjualan p = penjualanDao.getPenById(id);
        request.setAttribute("penjualan", p);
        request.getRequestDispatcher("/").forward(request, response); //diubah "" nya
    } 
    
    public void hapusPenjualan(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getPathInfo().split("/")[2];
        penjualanDao.hapusPenjualan(id);
        request.getRequestDispatcher("/").forward(request, response); //diubah "" nya
    } 
}
