﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Detalle.aspx.cs" Inherits="tp_cuatrimestral_moreno_murias.Detalle" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   <div class="container">
        <div class="row">
        <div class="col-6">
            <img src="https://essential.vteximg.com.br/arquivos/ids/329007-1000-1000/306-6674_1.jpg?v=637284445723530000" class="img-thumbnail" alt="..." width="500px">

        </div>
             
        <div class="col-6">
            <h2 runat="server" ID="NombreDetalle" style="color:white"/>
            <p runat="server" ID="DescripcionDetalle" style="color:grey" />
            <hr style="color:white"/>
            <div style="display:flex; flex-direction:row; margin-top: 20px;">
            <h3>$ </h3>
            <h3 runat="server" ID="PrecioDetalle" style="color:white"/>
            </div>
            
            <div style="display:flex; flex-direction:row; margin-top: 20px;">
            <p style="color:grey">Seleccione Talle</p> 
            <asp:DropDownList runat="server" ID="ddlTalles" CssClass="btn btn-outline-light dropdown-toogle" style="text-align:left;margin-left: 20px">
            </asp:DropDownList>
            </div>

            <div style="display:flex; flex-direction:row; margin-top:50px;">
                <img src="https://img.icons8.com/ios-glyphs/30/ffffff/shopping-cart--v1.png" style=" margin-right:20px;"/>
            <asp:Button Text="AÑADIR AL CARRITO" ID="btnAddCarrito" OnClick="btnAddCarrito_Click" style="width:500px;" runat="server" CssClass="btn btn-danger"/>
            </div>

            
            
             


        </div>
           
        </div>
    </div>



</asp:Content>
