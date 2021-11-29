<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Detalle.aspx.cs" Inherits="tp_cuatrimestral_moreno_murias.Detalle" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
   <div class="container">
        <div class="row">
        <div class="col-6">
            <img src="<%: Session["Url_Imagen"].ToString() %>" style="border-radius:20px; width:500px">

        </div>
             
        <div class="col-6">
            <h2 runat="server" ID="NombreDetalle" style="color:white"/>
            <p runat="server" ID="DescripcionDetalle" style="color:grey" />
            <hr style="color:white"/>
            <div style="display:flex; flex-direction:row; margin-top: 20px;">
            <h3>$ </h3>
            <h3 runat="server" ID="PrecioDetalle" style="color:white"/>
            </div>
            <asp:UpdatePanel runat="server">
            <ContentTemplate>
            <div style="display:flex; flex-direction:row; margin-top: 20px;">
            <p style="color:grey">Seleccione Talle</p> 
            <asp:DropDownList runat="server" ID="ddlTalles" AutoPostBack="true" OnSelectedIndexChanged="ddlTalles_SelectedIndexChanged" CssClass="btn btn-outline-light dropdown-toogle" style="text-align:left;margin-left: 20px" AppendDataBoundItems="true">
              <asp:ListItem Value="0">Elegir</asp:ListItem>
            </asp:DropDownList>
            </div>

            <div style="display:flex; flex-direction:row; margin-top:50px;">
                <img src="https://img.icons8.com/ios-glyphs/30/ffffff/shopping-cart--v1.png" style=" margin-right:20px;"/>
            <asp:Button Text="AÑADIR AL CARRITO" ID="btnAddCarrito" OnClick="btnAddCarrito_Click" style="width:500px;" runat="server" CssClass="btn btn-danger"/>
            </div>
                </ContentTemplate>
            </asp:UpdatePanel>

            
            
             


        </div>
           
        </div>
    </div>



</asp:Content>
