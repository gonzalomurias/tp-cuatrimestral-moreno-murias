<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contacto.aspx.cs" Inherits="tp_cuatrimestral_moreno_murias.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container">
        <div class="row">
            <div class="col-3"></div>
            <div class="col-6">
                <div style="margin-top: 1%;">
                    <h3 style="color: white;">Envianos tu mensaje</h3>
                    <p style="color: grey;">Completá los datos a continuación </p>


                    <div class="form-row">

                        <div class="form-group col-md-6">
                            <label for="inputNombre">Nombre</label>
                            <asp:TextBox type="text" class="form-control" onkeypress="validLetras()" runat="server" ID="txtNombreReg" MaxLength="20"></asp:TextBox>

                        </div>
                        <div class="form-group col-md-6">
                            <label for="inputApellido">Apellido</label>
                            <asp:TextBox type="text" class="form-control" onkeypress="validLetras2()" runat="server" ID="txtApellidoReg" MaxLength="20"></asp:TextBox>
                        </div>
                    </div>

                    <div class="form-row">

                        <div class="form-group col-md-6">
                            <label for="inputEmail4">Email</label>
                            <asp:TextBox type="email" class="form-control" runat="server" ID="txtEmailReg"></asp:TextBox>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="inputTelefono">Teléfono</label>
                            <asp:TextBox type="text" class="form-control" onkeydown="return validNumericos2(event)" runat="server" ID="txtTelefonoReg" MaxLength="20"></asp:TextBox>
                        </div>

                    </div>

                    <div class="form-group">
                        <label for="inputMensaje">Mensaje</label>
                        <asp:TextBox runat="server" class="form-control" ID="txtMensaje" textMode="multiline"></asp:TextBox>
                    </div>


                </div>

            </div>

            <div class="col-7" align="center">
                <asp:Button class="form-group col-md-7" ID="Button1" runat="server" type="submit" CssClass="btn btn-danger float-right" Style="width: 30%" Text="Enviar" OnClientClick="return validar()" OnClick="btnEnviar_Click"></asp:Button>
            </div>

            <div class="modal fade" id="confirmacionEnvio" tabindex="-1" role="dialog" aria-labelledby="confirmacionEnvio2" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="confirmacionEnvio2" style="color: black">Se ha enviado tu mensaje! Te contestaremos dentro de las 48hs hábiles. </h5>
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
        function openModalEnviarMensaje() {
            $('#confirmacionEnvio').modal('show');
            
        }
    </script>
    <script>
        function validar() {
            var nombre = document.getElementById("<% = txtNombreReg.ClientID %>").value;
            var apellido = document.getElementById("<% = txtApellidoReg.ClientID %>").value;
            var email = document.getElementById("<% = txtEmailReg.ClientID %>").value;
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

</asp:Content>
