/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.jualmobil.controller;

/**
 *
 * @author Aqila Hasya Nafisah
 */

import java.util.List;    
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.*;
import com.mycompany.jualmobil.beans.Mobil;
import com.mycompany.jualmobil.dao.MobilDao; 

@Controller
@RequestMapping("/mobil")
public class MobilController {      
    private MobilDao mobilDao;//will inject dao from XML file    
        
    public MobilController(MobilDao mobilDao) {
        this.mobilDao = mobilDao;
    }
    
    @GetMapping    
    public void tampilMobil(Model model) {
        List<Mobil> daftarMobil = mobilDao.getMobil();
        model.addAttribute("daftarMobil", daftarMobil);
    }
    
    @GetMapping("/edit/{id}")
    public void ubahMobil(@PathVariable String id, Model model) {
        Mobil mobil = mobilDao.getMobById(id);
        model.addAttribute("mobil", mobil);
    }
    
    @PostMapping("/save")
    public String simpanMobil(@ModelAttribute("mobil") Mobil m) {
        if (m.getIdMobil()!=null) {
            mobilDao.ubahMobil(m);
        } else {
            mobilDao.tambahMobil(m);
        }
        return "redirect:/mobil";
    }
    
    @GetMapping("/delete/{id}")
    public String hapusMobil(@PathVariable String id) {
        mobilDao.hapusMobil(id);
        return "redirect:/mobil";
    }
}
