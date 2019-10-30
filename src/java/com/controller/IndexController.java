/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import java.sql.ResultSet;
import java.util.List;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author villa
 */
@Controller
public class IndexController {
    final String SELECT_QRY = "select * from empelado order by clave desc";
    final String INSERT_QRY = "insert into empelado (clave, nombre, sueldo) values (?,?,?)";
    final String UPDATE_QRY = "update empelado set nombre=?, sueldo=? where clave = ? ";
    final String DELETE_QRY = "delete from empelado where clave = ?";
    final String FIND_QRY = "select * from empelado where clave = ";
    
    Conexion con = new Conexion();
    JdbcTemplate jdbcTemplate  = new JdbcTemplate(con.conectar());
    
    @RequestMapping("index.htm")
    public String home(Model m) {
        m.addAttribute("empleados", this.getList());
        m.addAttribute("empleado", new Empleado());
        return "index";
    }
    
    @RequestMapping(value = "save.htm", method = RequestMethod.POST)
    public String save(@ModelAttribute("NewEmpleado")Empleado emp){
        SaveOrUpdate(emp);
        return "redirect:/index.htm";
    }
    @RequestMapping(value = "edit.htm", method = RequestMethod.GET)
    public String editar(@RequestParam("clave") int clave, Model m){
         m.addAttribute("empleado", FindEmpleado(clave));
         m.addAttribute("empleados", this.getList());
        return "index";
    }
     @RequestMapping(value = "delete.htm", method = RequestMethod.GET)
    public String borrar(@RequestParam("clave") int clave){
        this.delete(clave);
        return "redirect:/index.htm";
    }
    
    public List<Empleado> getList(){
        List<Empleado> listEmpresa = jdbcTemplate.query(SELECT_QRY, (ResultSet rs, int i) -> {
            Empleado emp = new Empleado();
            emp.setClave(rs.getInt(1));
            emp.setNombre(rs.getString(2));
            emp.setSueldo(rs.getInt(3));
            return emp;
        });
        return listEmpresa;
    }
    public int SaveOrUpdate(Empleado emp){
        if (emp.getClave() > 0) {
           return this.jdbcTemplate.update(UPDATE_QRY,emp.getNombre(), emp.getSueldo(), emp.getClave());  
        }else{  
          return  this.jdbcTemplate.update(INSERT_QRY,emp.getClave(), emp.getNombre(), emp.getSueldo());  
        }
    }
    public int delete(int clave){
     return jdbcTemplate.update(DELETE_QRY, clave);
    }

    private Empleado FindEmpleado(int clave) {
       return jdbcTemplate.query(FIND_QRY+clave, (ResultSet rs) -> {
            if (rs.next()) {
                Empleado emp = new Empleado();
                emp.setClave(rs.getInt(1));
                emp.setNombre(rs.getString(2));
                emp.setSueldo(rs.getInt(3));
                return emp;
            }
            return null;
        });
    }
    
    
    
   
}
