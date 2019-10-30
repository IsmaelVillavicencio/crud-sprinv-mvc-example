/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import org.springframework.jdbc.datasource.DriverManagerDataSource;

/**
 *
 * @author villa
 */
class Conexion {

    public DriverManagerDataSource conectar() {
        DriverManagerDataSource nav = new DriverManagerDataSource();
        
        nav.setDriverClassName("com.mysql.jdbc.Driver");
        nav.setUrl("jdbc:mysql://localhost:3306/empleados");
        nav.setUsername("root");
        nav.setPassword("");
        
        return nav;
    }
}