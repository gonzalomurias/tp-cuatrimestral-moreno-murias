<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GestionarStock.aspx.cs" Inherits="tp_cuatrimestral_moreno_murias.GestionarStock" EnableEventValidation="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous" />
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    <title>Gestionar Stock</title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="container">
            <div class="row mt-4">
                <div class="col-12">
                    <h5>Panel</h5>
                    <div>
                    <asp:Button id="btnVolver" runat="server" CssClass="btn btn-dark float-right" Text="Volver" OnClick="btnVolver_Click"></asp:Button>
                    <h3>Gestionar Stock</h3>
                    </div>
                        <hr />
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                             <div class="form-inline my-2 my-lg-0 float-right" style="margin-right:20px;">
                                
                                <asp:textbox runat="server"  id="txtBuscar" class="form-control mr-sm-2" type="search"  aria-label="Search"/>
                                 <asp:button runat="server" id="btnBuscar" class="btn btn-outline-success my-2 my-sm-0" Text="Buscar" AutoPostBack="true" OnClick="btnBuscar_Click" type="submit"></asp:button>
                            </div>
                             <br />
                            <div class="card-body">
                                <div class="table-responsive">
                                    <asp:GridView runat="server" ID="gvList" CssClass="table table-bordered dataTable1" Width="100%" AutoGenerateColumns="false">
                                        <Columns>
                                            <asp:BoundField DataField="ID" HeaderText="ID" />
                                            <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                                            <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="180px">
                                                <ItemTemplate>
                                                    <asp:Button ID="btn_Stock" runat="server" Text="Gestionar Stock" CssClass="btn btn-info" CommandArgument='<%# Eval("ID") %>' CommandName="Stock" OnClick="btn_Stock_Click" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                    <asp:label runat="server" id="lblSinProductos" Visible="false" >No se encontraron productos.</asp:label>

                                    <div class="modal fade" id="modalStock" tabindex="-1" role="dialog" aria-labelledby="modalStockLabel" aria-hidden="true">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="modalStockLabel">Gestionar stock</h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">
                                                    <div class="form-group">

                                                        <label for="txtNombreStock">Nombre Producto</label>
                                                        <asp:TextBox runat="server" ID="txtNombreStock" CssClass="form-control" />
                                                    </div>
                                                    <asp:UpdatePanel runat="server">
                                                        <ContentTemplate>
                                                            <div style="margin-top: 20px">
                                                                <label for="formGroupExampleInput2">Talle</label>
                                                                <asp:DropDownList runat="server" ID="ddlTallesStock" CssClass="btn btn-outline-dark dropdown-toogle" AutoPostBack="true" OnSelectedIndexChanged="ddlTallesStock_SelectedIndexChanged" Style="text-align: left; margin-left: 20px" Height="35px">
                                                                </asp:DropDownList>
                                                            </div>


                                                            <div class="form-group" style="display: flex; flex-direction: row; margin-top: 20px;">
                                                                <label for="txtStockActual" style="margin-right: 10px">Stock Actual</label>
                                                                <asp:TextBox runat="server" ID="txtStockActual" CssClass="form-control" Width="20%" Height="35px" Style="margin-right: 10px" />
                                                                <label for="txtStockNuevo" style="margin-right: 10px">Nuevo Stock</label>
                                                                <asp:TextBox onkeydown="return validNumericos(event)"  runat="server" ID="txtStockNuevo" CssClass="form-control" Width="20%" Height="35px" />
                                                            </div>

                                                        </ContentTemplate>

                                                    </asp:UpdatePanel>


                                                    <asp:Button Text="Aceptar" ID="btnAceptarStock" OnClick="btnAceptarStock_Click" runat="server" CssClass="btn btn-dark float-right" />
                                                </div>
                                                <div class="modal-footer">
                                                </div>

                                            </div>
                                        </div>
                                    </div>

                                    <div class="modal fade" id="confirmacionStock" tabindex="-1" role="dialog" aria-labelledby="confirmacionStock2" aria-hidden="true">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="confirmacionStock2">Stock actualizado! </h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
            </div>
            </div>
        </div>

        <script type="text/javascript">
            function openModalStock() {
                $('#modalStock').modal('show');
                $('#modalStock').on('hidden.bs.modal', function () {
                    window.location.href = "GestionarStock.aspx"
                })

            }
        </script>

        <script type="text/javascript">
            function openModalconfStock() {
                $('#confirmacionStock').modal('show');

            }
        </script>

        <script>
            function validNumericos(evt) {
                var charCode = (evt.which) ? evt.which : event.keyCode
                if (((charCode == 8) || (charCode == 46)
                    || (charCode >= 35 && charCode <= 40)
                    || (charCode >= 48 && charCode <= 57)
                    || (charCode >= 96 && charCode <= 105))) {
                    $("#<% = txtStockNuevo.ClientID %>").removeClass("is-invalid");
                     $("#<% = txtStockNuevo.ClientID %>").addClass("is-valid");
                     return true;
                 }
                 else {
                     $("#<% = txtStockNuevo.ClientID %>").removeClass("is-valid");
                     $("#<% = txtStockNuevo.ClientID %>").addClass("is-invalid");
                    return false;
                }
            }
        </script>


    </form>
</body>
</html>
