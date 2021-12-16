<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MisCompras.aspx.cs" Inherits="tp_cuatrimestral_moreno_murias.MisCompras" EnableEventValidation="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<asp:GridView runat="server" ID="gvPedidos" CssClass="table dataTable1" Width="100%" AutoGenerateColumns="false" Style="color: white;">
    <Columns>
        <asp:BoundField DataField="ID" HeaderText="PEDIDO N°" />
        <asp:BoundField DataField="Total" HeaderText="TOTAL" />
        <asp:BoundField DataField="FechaPedido" HeaderText="FECHA" />
         <asp:TemplateField HeaderText="ESTADO">
                <ItemTemplate>
                    <%# Boolean.Parse(Eval("Despachado").ToString()) ? "DESPACHADO" : "EN PREPARACIÓN" %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:Button ID="btnDetallePedido" runat="server" Text="DETALLE" CssClass="btn btn-danger" CommandArgument='<%# Eval("ID") %>' OnClick="btnDetallePedido_Click"/>
                </ItemTemplate>
            </asp:TemplateField>
    </Columns>
</asp:GridView>

</asp:Content>
