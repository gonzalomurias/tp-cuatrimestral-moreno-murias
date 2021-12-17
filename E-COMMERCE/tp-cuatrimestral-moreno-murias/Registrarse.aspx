<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registrarse.aspx.cs" Inherits="tp_cuatrimestral_moreno_murias.Registrarse" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous" />
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    <title>Registrarse</title>
</head>
<body style="background-color: black; color: white;">
    <form id="form1" runat="server">
        <div class="container">
            <div class="row">
                <div class="col-3"></div>
                <div class="col-6">
                    <div style="margin-top: 8%;">
                        <h3 style="color: white;">Registrarme como cliente</h3>
                        <p style="color: grey;">Completá los datos a continuación </p>


                        <div class="form-row">

                            <div class="form-group col-md-6">
                                <label for="inputNombre">Nombre</label>
                                <asp:TextBox type="text" class="form-control" onkeypress="validLetras()" runat="server" ID="txtNombreReg" MaxLength="20"></asp:TextBox>

                            </div>
                            <div class="form-group col-md-6">
                                <label for="inputApellido">Apellido</label>
                                <asp:TextBox type="text" class="form-control" onkeypress="validLetras2()"  runat="server" ID="txtApellidoReg" MaxLength="20"></asp:TextBox>
                            </div>
                        </div>

                        <div class="form-row">

                            <div class="form-group col-md-6">
                                <label for="inputEmail4">Email</label>
                                <asp:TextBox type="email" class="form-control" runat="server" ID="txtEmailReg"></asp:TextBox>

                            </div>
                            <div class="form-group col-md-6">
                                <label for="inputPassword4">Contraseña</label>
                                <asp:TextBox type="password" class="form-control" runat="server" ID="txtPasswordReg" MaxLength="50"></asp:TextBox>
                            </div>

                        </div>
                        <div class="form-group">
                            <label for="inputDNI">DNI</label>
                            <asp:TextBox type="text" class="form-control" onkeydown="return validNumericos(event)" runat="server" ID="txtDniReg" MaxLength="8"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="inputTelefono">Teléfono</label>
                            <asp:TextBox type="text" class="form-control" onkeydown="return validNumericos2(event)" runat="server" ID="txtTelefonoReg" MaxLength="20"></asp:TextBox>
                        </div>

                        <asp:Button ID="btnRegistrarse" runat="server" type="submit" CssClass="btn btn-danger float-right" Style="width: 100%" Text="Registrarme" OnClientClick="return validar()" OnClick="btnRegistrarse_Click"></asp:Button>
                    </div>
                </div>
                <div class="modal fade" id="confirmacionRegistro" tabindex="-1" role="dialog" aria-labelledby="confirmacionRegistro2" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="confirmacionRegistro2" style="color: black">Se ha registrado con éxito! </h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-3"></div>
            </div>
        </div>

        <script type="text/javascript">
            function openModalRegistrarse() {
                $('#confirmacionRegistro').modal('show');
                $('#confirmacionRegistro').on('hidden.bs.modal', function () {
                    window.location.href = "Login.aspx"
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
    </script>

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
