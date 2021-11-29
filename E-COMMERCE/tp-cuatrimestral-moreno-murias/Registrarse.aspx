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
                                <asp:TextBox type="text" class="form-control" runat="server" ID="txtNombreReg" MaxLength="20"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionNombreReg" runat="server" ControlToValidate="txtNombreReg" ErrorMessage="*Ingrese Sólo Letras" ForeColor="Red" ValidationExpression="^[A-Za-z]*$"></asp:RegularExpressionValidator>

                            </div>
                            <div class="form-group col-md-6">
                                <label for="inputApellido">Apellido</label>
                                <asp:TextBox type="text" class="form-control" runat="server" ID="txtApellidoReg" MaxLength="20"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionApellidoReg" runat="server" ControlToValidate="txtApellidoReg" ErrorMessage="*Ingrese Sólo Letras" ForeColor="Red" ValidationExpression="^[A-Za-z]*$"></asp:RegularExpressionValidator>
                            </div>
                        </div>

                        <div class="form-row">

                            <div class="form-group col-md-6">
                                <label for="inputEmail4">Email</label>
                                <asp:TextBox type="email" class="form-control" runat="server" ID="txtEmailReg"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionEmailReg" runat="server" ControlToValidate="txtEmailReg" ErrorMessage="*Formato de Email no válido" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>

                            </div>
                            <div class="form-group col-md-6">
                                <label for="inputPassword4">Contraseña</label>
                                <asp:TextBox type="password" class="form-control" runat="server" ID="txtPasswordReg" MaxLength="50"></asp:TextBox>
                            </div>

                        </div>
                        <div class="form-group">
                            <label for="inputDNI">DNI</label>
                            <asp:TextBox type="text" class="form-control" runat="server" ID="txtDniReg" MaxLength="8"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionDniReg" runat="server" ControlToValidate="txtDniReg" ErrorMessage="*Ingrese Valores Numericos" ForeColor="Red" ValidationExpression="^[0-9]*"></asp:RegularExpressionValidator>
                        </div>
                        <div class="form-group">
                            <label for="inputTelefono">Teléfono</label>
                            <asp:TextBox type="text" class="form-control" runat="server" ID="txtTelefonoReg" MaxLength="20"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionTelefonoReg" runat="server" ControlToValidate="txtTelefonoReg" ErrorMessage="*Ingrese Valores Numericos" ForeColor="Red" ValidationExpression="^[0-9]*"></asp:RegularExpressionValidator>
                        </div>

                        <asp:Button ID="btnRegistrarse" runat="server" type="submit" CssClass="btn btn-danger float-right" Style="width: 100%" Text="Registrarme" OnClick="btnRegistrarse_Click"></asp:Button>
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
    </form>
</body>
</html>
