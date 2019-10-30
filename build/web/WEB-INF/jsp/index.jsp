<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>


<!doctype html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <title>CRUD | SPRING MVC </title>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <style>
            @font-face {
                font-family: 'Material Icons';
                font-style: normal;
                font-weight: 400;
                src: url(https://example.com/MaterialIcons-Regular.eot); /* For IE6-8 */
                src: local('Material Icons'),
                    local('MaterialIcons-Regular'),
                    url(https://example.com/MaterialIcons-Regular.woff2) format('woff2'),
                    url(https://example.com/MaterialIcons-Regular.woff) format('woff'),
                    url(https://example.com/MaterialIcons-Regular.ttf) format('truetype');
            }
            .material-icons {
                font-family: 'Material Icons';
                font-weight: normal;
                font-style: normal;
                font-size: 24px;  /* Preferred icon size */
                display: inline-block;
                line-height: 1;
                text-transform: none;
                letter-spacing: normal;
                word-wrap: normal;
                white-space: nowrap;
                direction: ltr;

                /* Support for all WebKit browsers. */
                -webkit-font-smoothing: antialiased;
                /* Support for Safari and Chrome. */
                text-rendering: optimizeLegibility;

                /* Support for Firefox. */
                -moz-osx-font-smoothing: grayscale;

                /* Support for IE. */
                font-feature-settings: 'liga';
            }
        </style>
    </head>
    <body>
        <div class="container">  <br>
            <h4 class="display-6">Pagos</h4> <br>
            <div class="card">
                <div class="card-body">
                    <form:form method="POST" action="./save.htm" modelAttribute="empleado">
                        <div class="form-row">
                                <form:hidden path="clave" cssClass="form-control"/>
                            <div class="form-group col-md-8">
                                <label for="nombre">Nombre</label>
                                <form:input path="nombre" cssClass="form-control"/>
                            </div>
                            <div class="form-group col-md-4">
                                <label for="sueldo">Sueldo</label>
                                <form:input path="sueldo" cssClass="form-control"/>
                            </div>
                        </div>
                        <button type="submit" class="btn btn-primary float-right">Guardar</button>
                            <a href="./index.htm" class="btn btn-dark  float-right mr-2">Cancelar</a>
                    </form:form>
                </div>
            </div>
            <div class="card mt-2">
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">N. Empleado</th>
                            <th scope="col">Nombre</th>
                            <th scope="col">Sueldo</th>
                            <th scope="col" class="text-center">Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${empleados}" var="e" varStatus="loop" >
                            <tr>
                                <th scope="row">${loop.index+1}</th>
                                <td>${e.clave}</td>
                                <td>${e.nombre}</td>
                                <td>$ ${e.sueldo}</td>
                                <td class="text-center">
                                    <div class="dropdown">
                                        <button class="btn btn-secondary btn-sm dropdown-toggle" type="button" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <i class="material-icons">settings</i>
                                        </button>
                                        <div class="dropdown-menu" aria-labelledby="dropdownMenu2">
                                            <a href="./edit.htm?clave=${e.clave}" class="dropdown-item">Editar</a>
                                            <a href="./delete.htm?clave=${e.clave}" class="dropdown-item">Borrar</a>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="text-muted text-center"> <br>
                <p class="lead" style="font-size: 18px;">Este es un ejemplo CRUD (Create, Read, Update, Delete), resultado de la implementacion de Spring MVC.</p>
            </div>
        </div>

        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body>
</html>
