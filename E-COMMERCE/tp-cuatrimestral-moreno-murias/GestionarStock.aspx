<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GestionarStock.aspx.cs" Inherits="tp_cuatrimestral_moreno_murias.GestionarStock" EnableEventValidation="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"/>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<title>Gestionar Stock</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
        <div class="row mt-4">
        <div class="col-12">
           <h5>Panel</h5>
           <h3>Gestionar Stock</h3>
           <hr/>
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <div class="card-body">
                        <div class="table-responsive">
                            <asp:GridView runat="server" id="gvList" CssClass="table table-bordered dataTable1" width="100%" AutoGenerateColumns="false">
                                <Columns>
                                    <asp:BoundField DataField="ID" HeaderText="ID" />
                                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center"  HeaderStyle-Width="180px">
                                    <ItemTemplate>
                                    <asp:Button ID="btn_Stock" runat="server" Text="Agregar o quitar Stock" CssClass="btn btn-info" CommandArgument='<%# Eval("ID") %>' CommandName="Stock" OnClick="btn_Stock_Click" />
                                   </ItemTemplate>                  
                                    </asp:TemplateField>      
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