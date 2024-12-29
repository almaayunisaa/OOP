/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.jualmobil.controller;

import com.mycompany.jualmobil.beans.MPV;
import com.mycompany.jualmobil.beans.Mobil;
import com.mycompany.jualmobil.beans.Petugas;
import com.mycompany.jualmobil.beans.SUV;
import com.mycompany.jualmobil.beans.Sales;
import com.mycompany.jualmobil.beans.Sedan;
import com.mycompany.jualmobil.dao.MobilDao;

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

/**
 * Controller untuk mengelola operasi CRUD pada data mobil.
 * Kelas ini menangani permintaan HTTP dan memanggil metode DAO untuk memanipulasi data di database.
 * 
 * <p>Kelas ini menggunakan {@link MobilDao} untuk berinteraksi dengan database, 
 * serta bekerja dengan berbagai kelas seperti {@link MPV}, {@link SUV}, dan {@link Sedan}
 * untuk merepresentasikan jenis mobil yang berbeda.</p>
 * 
 * <p>Fungsi utama controller ini meliputi:</p>
 * <ul>
 *   <li>Menampilkan daftar mobil.</li>
 *   <li>Menambahkan mobil baru.</li>
 *   <li>Menghapus mobil.</li>
 *   <li>Mengubah data mobil.</li>
 *   <li>Mencari mobil berdasarkan nama atau ID.</li>
 * </ul>
 * 
 * @author Kelompok Mobil
 * @version 1.0
 */
@WebServlet(name = "MobilController", urlPatterns = {"/mobilController"})
public class MobilController extends HttpServlet {      
    private MobilDao mobilDao;   
        
