<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ModificarProducto.aspx.cs" Inherits="tp_cuatrimestral_moreno_murias.ModificarProducto" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"/>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.css"/>
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.js"></script>
<title>Modificar Producto</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="row mt-4">
        <%--<div class="col-1"></div>--%>
        <div class="col-12">
           <h5>Panel</h5>
           <h3>Modificar un producto</h3>
           <hr/>

            <script>$(document).ready(function () {
                $('.dataTable1').DataTable();
            });
            </script>

            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <div class="card-body">
                        <div class="table-responsive">
                            <asp:GridView runat="server" id="gvList" CssClass="table table-bordered dataTable1" width="100%" AutoGenerateColumns="false">
                                <Columns>
                                    <asp:BoundField DataField="ID" HeaderText="ID" />
                                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                                    <asp:BoundField DataField="Descripcion" HeaderText="Descripción" />
                                    <asp:BoundField DataField="Marca" HeaderText="Marca" />
                                    <asp:BoundField DataField="Categoria" HeaderText="Categoría" />
                                    <asp:BoundField DataField="Precio" HeaderText="Precio" />
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="150px">
                                    <ItemTemplate>
                                    <asp:Button ID="btn_Editar" runat="server" Text="Editar" CssClass="btn btn-info" CommandName="Edit"/>
                                    <asp:Button ID="btn_Eliminar" runat="server" Text="Eliminar" CssClass="btn btn-danger" CommandName="Delete"/>
                                    </ItemTemplate>                  
                                    </asp:TemplateField>      
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>
            
        </div>
<%--        <div class="col-1"></div>--%>
        </div>
        </div>
    </form>
</body>
</html>
