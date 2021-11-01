<%@ Page Title="QuickStrike" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="tp_cuatrimestral_moreno_murias._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

<div style="display:flex; flex-direction:row; flex-wrap:wrap">
    <% foreach (var producto in listaProductos) 
        { %>
        <a href="Detalle.aspx?id=<%:producto.ID %>" style="color: black;">
        <div class="card" style="width: 22rem; height: 30rem; border: solid 2px black; padding: 10px; margin:10px; ">
          <img src="<%: producto.UrlImagen %>" width="200px" class="card-img-top" alt="...">
          <div class="card-body">
            <h5 class="card-title"><%: producto.Nombre %></h5>
            <h5 class="card-text"><%: producto.Precio %></h5>
          </div>
        </div>
            </a>
        <%
        }
    %>
</div>
</asp:Content>
