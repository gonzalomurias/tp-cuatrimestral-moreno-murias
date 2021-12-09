<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Carrito.aspx.cs" Inherits="tp_cuatrimestral_moreno_murias.Carrito" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <%--     <asp:GridView runat="server" ID="gvCarrito" CssClass="table table-bordered dataTable1" style="color:white" Width="100%" />--%>

    <asp:GridView runat="server" ID="gvCarrito" CssClass="table table-bordered dataTable1" Width="100%" AutoGenerateColumns="false" Style="color: white">
        <Columns>
            <asp:BoundField DataField="UrlImagen" HeaderText="Imagen" />
            <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
            <asp:BoundField DataField="Talle" HeaderText="Talle" />
            <asp:BoundField DataField="Precio" HeaderText="Precio" />
            <%--<asp:BoundField DataField="Cantidad" HeaderText="Cantidad" />
            <asp:BoundField DataField="Subtotal" HeaderText="Subtotal" />--%>
            <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="180px">
                <ItemTemplate>
                    <asp:ImageButton ID="iBtn_EliminarDelCarrito" runat="server" Width="30px" ImageUrl="https://cdn-icons-png.flaticon.com/512/1828/1828843.png" CommandArgument='<%# Eval("ID") %>' CommandName="Delete" OnClick="iBtn_EliminarDelCarrito_Click" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>


    <asp:Label runat="server" ID="lblCarritoVacio" Visible="false">No se encontraron productos.</asp:Label>

</asp:Content>
