<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomeAdmin.aspx.cs" Inherits="tp_cuatrimestral_moreno_murias.Administrador" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
        <div class="row mt-4">
        <div class="col-1"></div>
        <div class="col-10">
            <h5>Panel</h5>
           <h3>Bienvenido a tu tienda!</h3>
            <hr>

            <h6>PRODUCTOS</h6>
            <div style="display:flex; flex-direction:row; flex-wrap:wrap">
                <a href="#" style="text-decoration:none; color:dimgrey;"> 
                    <div class="card" style="width: 8rem; height: 9.5rem; border: solid 2px dimgrey; padding: 12px; margin:10px;">
                      <img src="https://cdn-icons-png.flaticon.com/512/2126/2126961.png" style="width:50px" class="card-img-top" alt="...">
                      <div class="card-body">
                        <p class="card-text" style="font-size:14px">Agregar Producto</p>
                    </div>
                       </div>
                </a>
                <a href="#" style="text-decoration:none; color:dimgrey;"> 
                    <div class="card" style="width: 8rem; height: 9.5rem; border: solid 2px dimgrey; padding: 12px; margin:10px;">
                      <img src="https://cdn-icons-png.flaticon.com/512/1159/1159633.png" style="width:50px" class="card-img-top" alt="...">
                      <div class="card-body">
                        <p class="card-text" style="font-size:14px">Editar Producto</p>
                       </div>
                      </div>
                </a>
                <a href="#" style="text-decoration:none; color:dimgrey;"> 
                    <div class="card" style="width: 8rem; height: 9.5rem; border: solid 2px dimgrey; padding: 12px; margin:10px;">
                      <img src="https://cdn-icons-png.flaticon.com/512/3096/3096673.png" style="width:50px" class="card-img-top" alt="...">
                      <div class="card-body">
                        <p class="card-text" style="font-size:14px">Eliminar Producto</p>
                       </div>
                      </div>
                </a>
                </div>

            <hr>
            
            <h6>MARCAS</h6>
                 <div style="display:flex; flex-direction:row; flex-wrap:wrap">
                <a href="#" style="text-decoration:none; color:dimgrey;"> 
                    <div class="card" style="width: 8rem; height: 9.5rem; border: solid 2px dimgrey; padding: 12px; margin:10px;">
                      <img src="https://cdn-icons-png.flaticon.com/512/1946/1946422.png" style="width:50px" class="card-img-top" alt="...">
                      <div class="card-body">
                        <p class="card-text" style="font-size:14px">Agregar Marca</p>
                    </div>
                       </div>
                </a>
                <a href="#" style="text-decoration:none; color:dimgrey;"> 
                    <div class="card" style="width: 8rem; height: 9.5rem; border: solid 2px dimgrey; padding: 12px; margin:10px;">
                      <img src="https://cdn-icons-png.flaticon.com/512/1159/1159633.png" style="width:50px" class="card-img-top" alt="...">
                      <div class="card-body">
                        <p class="card-text" style="font-size:14px">Editar Marca</p>
                       </div>
                      </div>
                </a>
                <a href="#" style="text-decoration:none; color:dimgrey;"> 
                    <div class="card" style="width: 8rem; height: 9.5rem; border: solid 2px dimgrey; padding: 12px; margin:10px;">
                      <img src="https://cdn-icons-png.flaticon.com/512/3096/3096673.png" style="width:50px" class="card-img-top" alt="...">
                      <div class="card-body">
                        <p class="card-text" style="font-size:14px">Eliminar Marca</p>
                       </div>
                      </div>
                </a>                   
              </div>
            </div>
                
        <div class="col-1"></div>
            </div>
         </div>  
        
      



    </form>
</body>
</html>
