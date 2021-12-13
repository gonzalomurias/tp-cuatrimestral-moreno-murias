<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GestionarUsuariosAdmin.aspx.cs" Inherits="tp_cuatrimestral_moreno_murias.GestionarUsuariosAdmin" EnableEventValidation="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous" />
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    <title>Modificar / Eliminar Usuario</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="row mt-4">
                <div class="col-12">
                    <h5>Panel</h5>
                    <div>
                        <asp:Button ID="btnVolver" runat="server" CssClass="btn btn-dark float-right" Text="Volver" OnClick="btnVolver_Click"></asp:Button>
                        <h3>Agregar / Eliminar Usuario</h3>
                    </div>
                    <hr />


                    <div class="card shadow mb-4">

                        <div class="card-header py-3">

                            <br />
                            <div class="card-body">
                                <div class="table-responsive">


                                    <asp:GridView runat="server" ID="gvList" CssClass="table table-bordered dataTable1" Width="100%" AutoGenerateColumns="false">
                                        <Columns>
                                            <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                                            <asp:BoundField DataField="Apellido" HeaderText="Apellido" />
                                            <asp:BoundField DataField="Email" HeaderText="Email" />
                                            <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="180px">
                                                <ItemTemplate>
                                                    <asp:Button ID="btn_Eliminar" runat="server" Text="Eliminar" CssClass="btn btn-danger" CommandArgument='<%# Eval("ID") %>' CommandName="Delete" OnClick="btn_Eliminar_Click" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>

                                    <asp:Button ID="btnAgregar" runat="server" CssClass="btn btn-dark float-right" Text="Agregar" Onclick="btnAgregar_Click1"></asp:Button>


                                    <asp:Label runat="server" ID="lblSinProductos" Visible="false">No se encontraron usuarios administradores.</asp:Label>

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
                                                    <p>Desea eliminar este usuario administrador?</p>
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
                                                    <h5 class="modal-title" id="confirmacionEliminacionOK2">El usuario ha sido eliminada con éxito! </h5>
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
                    window.location.href = "GestionarUsuariosAdmin.aspx"
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
                    window.location.href = "GestionarUsuariosAdmin.aspx"
                })
            }
        </script>



    </form>
</body>
</html>
