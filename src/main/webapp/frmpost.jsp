

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            textarea {
                width: 300%;
                height: 100px;
            }
        </style>
    </head>
    <body>
        <h1>
            <c:if test="${pos.id == 0}">Nueva Entrada</c:if>
            <c:if test="${pos.id != 0}">Editar Post</c:if>
            </h1>
            <form action="Inicio" method="post">
                <input type="hidden" name="id" value="${pos.id}" />
            <table>
                <tr>
                    <td>Fecha:</td>
                    <td><input type="date" name="fecha" value="${pos.fecha}"/></td>
                </tr>
                <tr>
                    <td>Titulo:</td>
                    <td><input type="text" name="titulo" value="${pos.titulo}" style="width: 299%;"/></td>
                </tr>
                <tr>
                    <td>Contenido:</td>
                    <td><textarea name="contenido" rows="4" cols="20">${pos.contenido}</textarea></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" /></td>
                </tr>
            </table>
        </form>
    </body>
</html>

