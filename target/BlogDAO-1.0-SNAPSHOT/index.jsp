<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
       
    </head>
    <body>
         <style>
        .header {
            width: 30%;
            padding: 2rem;
            margin: 0 auto;
            display: flex;
            flex-direction: column; 
            justify-content: center;
            align-items: center;
            text-align: center; 
        }
        
        .header-text {
            font-weight: bold; 
            font-size: 2rem; 
        }
    </style>
</head>
<body>
    <div class="header">
        <span class="header-text">Blog de tecnología</span><br>
        <span class="header-text">Autor: Mery Huallpa Asistiri</span>
    </div>
        
        <p style="text-align: right;"><a href="Inicio?action=add" class="boton-n">Nueva Entrada</a></p>
        
        <c:forEach var="item" items="${poss}">
            <div class="post">
                <h2>${item.titulo}</h2>
                <p>Fecha: ${item.fecha}</p>
                <p>${item.contenido}</p>
                <div class="post-actions" style="text-align: right;">
                    <a href="Inicio?action=edit&id=${item.id}">Editar</a>
                    <a href="Inicio?action=delete&id=${item.id}" onclick="return (confirm('¿Estás seguro?'))">Eliminar</a>
                </div>
            </div>
                <hr>
        </c:forEach>
    </body>
</html>
