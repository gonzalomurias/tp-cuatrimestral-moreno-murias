<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DetallePedido.aspx.cs" Inherits="tp_cuatrimestral_moreno_murias.DetallePedido" EnableEventValidation="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <asp:GridView ID="gvDetallePedido" runat="server" CssClass="table dataTable1" style="color:white;" AutoGenerateColumns="false">
        <Columns>
            <asp:TemplateField HeaderText="Imagen">
                <ItemTemplate>
                    <asp:Image ID="Image1" runat="server" width="40px" height="40px" ImageUrl='<%# Eval("producto.Producto.UrlImagen") %>' align="center" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="producto.Producto.Nombre" HeaderText="PRODUCTO" />
            <asp:BoundField DataField="producto.Cantidad" HeaderText="CANTIDAD" />
            <asp:BoundField DataField="producto.Talle" HeaderText="TALLE" />
            <asp:BoundField DataField="producto.Producto.Precio" HeaderText="PRECIO UNITARIO" />
        </Columns>
    </asp:GridView>

</asp:Content>
