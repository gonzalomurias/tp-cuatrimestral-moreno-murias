<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdministrarPedidos.aspx.cs" Inherits="tp_cuatrimestral_moreno_murias.AdministrarPedidos" EnableEventValidation="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous" />
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    <title>Administrar Pedidos</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="row mt-4">
                <div class="col-12">
                    <h5>Panel</h5>
                    <div>
                        <asp:Button ID="btnVolver" runat="server" CssClass="btn btn-dark float-right" Text="Volver" OnClick="btnVolver_Click"></asp:Button>
                        <h3>Administrar pedidos</h3>
                    </div>
                    <hr />


                    <div class="card shadow mb-4">

                        <div class="card-header py-3">
                            <br />
                            <div class="card-body">
                                <div class="table-responsive">


                                    <asp:GridView runat="server" ID="gvList" CssClass="table table-bordered dataTable1" Width="100%" AutoGenerateColumns="false">
                                        <Columns>
                                            <asp:BoundField DataField="ID" HeaderText="PEDIDO N°" />
                                            <asp:BoundField DataField="User.Email" HeaderText="USUARIO" />
                                            <asp:BoundField DataField="Total" HeaderText="TOTAL" />
                                            <asp:BoundField DataField="FechaPedido" HeaderText="FECHA" />
                                            <asp:TemplateField HeaderText="ESTADO">
                                                <ItemTemplate>
                                                    <%# Boolean.Parse(Eval("Despachado").ToString()) ? "DESPACHADO" : "EN PREPARACIÓN" %>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="180px" HeaderText="DETALLE">
                                                <ItemTemplate>
                                                    <asp:Button ID="btnDetallePedido" runat="server" Text="DETALLE" CssClass="btn btn-danger" CommandArgument='<%# Eval("ID") %>' OnClick="btnDetallePedido_Click" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="180px" HeaderText="DESPACHAR">
                                                <ItemTemplate>
                                                    <asp:Button ID="btn_Despachar" runat="server" Text="DESPACHAR" CssClass="btn btn-danger" CommandArgument='<%# Eval("ID") %>' CommandName="Delete" OnClick="btn_Despachar_Click" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>

                                    <asp:Label runat="server" ID="lblSinPedidos" Visible="false">No se encontraron pedidos.</asp:Label>

                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>

    </form>
</body>
</html>
