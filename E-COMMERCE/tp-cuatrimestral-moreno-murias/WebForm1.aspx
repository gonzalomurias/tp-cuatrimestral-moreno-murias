<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CheckOut.aspx.cs" Inherits="tp_cuatrimestral_moreno_murias.CheckOut" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous" />
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body>
    <form id="form1" runat="server">
       <div style="background-color:black; height:100px; display:flex; justify-content:center; align-items:center;"> <img src="https://i.ibb.co/XbcKJmP/Recurso-1.png" width="300" /></div>
       <div style="margin-top:20px; margin-left:50px;"><h2>MI COMPRA</h2></div>

        <div class="container">
        <div class="row">
        <div class="col-6">
        <div style="display: flex; flex-direction: column; float: left; margin-left: 50px; margin-top:15px;">
            <div style="display:flex; align-items:baseline;">
                 <img src="https://cdn-icons-png.flaticon.com/512/25/25694.png" style="width:20px; height:20px; margin-right:10px;" alt="Alternate Text" />
                   <p style="font-weight:600; font-size:20px;">ENVÍO</p>
                
            </div>
            <label  style="font-weight:500;">A DOMICILIO</label>          
          <div class="form-envio" style="margin-top:10px; margin-bottom:15px;"> 
            <div class="form-row">
                 <div class="form-group col-sm-9">
                     <label for="txtCalle">Calle</label>
                      <asp:TextBox runat="server" type="text" class="form-control" id="txtCalle" placeholder="Av. Cabildo 111"/>
                 </div>
                 <div class="form-group col-sm-3">
                      <label for="txtNumero">Número</label>
                       <asp:TextBox runat="server"  type="text" class="form-control" id="txtNumero"/>
                </div>
           </div>
           <div class="form-row">
                <div class="form-group col-sm-9">
                  <label for="txtCiudad">Ciudad</label>
                  <asp:TextBox runat="server"  type="text" class="form-control" id="txtCiudad"/>
                </div>
                <div class="form-group col-sm-3">
                  <label for="txtCP">C.P.</label>
                  <asp:TextBox runat="server" type="text" class="form-control" id="txtCP"/>
                </div>
          </div>
          <div class="form-row">
                <div class="form-group col-sm-6">
                   <label for="txtProvicnia">Provincia</label>
                  <asp:TextBox runat="server"  type="text" class="form-control" id="txtProvincia"/>
                </div>
                 <div class="form-group col-sm-6">
                  <label for="txtPais">País</label>
                  <asp:TextBox runat="server" type="text" class="form-control" id="txtPais"/>
                </div>
         </div>
        
              <hr />

              <div >
                 <asp:CheckBox runat="server" type="checkbox"  id="cbRetirar" AutoPostBack="true" OnCheckedChanged="customCheck1_CheckedChanged" />
                    <label  for="customCheck1"  style="font-weight:500;">RETIRO POR TIENDA - Av. Cabildo 2230</label>
                </div>

      </div>  
        
            

    </div>
    </div>
