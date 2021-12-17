<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DetallePedido2.aspx.cs" Inherits="tp_cuatrimestral_moreno_murias.DetallePedido2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous" />
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    <title>Detalle Pedido</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="row mt-4">
                <div class="col-12">
                    <h5>Panel</h5>
                    <div>
                        <asp:Button ID="btnVolver" runat="server" CssClass="btn btn-dark float-right" Text="Volver" OnClick="btnVolver_Click"></asp:Button>
                        <h3>Detalle Pedido</h3>
                    </div>
                    <hr />


                    <div class="card shadow mb-4">

                        <div class="card-header py-3">
                            <br />
                            <div class="card-body">
                                <div class="table-responsive">


                                    <asp:GridView runat="server" ID="gvDetallePedido2" CssClass="table table-bordered dataTable1" Width="100%" AutoGenerateColumns="false">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Imagen">
                                                <ItemTemplate>
                                                    <asp:Image ID="Image1" runat="server" Width="40px" Height="40px" ImageUrl='<%# Eval("producto.Producto.UrlImagen") %>' align="center" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="producto.Producto.Nombre" HeaderText="PRODUCTO" />
                                            <asp:BoundField DataField="producto.Cantidad" HeaderText="CANTIDAD" />
                                            <asp:BoundField DataField="producto.Talle" HeaderText="TALLE" />
                                            <asp:BoundField DataField="producto.Producto.Precio" HeaderText="PRECIO UNITARIO" />
                                        </Columns>
                                    </asp:GridView>

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