    /**
     * Inisialisasi servlet dan membuat instance {@link MobilDao}.
     * 
     * @throws ServletException jika terjadi kesalahan saat inisialisasi.
     */
    @Override
    public void init() throws ServletException {
        try {
            mobilDao = new MobilDao();
        } catch (SQLException ex) {
            Logger.getLogger(MobilController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    /**
     * Menangani permintaan GET dari klien.
     * Memproses aksi berdasarkan parameter 'action', yaitu menampilkan daftar mobil,
     * mendapatkan mobil berdasarkan ID, atau mencari mobil berdasarkan nama.
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
            try {
                tampilMobil(request, response);
            } catch (SQLException ex) {
                Logger.getLogger(MobilController.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if ("getMobil".equals(action)) {
            getMobil(request, response);
        } else if ("getMobilNama".equals(action)) {
            getMobilNama(request, response);
        }
    } 
    
    /**
     * Menangani permintaan POST dari klien.
     * Memproses berbagai aksi berdasarkan parameter 'action', yaitu menambahkan,
     * menghapus, atau mengubah data mobil.
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
            tambahMobil(request, response);
        } else if ("delete".equals(action)) {
            hapusMobil(request, response);
        } else if ("edit".equals(action)) {
            ubahMobil(request, response);
        }
    } 
    
    /**
     * Menampilkan daftar mobil berdasarkan sumber dan jenis pengguna dapat Petugas atau Sales.
     * 
     * @param request Objek permintaan HTTP.
     * @param response Objek respon HTTP.
     * @throws ServletException jika terjadi kesalahan servlet.
     * @throws IOException jika terjadi kesalahan I/O.
     * @throws SQLException jika terjadi kesalahan database.
     */
    private void tampilMobil(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        List<Mobil> daftarMobil = mobilDao.getMobil();
        request.setAttribute("daftarMobil", daftarMobil);
        
        String source = request.getParameter("source");
        String user = request.getParameter("user");
        if ("login".equals(source) && "Petugas".equals(user)) {
            request.getRequestDispatcher("Homepage_Petugas.jsp").forward(request, response);
        } else if ("login".equals(source) && "Sales".equals(user)) {
            request.getRequestDispatcher("Homepage_Sales.jsp").forward(request, response);
        } else if ("homepage".equals(source)) {
            request.getRequestDispatcher("produk.jsp").forward(request, response);
        }
    } 
    
    /**
     * Mengubah data mobil berdasarkan parameter yang diterima dari permintaan HTTP.
     * 
     * <p>Metode ini menentukan tipe mobil berdasarkan parameter
     * 'tipeMobil_edit' dan memperbarui data mobil baik dalam daftar lokal maupun di database.</p>
     * 
     * @param request Objek {@link HttpServletRequest} yang berisi data permintaan dari klien.
     * @param response Objek {@link HttpServletResponse} untuk mengirimkan respon ke klien.
     * @throws ServletException jika terjadi kesalahan servlet.
     * @throws IOException jika terjadi kesalahan I/O.
     */
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
        
        Object user = request.getAttribute("user");
        if (user instanceof Petugas) {
            Petugas p = (Petugas) user;
            List<Mobil> lm = (List<Mobil>) request.getAttribute("daftarMobil");
            p.ubahMobil(id, m, lm);
            request.setAttribute("daftarMobil", lm);
        }
        
        mobilDao.ubahMobil(m);
        response.sendRedirect("mobilController?action=tampil&source=homepage&user=Petugas");
    } 
    
    /**
     * Menghapus data mobil berdasarkan ID yang diterima dari permintaan HTTP.
     * 
     * <p>Metode ini menghapus data mobil dari daftar lokal dan database.</p>
     * 
     * @param request Objek {@link HttpServletRequest} yang berisi data permintaan dari klien.
     * @param response Objek {@link HttpServletResponse} untuk mengirimkan respon ke klien.
     * @throws ServletException jika terjadi kesalahan servlet.
     * @throws IOException jika terjadi kesalahan I/O.
     */
    private void hapusMobil(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id"); 
        Object user = request.getAttribute("user");
        if (user instanceof Petugas) {
            Petugas p = (Petugas) user;
            List<Mobil> lm = (List<Mobil>) request.getAttribute("daftarMobil");
            p.hapusMobil(id, lm);
            request.setAttribute("daftarMobil", lm);
        }
        mobilDao.hapusMobil(id);
        response.sendRedirect("mobilController?action=tampil&source=homepage&user=Petugas");
    } 
    
    /**
     * Menambahkan mobil baru ke daftar mobil berdasarkan parameter yang diterima dari permintaan HTTP.
     * 
     * <p>Metode ini menentukan tipe mobil berdasarkan parameter
     * 'tipeMobil' dan menambahkan data mobil ke daftar lokal serta database.</p>
     * 
     * @param request Objek {@link HttpServletRequest} yang berisi data permintaan dari klien.
     * @param response Objek {@link HttpServletResponse} untuk mengirimkan respon ke klien.
     * @throws ServletException jika terjadi kesalahan servlet.
     * @throws IOException jika terjadi kesalahan I/O.
     */
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
        
        Object user = request.getAttribute("user");
        if (user instanceof Petugas) {
            Petugas p = (Petugas) user;
            List<Mobil> lm = (List<Mobil>) request.getAttribute("daftarMobil");
            p.tambahMobil(m, lm);
            request.setAttribute("daftarMobil", lm);
        }
        mobilDao.tambahMobil(m);
        response.sendRedirect("mobilController?action=tampil&source=homepage&user=Petugas");
    }
    
    /**
     * Mendapatkan data mobil berdasarkan ID yang diterima dari permintaan HTTP.
     * 
     * <p>Metode ini menampilkan data mobil spesifik yang sesuai dengan ID ke halaman frontend.</p>
     * 
     * @param request Objek {@link HttpServletRequest} yang berisi data permintaan dari klien.
     * @param response Objek {@link HttpServletResponse} untuk mengirimkan respon ke klien.
     * @throws ServletException jika terjadi kesalahan servlet.
     * @throws IOException jika terjadi kesalahan I/O.
     */
    private void getMobil(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("idMobil"); 
        request.setAttribute("mobil", mobilDao.getMobById(id));
        request.setAttribute("popUpEdit", true); 
        request.getRequestDispatcher("mobilController?action=tampil&source=homepage&user=Petugas").forward(request, response);
    } 
    
    /**
     * Menampilkan daftar mobil berdasarkan nama yang diterima dari permintaan HTTP.
     * 
     * <p>Metode ini mencari mobil berdasarkan nama baik di daftar lokal maupun di database.
     * Hasil pencarian kemudian diteruskan ke halaman frontend.</p>
     * 
     * @param request Objek {@link HttpServletRequest} yang berisi data permintaan dari klien.
     * @param response Objek {@link HttpServletResponse} untuk mengirimkan respon ke klien.
     * @throws ServletException jika terjadi kesalahan servlet.
     * @throws IOException jika terjadi kesalahan I/O.
     */
    private void getMobilNama(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nama = request.getParameter("namaMobilSearch"); 
        
        Object user = request.getAttribute("user");
        if (user instanceof Petugas) {
            Petugas p = (Petugas) user;
            List<Mobil> lm = (List<Mobil>) request.getAttribute("daftarMobil");
            lm = p.tampilkanMobilBerdasarkanNama(nama, lm);
            request.setAttribute("daftarMobil", lm);
        } else if (user instanceof Sales) {
            Sales p = (Sales) user;
            List<Mobil> lm = (List<Mobil>) request.getAttribute("daftarMobil");
            lm = p.tampilkanMobilBerdasarkanNama(nama, lm);
            request.setAttribute("daftarMobil", lm);
        }
        
        List<Mobil> daftarMobil = mobilDao.getMobByNama(nama);
        if ("Sales".equals(request.getParameter("user"))) {
            request.setAttribute("daftarMobilSearch", daftarMobil);
            request.getRequestDispatcher("mobilController?action=tampil&source=login&user=Sales").forward(request, response);
        } else {
            request.setAttribute("daftarMobilSearch", daftarMobil);
            request.getRequestDispatcher("mobilController?action=tampil&source=homepage&user=Petugas").forward(request, response);
        }
    } 
}
