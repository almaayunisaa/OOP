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
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

import com.mycompany.jualmobil.beans.Petugas;
import com.mycompany.jualmobil.dao.PetugasDao; 
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Controller untuk mengelola autentikasi dan sesi pengguna untuk entitas Petugas.
 * 
 * <p>Kelas ini menangani operasi berikut:</p>
 * <ul>
 *   <li>Verifikasi username dan password petugas.</li>
 *   <li>Mengelola sesi (login dan logout).</li>
 * </ul>
 * 
 * <p>Kelas ini menggunakan {@link PetugasDao} untuk berinteraksi dengan database
 * dan memeriksa kredensial pengguna.</p>
 * 
 * @author Kelompok Mobil
 * @version 1.0
 */
@WebServlet(name = "PetugasController", urlPatterns = {"/petugasController"})
public class PetugasController extends HttpServlet {
    private PetugasDao petugasDao;   

    /**
     * Inisialisasi servlet dan membuat instance {@link PetugasDao}.
     * 
     * @throws ServletException jika terjadi kesalahan saat inisialisasi.
     */
    @Override
    public void init() throws ServletException {
        try {
            petugasDao = new PetugasDao();
        } catch (SQLException ex) {
            Logger.getLogger(PetugasController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Menangani permintaan GET dari klien.
     * Memproses berbagai aksi berdasarkan parameter 'action', yaitu verifikasi login
     * dan logout.
     * 
     * @param request Objek {@link HttpServletRequest} yang berisi permintaan klien.
     * @param response Objek {@link HttpServletResponse} untuk mengirimkan respon ke klien.
     * @throws ServletException jika terjadi kesalahan servlet.
     * @throws IOException jika terjadi kesalahan I/O.
     */
    @Override
    protected void doGet(jakarta.servlet.http.HttpServletRequest request, jakarta.servlet.http.HttpServletResponse response) throws jakarta.servlet.ServletException, IOException {
        String action = request.getParameter("action");
        if ("verifikasi".equals(action)) {
            VerifikasiPass(request, response);
        } else if ("logout".equals(action)) {
            logOut(request, response);
        }
    } 
    
    /**
     * Memverifikasi username dan password petugas untuk login.
     * 
     * <p>Jika kredensial valid, sesi pengguna akan dibuat dan diarahkan ke halaman
     * dashboard Petugas. Jika tidak valid, pengguna akan diarahkan kembali ke halaman login
     * dengan pesan kesalahan.</p>
     * 
     * @param request Objek {@link HttpServletRequest} yang berisi permintaan klien.
     * @param response Objek {@link HttpServletResponse} untuk mengirimkan respon ke klien.
     * @throws ServletException jika terjadi kesalahan servlet.
     * @throws IOException jika terjadi kesalahan I/O.
     */
    private void VerifikasiPass(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        Petugas s = petugasDao.getUserbyUsn(username);
        if (s.getPassword() == null ? password == null : s.getPassword().equals(password)) {
            HttpSession session = request.getSession();
            session.setAttribute("user", s);
            
            response.sendRedirect("mobilController?action=tampil&source=login&user=Petugas");
        } else {
            response.sendRedirect("login.jsp?error=1");
        }
    } 
    
    /**
     * Mengakhiri sesi pengguna yang sedang aktif dan mengarahkan pengguna kembali
     * ke halaman login.
     * 
     * @param request Objek {@link HttpServletRequest} yang berisi permintaan klien.
     * @param response Objek {@link HttpServletResponse} untuk mengirimkan respon ke klien.
     * @throws ServletException jika terjadi kesalahan servlet.
     * @throws IOException jika terjadi kesalahan I/O.
     */
    private void logOut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false); 
        if (session != null) {
            session.invalidate();
        }
        response.sendRedirect("login.jsp");
    } 
}