<div class="col-6">
        <div style="display: flex; flex-direction: column; float: left; margin-left: 50px; margin-top:15px; ">
            <div style="display:flex; align-items:baseline;">
                 <img src="https://cdn-icons.flaticon.com/png/512/4937/premium/4937964.png?token=exp=1639455304~hmac=9dcfd750b2b4ef2867b5eb1eb95e726f" style="width:20px; height:20px; margin-right:10px;" alt="Alternate Text" />
                   <p style="font-weight:600; font-size:20px;">PAGO</p>
                
            </div>
            <asp:DropDownList runat="server" ID="ddlFormasPago" cssClass="btn btn-outline-dark dropdown-toggle" /> 

        </div>
      
         <div style="display: flex; flex-direction: column; float: left; margin-left: 50px; margin-top:30px; ">
             <div style="display:flex; align-items:baseline;">
                 <img src="https://cdn-icons.flaticon.com/png/512/2838/premium/2838895.png?token=exp=1639457241~hmac=39fa54fe268750cb73bad35cbfbe51c2" style="width:20px; height:20px; margin-right:10px;" alt="Alternate Text" />
                   <p style="font-weight:600; font-size:20px;">RESÚMEN DE LA COMPRA</p>
                
            </div>
             
             <asp:GridView runat="server" ID="gvCarrito" CssClass="table dataTable1" Width="100%" AutoGenerateColumns="false" Style="color: black;">
        <Columns>
            <asp:BoundField DataField="ID" HeaderText="ID" Visible="false" />
            <asp:TemplateField HeaderText="Imagen">
                <ItemTemplate>
                    <asp:Image ID="Image1" runat="server" width="40px" height="40px" ImageUrl='<%# Eval("Producto.UrlImagen") %>' align="center" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Producto.Nombre" HeaderText="Nombre" />
            <asp:BoundField DataField="Talle" HeaderText="Talle" />
            <asp:BoundField DataField="Cantidad" HeaderText="Cantidad" />
            <asp:BoundField DataField="Producto.Precio" HeaderText="Precio Unitario" />
   
        </Columns>
    </asp:GridView>
             <div class="badge badge-danger" style="display: flex; justify-content: space-between; font-size: 18px; height: 30px; margin-bottom:10px;">
        <span>
            <asp:Label Text="Total" ID="lblTotal1" runat="server" />
        </span>
        <span>
            <asp:Label Text="" ID="lblTotal" runat="server" />
        </span>

              
  


        
    </div>
        
    <asp:Button runat="server" Text="CONFIRMAR COMPRA" ID="btnContinuar" CssClass="btn btn-dark" OnClientClick="return validar()"   OnClick="btnContinuar_Click" />
  
           
             </div>
        </div>
            </div>
         </div>
          
          

         <script>
        function validar() {
                var Calle = document.getElementById("<% = txtCalle.ClientID %>").value;
                var Numero = document.getElementById("<% = txtNumero.ClientID %>").value;
                var Ciudad = document.getElementById("<% = txtCiudad.ClientID %>").value;
                var CP = document.getElementById("<% = txtCP.ClientID %>").value;
                var Provincia = document.getElementById("<% = txtProvincia.ClientID %>").value;
                var Pais = document.getElementById("<% = txtPais.ClientID %>").value;
          
                var valido = true;

                if (Calle === "") {
                    $("#<% = txtCalle.ClientID %>").removeClass("is-valid");
                    $("#<% = txtCalle.ClientID %>").addClass("is-invalid");   
                    valido = false;
                }
                else {
                    $("#<% = txtCalle.ClientID %>").removeClass("is-invalid");
                    $("#<% = txtCalle.ClientID %>").addClass("is-valid");
                }

                if (Numero === "") {
                    $("#<% = txtNumero.ClientID %>").removeClass("is-valid");
                    $("#<% = txtNumero.ClientID %>").addClass("is-invalid");   
                    valido = false;
                }
                else {
                    $("#<% = txtNumero.ClientID %>").removeClass("is-invalid");
                    $("#<% = txtNumero.ClientID %>").addClass("is-valid");
                }

                if (Ciudad === "") {
                    $("#<% = txtCiudad.ClientID %>").removeClass("is-valid");
                    $("#<% = txtCiudad.ClientID %>").addClass("is-invalid");   
                    valido = false;
                }
                else {
                    $("#<% = txtCiudad.ClientID %>").removeClass("is-invalid");
                    $("#<% = txtCiudad.ClientID %>").addClass("is-valid");
                }

                if (CP === "") {
                    $("#<% = txtCP.ClientID %>").removeClass("is-valid");
                     $("#<% = txtCP.ClientID %>").addClass("is-invalid");   
                    valido = false;
                }
                else {
                    $("#<% = txtCP.ClientID %>").removeClass("is-invalid");
                     $("#<% = txtCP.ClientID %>").addClass("is-valid");
                 }

                 if (Provincia === "") {
                    $("#<% = txtProvincia.ClientID %>").removeClass("is-valid");
                     $("#<% =txtProvincia.ClientID %>").addClass("is-invalid");   
                    valido = false;
                }
                else {
                    $("#<% = txtProvincia.ClientID %>").removeClass("is-invalid");
                     $("#<% = txtProvincia.ClientID %>").addClass("is-valid");
                 }

                 if (Pais === "") {
                    $("#<% = txtPais.ClientID %>").removeClass("is-valid");
                     $("#<% = txtPais.ClientID %>").addClass("is-invalid");   
                    valido = false;
                }
                else {
                    $("#<% = txtPais.ClientID %>").removeClass("is-invalid");
                     $("#<% = txtPais.ClientID %>").addClass("is-valid");
                 }


                if (!valido) {
                    return false;
                }
            }

         </script>

        

    </form>
</body>
</html>
