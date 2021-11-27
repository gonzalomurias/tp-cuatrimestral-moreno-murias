﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AgregarProducto.aspx.cs" Inherits="tp_cuatrimestral_moreno_murias.AgregarProducto" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"/>
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
           <h3>Agregar un producto</h3>
           <hr/>
              <div class="form-group">
                <label for="txtNombre">Nombre</label>
                <asp:TextBox runat="server" ID="txtNombre" CssClass="form-control"/>
              </div>
              <div class="form-group">
                <label for="txtDescripcion">Descripción</label>
                <asp:TextBox runat="server" ID="txtDescripcion" CssClass="form-control"/>
              </div>
                <label for="txtPrecio">Precio</label>
                <div class="input-group mb-3">
                  <div class="input-group-prepend">
                    <span class="input-group-text">$</span>
                  </div>
                  <asp:TextBox runat="server" ID="txtPrecio" CssClass="form-control"/>
                  <div class="input-group-append">
                    <span class="input-group-text">.00</span>
                  </div>
                </div>
                <div class="form-group">
                <label for="txtUrlImagen">Url Imagen</label>
                <asp:TextBox runat="server" ID="txtUrlImagen" CssClass="form-control"/>
              </div>
            
            <div style="margin-top: 20px">
            <label for="formGroupExampleInput2">Categoría</label>
            <asp:DropDownList runat="server" ID="ddlCategorias" CssClass="btn btn-outline-dark dropdown-toggle" style="text-align:left;margin-left: 20px">
            </asp:DropDownList>
            </div>
            <div style="margin-top: 20px">
            <label for="formGroupExampleInput2">Marca</label>
            <asp:DropDownList runat="server" ID="ddlMarcas" CssClass="btn btn-outline-dark dropdown-toogle" style="text-align:left;margin-left: 20px">
            </asp:DropDownList>
            </div>
            <asp:Button Text="Aceptar" ID="btnAceptar" OnClick="btnAceptar_Click" runat="server" CssClass="btn btn-dark float-right"/>
        </div>
                                        <div class="modal fade" id="confirmacionAgregar" tabindex="-1" role="dialog" aria-labelledby="confirmacionAgregar2" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="confirmacionAgregar2">Su producto ha sido agregado con éxito! </h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
        </div>
    </div>
</div>
        <div class="col-1"></div>
        </div>
        </div>
        <script type="text/javascript">
            function openModalAgregar() {
                $('#confirmacionAgregar').modal('show');
                $('#confirmacionAgregar').on('hidden.bs.modal', function () {
                    window.location.href = "AgregarProducto.aspx"
                })
            }
        </script>
    </form>
</body>
</html>
