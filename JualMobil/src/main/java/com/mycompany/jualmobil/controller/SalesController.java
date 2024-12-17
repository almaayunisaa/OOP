/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.jualmobil.controller;

/**
 *
 * @author Alma
 */

import java.util.List;    
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.*;
import com.mycompany.jualmobil.beans.Sales;
import com.mycompany.jualmobil.dao.SalesDao; 

@Controller
@RequestMapping("/sales")
public class SalesController {
    private SalesDao salesDao;//will inject dao from XML file    

    public SalesController(SalesDao salesDao) {
        this.salesDao = salesDao;
    }
    
    @GetMapping("/tampil/{username}")    
    public void getSalesUsn(@PathVariable String username, Model model) {
        Sales s = salesDao.getUserbyUsn(username);
        model.addAttribute("Sales", s);
    }
    
    @PostMapping("/save")
    public String simpanPetugas(@ModelAttribute("Petugas") Sales s) {
        salesDao.tambahSales(s);
        return "redirect:/sales";
    }
}
