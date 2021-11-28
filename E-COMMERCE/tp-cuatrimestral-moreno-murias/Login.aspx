<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="tp_cuatrimestral_moreno_murias.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous" />
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>


    <title>Iniciar Sesion</title>
</head>
<body style="background-color:black; color:white;">
    <form>
        <div class="container">
            <div class="row ">

                <div class="col-4"></div>
                <div class="col-4">
                   <div style="margin-top:40%;">
                       <img src="https://i.ibb.co/XbcKJmP/Recurso-1.png" alt="Logo" style="width:350px;"/>
                   </div> 
  
    <div style="background-color:#e30613; padding:20px; margin-top:30px; width:350px;">

        <div class="form-group"  >
    <label for="exampleInputEmail1" style="color:white;">Email</label>
    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1" style="color:white;">Contraseña</label>
    <input type="password" class="form-control" id="exampleInputPassword1">
  </div>
  
  <button type="submit" class="btn" style="background-color:black; color:white; width:100%;">Iniciar Sesión</button>

    </div>
     
  </div>
  <div class="col-4"></div>
    </div>
    </div>
</form>
</body>
</html>
