<%@ Page Title="QuickStrike" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="tp_cuatrimestral_moreno_murias._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

<div style="display:flex; flex-direction:row; flex-wrap:wrap">
    <% foreach (var producto in listaProductos) 
        { %>
        <a href="Detalle.aspx?id=<%:producto.ID %>" style="color:black;">
        <div class="card" style="width: 12rem; height: 20rem; border: solid 2px black; padding: 10px; margin:10px; border-color:red; border-radius:10px ">
          <img src="<%: producto.UrlImagen %>" class="card-img-top" alt="...">
          <div class="card-body">
            <h6 class="card-title"><%: producto.Nombre %></h6>
            
          </div>
            <h6 class="card-text" style=" padding: 10px; font-weight:700; background-color: red; border: solid 1px red; border-radius:25px; "><%: producto.Precio %></h6>
        </div>
            </a>
        <%
        }
    %>
</div>
</asp:Content>
