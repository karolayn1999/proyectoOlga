<%@page import="controlador.persona"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>REGISTRO</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
        <link rel="stylesheet" href="recursos/css/estilo.css">
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script type="text/javascript" src="recursos/js/recursos.js"></script> 
    </head>
    <body>
        <%persona perso = (persona) request.getAttribute("usuario");%>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top"> 
            <a class="navbar-brand navbar-" href="index.html">
                <img src="recursos/imagen/logo mrm.png" width="200px" height="50px" class="d-inline-block align-top">
            </a>
            <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
                <div class="navbar-nav text-center ml-auto">
                    <a class="nav-item nav-link" href="index.html">INICIO</a>
                    <a class="nav-item nav-link" href="registrar.jsp">REGISTRAR</a>
                    <a class="nav-item nav-link" href="eliminar.jsp">ELIMINAR</a>
                    <a class="nav-item nav-link" href="buscar.jsp">MODIFICAR</a>
                    <form action="listar" method="post">
                        <a class="nav-item nav-link" href="listar">LISTAR</a>
                    </form>
                </div>
            </div>
        </nav>
        <div class="wrap">
            <ul class="tabs">
                <li><a href="#tab1"><span class="tab-text">PERSONAS</span></a></li>
                <li><a href="#tab2"><span class="tab-text">EMPRESAS</span></a></li>
                <li><a href="#tab3"><span class="tab-text">TRATAMIENTOS</span></a></li>
            </ul>
            <div class="secciones">
                <article id="tab1">
                    <div class="row">
                        <div class="col-sm-6">
                            <form action="modificarPersona" method="post" onsubmit="return validarRegistro();">
                                <div class="form-group">
                                    <label>No. Documento</label>
                                    <input class="form-control" type="text" name="DOCUMENTO" placeholder="Digite Documento" value="<%=perso.getDocumento()%>" readonly="readonly">
                                </div>
                                <div class="form-group">
                                    <label>Tipo Documento</label>
                                    <input class="form-control" type="text" name="TIPOD" placeholder="Digite Documento" value="<%=perso.getTipoDocumento()%>" readonly="readonly">                       
                                </div>
                                <div class="form-group">
                                    <label>Nombres</label>
                                    <input class="form-control" type="text" name="NOMBRE" placeholder="Digite Nombres" value="<%=perso.getNombre()%>" onkeypress="return soloLetras(event)">
                                </div>
                                <div class="form-group">
                                    <label>Apellidos</label>
                                    <input class="form-control" type="text" name="APELLIDO" placeholder="Digite Apellidos" value="<%=perso.getApellido()%>" onkeypress="return soloLetras(event)">
                                </div>
                                <div class="form-group">
                                    <label>Correo</label>
                                    <input class="form-control" type="text" name="CORREO" placeholder="Digite Correo" value="<%=perso.getCorreo()%>">
                                </div>
                                <div class="form-group">
                                    <label>Celular</label>
                                    <input class="form-control" type="text" name="CELULAR" placeholder="Digite Celular" value="<%=perso.getTelefono()%>" onkeypress="return soloNumeros(event)">
                                </div>
                                <div class="form-group">
                                    <label>Fecha Nacimiento</label>
                                    <input class="tcal form-control" id="fecha" type="text" name="date" placeholder="Ingrese Fecha" value="<%=perso.getFecha()%>">
                                </div>
                                <div class="form-group">
                                    <button class="btn btn-danger" type="submit">Modificar</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </article>
                <article id="tab2">
                    <div class="row">
                        <div class="col-sm-6">
                            <form action="" method="post" onsubmit="return validarRegistro();">
                                <div class="form-group">
                                    <label>NIT</label>
                                    <input class="form-control" type="text" placeholder="Digite NIT">
                                </div>
                                <div class="form-group">
                                    <label>Nombre</label>
                                    <input class="form-control" type="text" placeholder="Digite Nombre" onkeypress="return soloLetras(event)">
                                </div>
                                <div class="form-group">
                                    <label>Direccion</label>
                                    <input class="form-control" type="text" placeholder="Digite Direccion">
                                </div>
                                <div class="form-group">
                                    <label>Telefono</label>
                                    <input class="form-control" type="text" placeholder="Digite Telefono" onkeypress="return soloNumeros(event)">
                                </div>
                                <div class="form-group">
                                    <button class="btn btn-danger" type="submit">Registrar</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </article>
                <article id="tab3">
                    <div class="row">
                        <div class="col-sm-6">
                            <form action="" method="post" onsubmit="return validarRegistro();">
                                <div class="form-group">
                                    <label>ID Tratamiento</label>
                                    <input class="form-control" type="text" placeholder="Digite ID" onkeypress="return soloNumeros(event)">
                                </div>
                                <div class="form-group">
                                    <label>Nombre</label>
                                    <input class="form-control" type="text" placeholder="Digite Nombre" onkeypress="return soloLetras(event)">
                                </div>
                                <div class="form-group">
                                    <label>Duracion</label>
                                    <input class="form-control" type="text" placeholder="Digite Duracion" onkeypress="return soloNumeros(event)">
                                </div>
                                <div class="form-group">
                                    <button class="btn btn-danger" type="submit">Registrar</button>
                                </div>
                            </form>
                        </div>
                    </div>


                </article>
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>
        <script type="text/javascript" src="recursos/js/recursos.js"></script>
    </body>
</html>

