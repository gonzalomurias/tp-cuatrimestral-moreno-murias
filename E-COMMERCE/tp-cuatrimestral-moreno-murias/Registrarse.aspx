<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registrarse.aspx.cs" Inherits="tp_cuatrimestral_moreno_murias.Registrarse" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous" />
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    <title>Registrarse</title>
</head>
<body style="background-color:black; color:white;">
    <form id="form1" runat="server">
        <div class="container">
            <div class="row">
                <div class="col-3"></div>
                <div class="col-6">
         <div style="margin-top:10%";">
             <h3 style="color:white;">Registrarme como cliente</h3>
             <p style="color:grey;"> Completá los datos a continuación </p>
          
             
      <div class="form-row">
        
    <div class="form-group col-md-6">
      <label for="inputNombre">Nombre</label>
      <input type="text" class="form-control" id="inputNombre">
    </div>
    <div class="form-group col-md-6">
      <label for="inputApellido">Apellido</label>
      <input type="text" class="form-control" id="inputApellido">
    </div>
  </div>


        <div class="form-row">
        
    <div class="form-group col-md-6">
      <label for="inputEmail4">Email</label>
      <input type="email" class="form-control" id="inputEmail4">
    </div>
    <div class="form-group col-md-6">
      <label for="inputPassword4">Contraseña</label>
      <input type="password" class="form-control" id="inputPassword4">
    </div>
  </div>
  <div class="form-group">
    <label for="inputDNI">DNI</label>
    <input type="text" class="form-control" id="inputDNI">
  </div>
  <div class="form-group">
    <label for="inputTelefono">Teléfono</label>
    <input type="text" class="form-control" id="inputTelefono">
  </div>
             <br />
  <button type="submit" class="btn btn-danger float-right" style="width:100%">Registrarme</button>
     </div>
    </div>
     <div class="col-3"></div>
      </div>
      
    </form>
</body>
</html>
