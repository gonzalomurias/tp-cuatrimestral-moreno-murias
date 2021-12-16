<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Detalle.aspx.cs" Inherits="tp_cuatrimestral_moreno_murias.Detalle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container">
        <div class="row">
            <div class="col-6">
                <img src="<%: Session["Url_Imagen"].ToString() %>" style="border-radius: 20px; width: 500px">
            </div>

            <div class="col-6">
                <h2 runat="server" id="NombreDetalle" style="color: white" />
                <p runat="server" id="DescripcionDetalle" style="color: grey" />
                <hr style="color: white" />
                <div style="display: flex; flex-direction: row; margin-top: 20px;">
                    <h3>$ </h3>
                    <h3 runat="server" id="PrecioDetalle" style="color: white" />
                </div>
                <asp:UpdatePanel runat="server">
                    <ContentTemplate>
                        <div style="display: flex; flex-direction: row; margin-top: 20px;">
                            <p style="color: grey">Seleccione Talle</p>
                            <asp:DropDownList runat="server" ID="ddlTalles" AutoPostBack="true" OnSelectedIndexChanged="ddlTalles_SelectedIndexChanged" CssClass="btn btn-outline-light dropdown-toogle" Style="text-align: left; margin-left: 20px" AppendDataBoundItems="true">
                                <asp:ListItem Value="0">Elegir</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div style="display: flex; flex-direction: row; margin-top: 20px;">
                            <p style="color: grey">Seleccione Cantidad</p>
                            <asp:TextBox id="txtCantidad" AutoPostBack="true" OnTextChanged="txtCantidad_TextChanged" runat="server" type="number" min="0" Style="margin-left: 20px"  CssClass="btn btn-outline-light dropdown-toogle" max="20" value="0"></asp:TextBox>
                        </div>

                        <div style="display: flex; flex-direction: row; margin-top: 50px;">
                            <img src="https://img.icons8.com/ios-glyphs/30/ffffff/shopping-cart--v1.png" style="margin-right: 20px;" />
                            <asp:Button Text="AÑADIR AL CARRITO" ID="btnAddCarrito" OnClick="btnAddCarrito_Click" Style="width: 500px;" runat="server" CssClass="btn btn-danger" />
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>






            </div>

            <div class="modal fade" id="AddCarrito" tabindex="-1" role="dialog" aria-labelledby="AddCarrito2" style="color: black;" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="AddCarrito2">Agregado al carrito!  </h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <%-- <div class="modal-body">
                 <p>Agregado al carrito! </p>
            </div>--%>
                    </div>
                </div>
            </div>

             

        </div>
    </div>

    <script type="text/javascript">
        function openModalAgregado() {
            $('#AddCarrito').modal('show');
            //$('#AddCarrito').on('hidden.bs.modal', function () {
            //    window.location.href = "ModificarProducto.aspx"
            //})
        }
    </script>

    

</asp:Content>
