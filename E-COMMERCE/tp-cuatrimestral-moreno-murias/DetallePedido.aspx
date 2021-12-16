<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DetallePedido.aspx.cs" Inherits="tp_cuatrimestral_moreno_murias.DetallePedido" EnableEventValidation="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <asp:GridView ID="gvDetallePedido" runat="server" CssClass="table dataTable1" style="color:white;" AutoGenerateColumns="false">
        <Columns>
            <asp:BoundField DataField="producto.Producto.Nombre" HeaderText="PRODUCTO" />
            <asp:BoundField DataField="producto.Cantidad" HeaderText="CANTIDAD" />
            <asp:BoundField DataField="producto.Talle" HeaderText="TALLE" />
            <asp:BoundField DataField="producto.Producto.Precio" HeaderText="PRECIO UNITARIO" />
        </Columns>
    </asp:GridView>

</asp:Content>
