<%@ Page Title="QuickStrike" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="tp_cuatrimestral_moreno_murias._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">


    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <a href="Tienda.aspx">
                    <img src="http://drive.google.com/uc?export=view&id=19cIhYTD4dL_CMvKXQPkKEJUq1XzDKJeo" class="d-block w-100" alt="...">
                </a>
            </div>
            <div class="carousel-item">
                <a href="Tienda.aspx?search=FORUM">
                    <img src="https://sevensport.vteximg.com.br/arquivos/ids/420407/FORUM159.png?v=637673237591270000" class="d-block w-100" alt="...">
                </a>
            </div>
            <div class="carousel-item">
                <a href="Tienda.aspx?search=PUMA">
                    <img src="https://sevensport.vteximg.com.br/arquivos/ids/445373/Banner%20Gloaming.png?v=637728475088470000" class="d-block w-100" alt="...">
                </a>
            </div>
        </div>

    </div>
    <div style="margin-top: 20px; display: flex; flex-direction: row; flex-wrap: wrap;">

        <a href="Tienda.aspx?marca=CONVERSE">
            <img src="https://i.ibb.co/MGJ0KpW/Converse.jpg" style="width: 690px;" alt="Alternate Text" />
        </a>
        <a href="Tienda.aspx?marca=VANS">
            <img src="Https://i.ibb.co/FWsPWBd/6gop.gif" style="margin-left: 15px; width: 435px;" alt="Alternate Text" /></a>

    </div>
    <div style="display: flex; justify-content: center; margin-top: 20px; margin-bottom: 20px;">
        <h1>PRODUCTOS DESTACADOS</h1>
    </div>

    <div style="display: flex; flex-direction: row; flex-wrap: wrap; justify-content: center;">
        <% foreach (var producto in listaProductos.Take(5))
            {
        %>
        <a href="Detalle.aspx?id=<%:producto.ID %>" style="color: black;">
            <div class="card" style="width: 12rem; height: 23rem; border: solid 2px black; padding: 10px; margin: 10px; border-color: red; border-radius: 10px">
                <img src="<%: producto.UrlImagen %>" class="card-img-top" alt="...">
                <div class="card-body" style="margin-bottom: 10px">
                    <h6 align="center" class="card-title"><%: producto.Nombre %></h6>
                </div>

                <div>
                    <h6 align="center" class="card-text" style="margin-top: 10px">$ <%: producto.Precio.ToString("N2") %></h6>
                </div>
                <h6 class="card-text" style="padding: 10px; font-weight: 700; background-color: red; border: solid 1px red; border-radius: 25px; margin-top: 35px;" align="center">COMPRAR</h6>
            </div>
        </a>
        <%
            }
        %>
    </div>

    <div style="margin-top: 20px;">
        <a href="https://www.instagram.com/quickstrikestore">
            <img src="http://drive.google.com/uc?export=view&id=19JDcy4TLzl4Hh2haZmhZxaqb-KNWVU_9" style="width: 100%" alt="Alternate Text" /></a>

    </div>

</asp:Content>
