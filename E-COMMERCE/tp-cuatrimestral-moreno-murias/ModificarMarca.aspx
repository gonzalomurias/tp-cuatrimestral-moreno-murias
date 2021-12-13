<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ModificarMarca.aspx.cs" Inherits="tp_cuatrimestral_moreno_murias.ModificarMarca" EnableEventValidation="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous" />
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    <title>Modificar / Eliminar Marca</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="row mt-4">
                <div class="col-12">
                    <h5>Panel</h5>
                    <div>
                        <asp:Button ID="btnVolver" runat="server" CssClass="btn btn-dark float-right" Text="Volver" OnClick="btnVolver_Click"></asp:Button>
                        <h3>Modificar / Eliminar Marca</h3>
                    </div>
                    <hr />


                    <div class="card shadow mb-4">

                        <div class="card-header py-3">
                            <div class="form-inline my-2 my-lg-0 float-right" style="margin-right: 20px;">

                                <asp:TextBox runat="server" ID="txtBuscar" class="form-control mr-sm-2" type="search" aria-label="Search" />
                                <asp:Button runat="server" ID="btnBuscar" class="btn btn-outline-success my-2 my-sm-0" Text="Buscar" AutoPostBack="true" OnClick="btnBuscar_Click" type="submit"></asp:Button>
                            </div>
                            <br />
                            <div class="card-body">
                                <div class="table-responsive">


                                    <asp:GridView runat="server" ID="gvList" CssClass="table table-bordered dataTable1" Width="100%" AutoGenerateColumns="false">
                                        <Columns>
                                            <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                                            <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="180px">
                                                <ItemTemplate>
                                                    <asp:Button ID="btn_Editar" runat="server" Text="Editar" CssClass="btn btn-info" CommandArgument='<%# Eval("ID") %>' CommandName="Edit" OnClick="btn_Editar_Click"/>
                                                    <asp:Button ID="btn_Eliminar" runat="server" Text="Eliminar" CssClass="btn btn-danger" CommandArgument='<%# Eval("ID") %>' CommandName="Delete" OnClick="btn_Eliminar_Click" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>

                                    <asp:Label runat="server" ID="lblSinProductos" Visible="false">No se encontraron marcas.</asp:Label>

                                    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                        <div class="modal-dialog" role="document">

                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalLabel">Modificar marca</h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">
                                                    <div class="form-group">
                                                        <label for="txtNombre">Nombre</label>
                                                        <asp:TextBox runat="server" ID="txtNombre" CssClass="form-control" />
                                                    </div>
                                                    <asp:Button Text="Aceptar" ID="btnAceptar2" OnClientClick="return validar()" OnClick="btnAceptar2_Click" runat="server" CssClass="btn btn-dark float-right" CausesValidation="true" ValidationGroup="soloNumeros" />
                                                </div>
                                                <div class="modal-footer">
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="modal fade" id="confirmacionModificacion" tabindex="-1" role="dialog" aria-labelledby="confirmacionModificacion2" aria-hidden="true">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="confirmacionModificacion2">Su marca ha sido modificada con éxito! </h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="modal fade" id="confirmacionEliminacion" tabindex="-1">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title">Eliminar</h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">
                                                    <p>Desea eliminar esta marca?</p>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                                                    <asp:Button ID="btnAceptarEliminacion" runat="server" Text="Aceptar" CssClass="btn btn-info" CommandArgument='<%# Eval("ID") %>' CommandName="Aceptar" OnClick="btnAceptarEliminacion_Click" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="modal fade" id="confirmacionEliminacionOK" tabindex="-1" role="dialog" aria-labelledby="confirmacionEliminacionOK2" aria-hidden="true">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="confirmacionEliminacionOK2">Su marca ha sido eliminada con éxito! </h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <script type="text/javascript">
            function openModal() {
                $('#exampleModal').modal('show');
            }


        </script>

        <script type="text/javascript">
            function openModal2() {
                $('#confirmacionModificacion').modal('show');
                $('#confirmacionModificacion').on('hidden.bs.modal', function () {
                    window.location.href = "ModificarMarca.aspx"
                })

            }

        </script>

        <script type="text/javascript">
            function openModalEliminacion() {
                $('#confirmacionEliminacion').modal('show');

            }


        </script>

        <script type="text/javascript">
            function openModalEliminacionOK() {
                $('#confirmacionEliminacionOK').modal('show');
                $('#confirmacionEliminacionOK').on('hidden.bs.modal', function () {
                    window.location.href = "ModificarMarca.aspx"
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
