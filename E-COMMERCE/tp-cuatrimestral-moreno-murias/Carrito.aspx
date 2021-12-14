﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Carrito.aspx.cs" Inherits="tp_cuatrimestral_moreno_murias.Carrito" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <%--     <asp:GridView runat="server" ID="gvCarrito" CssClass="table table-bordered dataTable1" style="color:white" Width="100%" />--%>

    <asp:GridView runat="server" ID="gvCarrito" CssClass="table dataTable1" Width="100%" AutoGenerateColumns="false" Style="color: white;">
        <Columns>
            <asp:BoundField DataField="ID" HeaderText="ID" Visible="false" />
            <asp:TemplateField HeaderText="Imagen">
                <ItemTemplate>
                    <asp:Image ID="Image1" runat="server" width="40px" height="40px" ImageUrl='<%# Eval("Producto.UrlImagen") %>' align="center" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Producto.Nombre" HeaderText="Nombre" />
            <asp:BoundField DataField="Talle" HeaderText="Talle" />
            <asp:BoundField DataField="Cantidad" HeaderText="Cantidad" />
            <asp:BoundField DataField="Producto.Precio" HeaderText="Precio Unitario" />
            <%--<asp:BoundField DataField="Subtotal" HeaderText="Subtotal" />--%>
            <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="180px">
                <ItemTemplate>
                    <asp:ImageButton ID="iBtn_EliminarDelCarrito" runat="server" Width="30px" ImageUrl="https://cdn-icons-png.flaticon.com/512/1828/1828843.png" CommandArgument='<%# Eval("ID") %>' CommandName="Delete" OnClick="iBtn_EliminarDelCarrito_Click" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>

    <%if (Session["carrito"] != null)
        { %>
    <div class="badge badge-danger" style="display: flex; justify-content: space-between; font-size: 18px; height: 30px;">
        <span>
            <asp:Label Text="Total" ID="lblTotal1" runat="server" />
        </span>
        <span>
            <asp:Label Text="" ID="lblTotal" runat="server" />
        </span>
    </div>
    <%} %>

    <div style="margin-top:10px;" align="center">
        <asp:Button runat="server" ID="btnFinalizarCompra" style="font-size:20px;" Text="FINALIZAR COMPRA" CssClass="btn btn-dark" OnClick="btnFinalizarCompra_Click" />
    </div>

    <div style="font-size: 24px;">
        <asp:Label runat="server" ID="lblCarritoVacio" Visible="false">CARRITO VACÍO</asp:Label>
    </div>


</asp:Content>
