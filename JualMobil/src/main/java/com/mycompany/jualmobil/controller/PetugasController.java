/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.jualmobil.controller;

/**
 *
 * @author Alma
 */

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

import com.mycompany.jualmobil.beans.Petugas;
import com.mycompany.jualmobil.dao.PetugasDao; 

@WebServlet("/user/*")
public class PetugasController extends HttpServlet {
    private PetugasDao petugasDao;//will inject dao from XML file    

    @Override
    public void init() throws ServletException {
        petugasDao = new PetugasDao();
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idPetugas = request.getParameter("idPetugas");
        String nama = request.getParameter("nama");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        Petugas p = new Petugas(idPetugas, nama, username, password);
        petugasDao.tambahPetugas(p);
        response.sendRedirect(request.getContextPath() + "/user/list");
    } 
    
}
