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
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.io.IOException;

import com.mycompany.jualmobil.beans.Sales;
import com.mycompany.jualmobil.dao.SalesDao; 


@WebServlet(name = "SalesController", urlPatterns = {"/salesController"})
public class SalesController extends HttpServlet {
    private SalesDao salesDao; 
    
    @Override
    public void init() throws ServletException {
        try {
            salesDao = new SalesDao();
        } catch (SQLException ex) {
            Logger.getLogger(PenjualanController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doGet(jakarta.servlet.http.HttpServletRequest request, jakarta.servlet.http.HttpServletResponse response) throws jakarta.servlet.ServletException, IOException {
        String action = request.getParameter("action");
        if ("verifikasi".equals(action)) {
            VerifikasiPass(request, response);
        }
    } 
    
    private void VerifikasiPass(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        Sales s = salesDao.getUserbyUsn(username);
        if (s.getPassword() == null ? password == null : s.getPassword().equals(password)) {
            response.sendRedirect("mobilController?action=tampil&source=login&user=Sales");
        } else {
            response.sendRedirect("login.jsp?error=1");
        }
    } 
    
}