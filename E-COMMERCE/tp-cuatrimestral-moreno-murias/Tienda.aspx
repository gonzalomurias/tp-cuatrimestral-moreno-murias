<%@ Page Title="Tienda" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Tienda.aspx.cs" Inherits="tp_cuatrimestral_moreno_murias.Tienda" %>

<%@ MasterType VirtualPath="~/Site.Master" %>



<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div style="display: flex; flex-direction: row; flex-wrap: wrap; float:left;">



        <div>
            <div class="widget widget-tag">
                <h5 class="widget-title">Categorías</h5>
                <div class="tag-list">
                    <%foreach (var categoria in listaCategorias)
                        {%>
                    <div style="margin-right: 100px">
                        <a href="Tienda.aspx?categoria=<%: categoria.Nombre %>" class="badge badge-danger"><%: categoria.Nombre %></a>
                    </div>

                    <% }%>
                </div>
            </div>
            <div style="margin-top: 30px">
                <div class="widget widget-tag">
                    <h5 class="widget-title">Marcas</h5>
                    <div class="tag-list">
                        <%foreach (var marca in listaMarcas)
                            {%>
                        <div style="margin-right: 100px">
                            <a href="Tienda.aspx?marca=<%: marca.Nombre %>" class="badge badge-danger"><%: marca.Nombre %></a>
                        </div>

                        <% }%>
                    </div>
                </div>
            </div>
        </div>
        </div>

        <div style="display: flex; flex-direction: row; flex-wrap: wrap;">



        <% 
            
            foreach (var producto in listaProductos)
            { %>
        <a href="Detalle.aspx?id=<%:producto.ID %>" style="color: black;">
            <div class="card" style="width: 12rem; height: 22rem; border: solid 2px black; padding: 10px; margin: 10px; border-color: red; border-radius: 10px">
                <img src="<%: producto.UrlImagen %>" class="card-img-top" alt="...">
                <div class="card-body" style="margin-bottom: 10px">
                    <h6 align="center" class="card-title"><%: producto.Nombre %></h6>
                </div>

                <div>
                    <h6 align="center" class="card-text" style="margin-top: 10px">$ <%: producto.Precio.ToString("N2") %></h6>
                </div>
                <h6 class="card-text" style="padding: 10px; font-weight: 700; background-color: red; border: solid 1px red; border-radius: 25px; margin-top: 20px;" align="center">COMPRAR</h6>
            </div>
        </a>
            
        <%
            }
        %>

            

        <asp:Label runat="server" ID="lblNoProducto" Visible="false">No se encontraron productos.</asp:Label>

    </div>
    

</asp:Content>
