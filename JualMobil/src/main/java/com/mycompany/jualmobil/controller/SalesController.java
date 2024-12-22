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
import com.mycompany.jualmobil.beans.Sales;
import com.mycompany.jualmobil.dao.SalesDao; 

@WebServlet("/user/*")
public class SalesController extends HttpServlet {
    private SalesDao salesDao;//will inject dao from XML file    

    @Override
    public void init() throws ServletException {
        salesDao = new SalesDao();
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idSales = request.getParameter("idSales");
        String nama = request.getParameter("nama");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        Sales p = new Sales(idSales, nama, username, password);
        salesDao.tambahPetugas(p);
        response.sendRedirect(request.getContextPath() + "/user/list");
    } 
    
}