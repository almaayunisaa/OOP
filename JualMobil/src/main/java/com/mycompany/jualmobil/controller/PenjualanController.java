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
import com.mycompany.jualmobil.beans.Penjualan;
import com.mycompany.jualmobil.dao.PenjualanDao; 

@Controller
@RequestMapping("/penjualan")
public class PenjualanController {
    private PenjualanDao penjualanDao;//will inject dao from XML file    

    public PenjualanController(PenjualanDao penjualanDao) {
        this.penjualanDao = penjualanDao;
    }
    
    @GetMapping    
    public void tampilPenjualan(Model model) {
        List<Penjualan> daftarPenjualan = penjualanDao.getPenjualan();
        model.addAttribute("daftarPenjualan", daftarPenjualan);
    }
    
    @GetMapping("/edit/{id}")
    public void ubahPenjualan(@PathVariable String id, Model model) {
        Penjualan p = penjualanDao.getPenById(id);
        model.addAttribute("Penjualan", p);
    }
    
    @PostMapping("/save")
    public String simpanPenjualan(@ModelAttribute("Penjualan") Penjualan p) {
        penjualanDao.tambahPenjualan(p);
        return "redirect:/penjualan";
    }
    
    @GetMapping("/delete/{id}")
    public String hapusPenjualan(@PathVariable String id) {
        penjualanDao.hapusPenjualan(id);
        return "redirect:/mobil";
    }
}
