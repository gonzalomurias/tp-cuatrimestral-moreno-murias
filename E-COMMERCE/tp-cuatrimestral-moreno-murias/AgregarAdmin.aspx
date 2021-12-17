<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AgregarAdmin.aspx.cs" Inherits="tp_cuatrimestral_moreno_murias.AgregarAdmin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Agregar Admin</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous" />
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="row mt-4">
                <div class="col-1"></div>
                <div class="col-10">
                    <h5>Panel</h5>
                    <div>
                        <asp:Button ID="btnVolver" runat="server" CssClass="btn btn-dark float-right" Text="Volver" OnClick="btnVolver_Click"></asp:Button>
                        <h3>Agregar un Usuario Administrador</h3>
                    </div>
                    <hr />
                    <div align="center">
                    <div class="form-group col-md-6" align="left">
                        <label for="inputNombre">Nombre</label>
                        <asp:TextBox type="text" class="form-control" onkeypress="validLetras()" runat="server" ID="txtNombreReg" MaxLength="20"></asp:TextBox>
                    </div>
                                            
                    <div class="form-group col-md-6" align="left">
                        <label for="inputApellido">Apellido</label>
                        <asp:TextBox type="text" class="form-control" onkeypress="validLetras2()" runat="server" ID="txtApellidoReg" MaxLength="20"></asp:TextBox>
                    </div>

                    <div class="form-group col-md-6" align="left">
                        <label for="inputEmail4">Email</label>
                        <asp:TextBox type="email" class="form-control" runat="server" ID="txtEmailReg"></asp:TextBox>

                    </div>
                    <div class="form-group col-md-6" align="left">
                        <label for="inputPassword4">Contraseña</label>
                        <asp:TextBox type="password" class="form-control" runat="server" ID="txtPasswordReg" MaxLength="50"></asp:TextBox>
                    </div>


                    <div class="form-group col-md-6" align="left">
                        <label for="inputDNI">DNI</label>
                        <asp:TextBox type="text" class="form-control" onkeydown="return validNumericos(event)" runat="server" ID="txtDniReg" MaxLength="8"></asp:TextBox>
                    </div>
                    <div class="form-group col-md-6" align="left">
                        <label for="inputTelefono">Teléfono</label>
                        <asp:TextBox type="text" class="form-control" onkeydown="return validNumericos2(event)" runat="server" ID="txtTelefonoReg" MaxLength="20"></asp:TextBox>

                    </div>

                        </div>
                    <div class="form-group col-md-9">
                            <asp:Button Text="Aceptar" ID="Button3" OnClientClick="return validar()" OnClick="btnAceptar_Click" runat="server" CssClass="btn btn-dark float-right" />
                        </div>

                </div>


            </div>
            <div class="modal fade" id="confirmacionAgregar" tabindex="-1" role="dialog" aria-labelledby="confirmacionAgregar2" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="confirmacionAgregar2">El usuario administrador ha sido agregado con éxito! </h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-1"></div>
        </div>



        <script type="text/javascript">
            function openModalAgregar() {
                $('#confirmacionAgregar').modal('show');
                $('#confirmacionAgregar').on('hidden.bs.modal', function () {
                    window.location.href = "AgregarAdmin.aspx"
                })
            }
        </script>

        <script>
            function validar() {
                var nombre = document.getElementById("<% = txtNombreReg.ClientID %>").value;
                var apellido = document.getElementById("<% = txtApellidoReg.ClientID %>").value;
                var email = document.getElementById("<% = txtEmailReg.ClientID %>").value;
                var pass = document.getElementById("<% = txtPasswordReg.ClientID %>").value;
                var dni = document.getElementById("<% = txtDniReg.ClientID %>").value;
                var tel = document.getElementById("<% = txtTelefonoReg.ClientID %>").value;

                var valido = true;

                if (nombre === "") {
                    $("#<% = txtNombreReg.ClientID %>").removeClass("is-valid");
                    $("#<% = txtNombreReg.ClientID %>").addClass("is-invalid");
                    valido = false;
                }
                else {
                    $("#<% = txtNombreReg.ClientID %>").removeClass("is-invalid");
                    $("#<% = txtNombreReg.ClientID %>").addClass("is-valid");
                }

                if (apellido === "") {
                    $("#<% = txtApellidoReg.ClientID %>").removeClass("is-valid");
                    $("#<% = txtApellidoReg.ClientID %>").addClass("is-invalid");
                    valido = false;
                }
                else {
                    $("#<% = txtApellidoReg.ClientID %>").removeClass("is-invalid");
                    $("#<% = txtApellidoReg.ClientID %>").addClass("is-valid");
                }

                if (email === "") {
                    $("#<% = txtEmailReg.ClientID %>").removeClass("is-valid");
                    $("#<% = txtEmailReg.ClientID %>").addClass("is-invalid");
                    valido = false;
                }
                else {
                    $("#<% = txtEmailReg.ClientID %>").removeClass("is-invalid");
                    $("#<% = txtEmailReg.ClientID %>").addClass("is-valid");
                }

                if (pass === "") {
                    $("#<% = txtPasswordReg.ClientID %>").removeClass("is-valid");
                    $("#<% = txtPasswordReg.ClientID %>").addClass("is-invalid");
                    valido = false;
                }
                else {
                    $("#<% = txtPasswordReg.ClientID %>").removeClass("is-invalid");
                    $("#<% = txtPasswordReg.ClientID %>").addClass("is-valid");
                }

                if (dni === "") {
                    $("#<% = txtDniReg.ClientID %>").removeClass("is-valid");
                    $("#<% = txtDniReg.ClientID %>").addClass("is-invalid");
                    valido = false;
                }
                else {
                    $("#<% = txtDniReg.ClientID %>").removeClass("is-invalid");
                    $("#<% = txtDniReg.ClientID %>").addClass("is-valid");
                }

                if (tel === "") {
                    $("#<% = txtTelefonoReg.ClientID %>").removeClass("is-valid");
                    $("#<% = txtTelefonoReg.ClientID %>").addClass("is-invalid");
                    valido = false;
                }
                else {
                    $("#<% = txtTelefonoReg.ClientID %>").removeClass("is-invalid");
                    $("#<% = txtTelefonoReg.ClientID %>").addClass("is-valid");
                }


                if (!valido) {
                    return false;
                }
            }

        </script>

        <script>
            function validNumericos(evt) {
                var charCode = (evt.which) ? evt.which : event.keyCode
                if (((charCode == 8) || (charCode == 46)
                    || (charCode >= 35 && charCode <= 40)
                    || (charCode >= 48 && charCode <= 57)
                    || (charCode >= 96 && charCode <= 105))) {
                    $("#<% = txtDniReg.ClientID %>").removeClass("is-valid");
                    $("#<% = txtDniReg.ClientID %>").addClass("is-invalid");
                    return true;
                }
                else {
                    $("#<% = txtDniReg.ClientID %>").removeClass("is-invalid");
                    $("#<% = txtDniReg.ClientID %>").addClass("is-valid");
                    
                    return false;
                }
            }
        </script>ipt>

        <script>
            function validNumericos2(evt) {
                var charCode = (evt.which) ? evt.which : event.keyCode
                if (((charCode == 8) || (charCode == 46)
                    || (charCode >= 35 && charCode <= 40)
                    || (charCode >= 48 && charCode <= 57)
                    || (charCode >= 96 && charCode <= 105))) {
                    $("#<% =  txtTelefonoReg.ClientID %>").removeClass("is-valid");
                    $("#<% =  txtTelefonoReg.ClientID %>").addClass("is-invalid");
                    return true;
                }
                else {
                    $("#<% = txtTelefonoReg.ClientID %>").removeClass("is-invalid");
                    $("#<% =  txtTelefonoReg.ClientID %>").addClass("is-valid");
                    return false;
                }
            }
        </script>
        <script>

            function validLetras() {
                if ((event.keyCode != 32) && (event.keyCode < 65) || (event.keyCode > 90) && (event.keyCode < 97) || (event.keyCode > 122)) {
                    $("#<% = txtNombreReg.ClientID %>").removeClass("is-valid");
                    $("#<% = txtNombreReg.ClientID %>").addClass("is-invalid");
                    event.returnValue = false;
                }

                else {
                    $("#<% = txtNombreReg.ClientID %>").removeClass("is-invalid");
                    $("#<% = txtNombreReg.ClientID %>").addClass("is-valid");
                }
            }
        </script>

        <script>

            function validLetras2() {
                if ((event.keyCode != 32) && (event.keyCode < 65) || (event.keyCode > 90) && (event.keyCode < 97) || (event.keyCode > 122)) {
                    $("#<% = txtApellidoReg.ClientID %>").removeClass("is-valid");
                    $("#<% = txtApellidoReg.ClientID %>").addClass("is-invalid");
                    event.returnValue = false;
                }

                else {
                    $("#<% = txtApellidoReg.ClientID %>").removeClass("is-invalid");
                    $("#<% = txtApellidoReg.ClientID %>").addClass("is-valid");
                }
            }
        </script>


    </form>
</body>
</html>
