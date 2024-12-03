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
import org.springframework.beans.factory.annotation.Autowired;    
import org.springframework.stereotype.Controller;  
import org.springframework.ui.Model;  
import org.springframework.web.bind.annotation.ModelAttribute;    
import org.springframework.web.bind.annotation.PathVariable;    
import org.springframework.web.bind.annotation.RequestMapping;    
import org.springframework.web.bind.annotation.RequestMethod;     

import com.mycompany.jualmobil.beans.Mobil;
import com.mycompany.jualmobil.dao.MobilDao; 

@Controller    
public class MobilController {    
    @Autowired    
    MobilDao dao;//will inject dao from XML file    
        
    /*It displays a form to input data, here "command" is a reserved request attribute  
     *which is used to display object data into form  
     */    
    @RequestMapping("/mobform")    
    public String showform(Model m){    
        m.addAttribute("command", new Mobil());  
        return "mobform";   
    }    

    // Menyimpan data mobil baru
    @RequestMapping(value="/savemobil", method = RequestMethod.POST)    
    public String saveMobil(@ModelAttribute("mobil") Mobil mobil){    
        dao.saveMobil(mobil);    
        return "redirect:/viewmobil";
    }     
    
    // Menampilkan daftar mobil
    @RequestMapping("/viewmobil")    
    public String viewMobil(Model m){    
        List<Mobil> list = dao.getMobil();    
        m.addAttribute("list", list);  
        return "viewmobil";    
    } 
    
    // Menampilkan form edit mobil berdasarkan ID
    @RequestMapping(value="/editmobil/{id}")    
    public String editMobil(@PathVariable int id, Model m){    
        Mobil mobil = dao.getMobilById(id);    
        m.addAttribute("command", mobil);  
        return "mobeditform";    
    }   
    
   // Menyimpan perubahan data mobil
    @RequestMapping(value="/updatemobil", method = RequestMethod.POST)    
    public String updateMobil(@ModelAttribute("mobil") Mobil mobil){    
        dao.updateMobil(mobil);    
        return "redirect:/viewmobil";    
    }     
    
    // Menghapus mobil berdasarkan ID
    @RequestMapping(value="/deletemobil/{id}", method = RequestMethod.GET)    
    public String deleteMobil(@PathVariable int id){    
        dao.deleteMobil(id);    
        return "redirect:/viewmobil";    
    }
    
    // Tambahan: Metode untuk mencari mobil berdasarkan id
    @RequestMapping("/mobil/{id}")
    public int filterMobilByTipe(@PathVariable String id, Model m) {
        List<Mobil> filteredList = dao.getMobById(id);
        m.addAttribute("list", filteredList);
        m.addAttribute("tipe", id);
        return filteredList;
    }
}
