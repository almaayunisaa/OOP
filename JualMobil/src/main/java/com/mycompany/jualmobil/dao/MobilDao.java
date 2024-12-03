/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.jualmobil.dao;

/**
 *
 * @author Aqila Hasya Nafisah
 */

import java.sql.ResultSet;    
import java.sql.SQLException;    
import java.util.List;    
import org.springframework.jdbc.core.BeanPropertyRowMapper;    
import org.springframework.jdbc.core.JdbcTemplate;    
import org.springframework.jdbc.core.RowMapper;    
import com.mycompany.jualmobil.beans.Mobil;    

public class MobilDao {
    JdbcTemplate template;    

    public void setTemplate(JdbcTemplate template) {    
        this.template = template;    
    }
    
    public int saveMobil(Mobil m){    
        String sql="insert into mob(name,salary,designation) values('"+m.getIdMobil()+"',"+m.getNama()+",'"+m.getNomorMesin()+",'"+m.getKapasitasMesin()+",'"+m.getKetersediaan()+",'"+m.getHarga()+",'"+m.getNomorRangka()+",'"+m.getOdoMeter()+",'"+m.getPlatNomor()+",'"+m.getTipe()+",'"+m.getWarna()+"')";    
        return template.update(sql);    
    }    
    
    public int updateMobil(Mobil m){    
        String sql="update mob nama="+m.getNama()+", NoMesin="+m.getNomorMesin()+", NoRangka="+m.getNomorRangka()+", KapasitasMesin="+m.getKapasitasMesin()+", Ketersediaan="+m.getKetersediaan()+", Harga="+m.getHarga()+", OdoMeter="+m.getOdoMeter()+", PlatNomor="+m.getPlatNomor()+", Tipe="+m.getTipe()+", Warna="+m.getWarna()+"' where id="+m.getIdMobil()+"";    
        return template.update(sql);    
    }    
    
    public int deleteMobil(int id){    
        String sql="delete from mob where id="+id+"";    
        return template.update(sql);    
    }    
    
    public Mobil getMobById(int id){    
        String sql="select * from mob where id=?";    
        return template.queryForObject(sql, new Object[]{id},new BeanPropertyRowMapper<Mobil>(Mobil.class));    
    }    
    
    public List<Mobil> getMobil(){
        return template.query("select * from mob",new RowMapper<Mobil>(){    
            public Mobil mapRow(ResultSet rs, int row) throws SQLException {    
                Mmobil m=new Mmobil();    //aku bingung harusnya apa
                m.getIdMobil(rs.getString(1));    
                m.setName(rs.getString(2));    
                m.setSalary(rs.getFloat(3));    
                m.setDesignation(rs.getString(4));    
                return m;    
            }    
        });    
    }    
}
