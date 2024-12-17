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
import com.mycompany.jualmobil.beans.Petugas;
import com.mycompany.jualmobil.dao.PetugasDao; 

@Controller
@RequestMapping("/petugas")
public class PetugasController {
    private PetugasDao petugasDao;//will inject dao from XML file    

    public PetugasController(PetugasDao petugasDao) {
        this.petugasDao = petugasDao;
    }
    
    @GetMapping("/tampil/{username}")    
    public void getPetugasUsn(@PathVariable String username, Model model) {
        Petugas p = petugasDao.getUserbyUsn(username);
        model.addAttribute("Petugas", p);
    }
    
    @PostMapping("/save")
    public String simpanPetugas(@ModelAttribute("Petugas") Petugas p) {
        petugasDao.tambahPetugas(p);
        return "redirect:/petugas";
    }
    
}
