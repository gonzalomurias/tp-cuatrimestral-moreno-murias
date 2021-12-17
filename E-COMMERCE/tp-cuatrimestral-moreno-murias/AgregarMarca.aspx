<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AgregarMarca.aspx.cs" Inherits="tp_cuatrimestral_moreno_murias.AgregarMarca" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Agregar Marca</title>
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
                        <asp:Button ID="btnVolver2" runat="server" CssClass="btn btn-dark float-right" Text="Volver" OnClick="btnVolver2_Click"></asp:Button>
                        <h3>Agregar una Marca</h3>
                    </div>
                    <hr />
                    <div class="form-group">
                        <label for="txtNombre">Nombre</label>
                        <asp:TextBox runat="server" ID="txtNombre" CssClass="form-control" />
                    </div>
                    <asp:Button Text="Aceptar" ID="btnAceptar2" OnClientClick="return validar()" OnClick="btnAceptar2_Click" runat="server" CssClass="btn btn-dark float-right" />
                </div>
                <div class="modal fade" id="confirmacionAgregar" tabindex="-1" role="dialog" aria-labelledby="confirmacionAgregar2" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="confirmacionAgregar2">Su marca ha sido agregada con éxito! </h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-1"></div>
            </div>
        </div>
        <script type="text/javascript">
            function openModalAgregar() {
                $('#confirmacionAgregar').modal('show');
                $('#confirmacionAgregar').on('hidden.bs.modal', function () {
                    window.location.href = "AgregarMarca.aspx"
                })
            }
        </script>

        <script>

            function validar() {
                var nombre = document.getElementById("<% = txtNombre.ClientID %>").value;
                var valido = true;

                if (nombre === "") {
                    $("#<% = txtNombre.ClientID %>").removeClass("is-valid");
                    $("#<% = txtNombre.ClientID %>").addClass("is-invalid");
                    valido = false;
                }
                else {
                    $("#<% = txtNombre.ClientID %>").removeClass("is-invalid");
                    $("#<% = txtNombre.ClientID %>").addClass("is-valid");
                }

                if (!valido) {
                    return false;
                }
            }

        </script>


    </form>
</body>
</html>
