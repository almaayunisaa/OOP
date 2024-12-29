/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.jualmobil.controller;
  
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
import com.mycompany.jualmobil.beans.Sales;
import com.mycompany.jualmobil.dao.PenjualanDao; 

/**
 * Controller untuk mengelola operasi CRUD pada data penjualan.
 * Kelas ini menangani permintaan HTTP dan memanggil metode DAO untuk memanipulasi data penjualan di database.
 * 
 * <p>Kelas ini menggunakan {@link PenjualanDao} untuk berinteraksi dengan database,
 * serta bekerja dengan kelas {@link Penjualan} untuk merepresentasikan data penjualan.</p>
 * 
 * <p>Fungsi fungsi controller ini meliputi:</p>
 * <ul>
 *   <li>Menampilkan daftar penjualan.</li>
 *   <li>Menambahkan data penjualan.</li>
 *   <li>Menghapus data penjualan.</li>
 *   <li>Mengubah data penjualan.</li>
 *   <li>Mencari penjualan berdasarkan ID atau tanggal.</li>
 * </ul>
 * 
 * @author Kelompok Mobil
 * @version 1.0
 */
@WebServlet(name = "PenjualanController", urlPatterns = {"/penjualanController"})
public class PenjualanController extends HttpServlet {
    private PenjualanDao penjualanDao;   

    /**
     * Inisialisasi servlet dan membuat instance {@link PenjualanDao}.
     * 
     * @throws ServletException jika terjadi kesalahan saat inisialisasi.
     */
    @Override
    public void init() throws ServletException {
        try {
            penjualanDao = new PenjualanDao();
        } catch (SQLException ex) {
            Logger.getLogger(PenjualanController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    /**
     * Menangani permintaan GET dari klien.
     * Memproses berbagai aksi berdasarkan parameter 'action' yaitu menampilkan daftar penjualan,
     * mendapatkan penjualan berdasarkan ID, atau mencari penjualan berdasarkan rentang tanggal.
     * 
     * @param request Objek {@link HttpServletRequest} yang berisi permintaan klien.
     * @param response Objek {@link HttpServletResponse} untuk mengirimkan respon ke klien.
     * @throws ServletException jika terjadi kesalahan servlet.
     * @throws IOException jika terjadi kesalahan I/O.
     */
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
    
    /**
     * Menangani permintaan POST dari klien.
     * Memproses berbagai aksi berdasarkan parameter 'action' seperti menambahkan,
     * menghapus, atau mengubah data penjualan.
     * 
     * @param request Objek {@link HttpServletRequest} yang berisi permintaan klien.
     * @param response Objek {@link HttpServletResponse} untuk mengirimkan respon ke klien.
     * @throws ServletException jika terjadi kesalahan servlet.
     * @throws IOException jika terjadi kesalahan I/O.
     */
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
       
    /**
     * Menampilkan daftar penjualan dan meneruskan data ke halaman 'pencatatan.jsp'.
     * 
     * @param request Objek permintaan HTTP.
     * @param response Objek respon HTTP.
     * @throws ServletException jika terjadi kesalahan servlet.
     * @throws IOException jika terjadi kesalahan I/O.
     */
    public void tampilPenjualan(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Penjualan> daftarPenjualan = penjualanDao.getPenjualan();
        request.setAttribute("daftarPenjualan", daftarPenjualan);
        String user = request.getParameter("user");
        request.setAttribute("user", user);
        request.getRequestDispatcher("pencatatan.jsp").forward(request, response);
    } 
    
    /**
     * Mengubah data penjualan berdasarkan parameter dari permintaan HTTP.
     * 
     * @param request Objek permintaan HTTP.
     * @param response Objek respon HTTP.
     * @throws ServletException jika terjadi kesalahan servlet.
     * @throws IOException jika terjadi kesalahan I/O.
     */
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
    
    /**
     * Menambahkan data penjualan baru berdasarkan parameter dari permintaan HTTP.
     * 
     * @param request Objek permintaan HTTP.
     * @param response Objek respon HTTP.
     * @throws ServletException jika terjadi kesalahan servlet.
     * @throws IOException jika terjadi kesalahan I/O.
     */
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
        
        Object user = request.getAttribute("user");
        if (user instanceof Sales) {
            Sales s = (Sales) user;
            List<Penjualan> dp = (List<Penjualan>) request.getAttribute("daftarPenjualan");
            s.catatPenjualan(idMobil, tanggal, hargaJual, dp);
            request.setAttribute("daftarPenjualan", dp);
        }
        
        penjualanDao.tambahPenjualan(p);
        request.getRequestDispatcher("pencatatan.jsp").forward(request, response); 
    } 
    
    /**
     * Menghapus data penjualan berdasarkan ID yang diterima dari permintaan HTTP.
     * 
     * @param request Objek permintaan HTTP.
     * @param response Objek respon HTTP.
     * @throws ServletException jika terjadi kesalahan servlet.
     * @throws IOException jika terjadi kesalahan I/O.
     */
    public void hapusPenjualan(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id"); 
        penjualanDao.hapusPenjualan(id);
        response.sendRedirect("penjualanController?action=tampil");
    } 
    
    /**
     * Mendapatkan data penjualan berdasarkan ID dan menampilkannya di halaman frontend.
     * 
     * @param request Objek permintaan HTTP.
     * @param response Objek respon HTTP.
     * @throws ServletException jika terjadi kesalahan servlet.
     * @throws IOException jika terjadi kesalahan I/O.
     */
    private void getPenjualan(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("idPenjualan"); 
        request.setAttribute("penjualan", penjualanDao.getPenById(id) );
        request.setAttribute("popUpEdit", true); 
        request.getRequestDispatcher("penjualanController?action=tampil").forward(request, response);
    } 
    
    /**
     * Menampilkan daftar penjualan berdasarkan rentang tanggal.
     * 
     * @param request Objek permintaan HTTP.
     * @param response Objek respon HTTP.
     * @throws ServletException jika terjadi kesalahan servlet.
     * @throws IOException jika terjadi kesalahan I/O.
     */
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
        
        Object user = request.getAttribute("user");
        if (user instanceof Sales) {
            Sales s = (Sales) user;
            List<Penjualan> dp = (List<Penjualan>) request.getAttribute("daftarPenjualan");
            dp = s.rekapPenjualan(tanggalMulai, tanggalAkhir, dp);
            request.setAttribute("daftarPenjualan", dp);
        }
        
        request.setAttribute("daftarPenjualanTanggal", penjualanDao.getPenjualanbyTanggal(tanggalMulai, tanggalAkhir));
        request.getRequestDispatcher("pencatatan.jsp").forward(request, response);
    } 
}
