<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ModificarProducto.aspx.cs" Inherits="tp_cuatrimestral_moreno_murias.ModificarProducto" EnableEventValidation="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous" />
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    <title>Modificar / Eliminar Producto</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="row mt-4">
                <div class="col-12">
                    <h5>Panel</h5>
                    <div>
                        <asp:Button ID="btnVolver" runat="server" CssClass="btn btn-dark float-right" Text="Volver" OnClick="btnVolver_Click"></asp:Button>
                        <h3>Modificar / Eliminar un producto</h3>
                    </div>
                    <hr />
                    

                    <div class="card shadow mb-4">
                       
                        <div class="card-header py-3">
                            <div class="form-inline my-2 my-lg-0 float-right" style="margin-right:20px;">
                                
                                <asp:textbox runat="server"  id="txtBuscar" class="form-control mr-sm-2" type="search"  aria-label="Search"/>
                    <asp:button runat="server" id="btnBuscar" class="btn btn-outline-success my-2 my-sm-0" Text="Buscar" AutoPostBack="true" OnClick="btnBuscar_Click" type="submit"></asp:button>
                            </div>
                             <br />
                            <div class="card-body">
                                <div class="table-responsive">


                                    <asp:GridView runat="server" ID="gvList" CssClass="table table-bordered dataTable1" Width="100%" AutoGenerateColumns="false">
                                        <Columns>
                                            <asp:BoundField DataField="ID" HeaderText="ID" />
                                            <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                                            <asp:BoundField DataField="Descripcion" HeaderText="Descripción" />
                                            <asp:BoundField DataField="Marca" HeaderText="Marca" />
                                            <asp:BoundField DataField="Categoria" HeaderText="Categoría" />
                                            <asp:BoundField DataField="Precio" HeaderText="Precio" />
                                            <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="180px">
                                                <ItemTemplate>
                                                    <asp:Button ID="btn_Editar" runat="server" Text="Editar" CssClass="btn btn-info" CommandArgument='<%# Eval("ID") %>' CommandName="Edit" OnClick="btn_Editar_Click" />
                                                    <asp:Button ID="btn_Eliminar" runat="server" Text="Eliminar" CssClass="btn btn-danger" CommandArgument='<%# Eval("ID") %>' CommandName="Delete" OnClick="btn_Eliminar_Click" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>

                                    <asp:label runat="server" id="lblSinProductos" Visible="false" >No se encontraron productos.</asp:label>

                                    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                        <div class="modal-dialog" role="document">
                                            
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalLabel">Modificar producto</h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">
                                                    <div class="form-group">
                                                        <label for="txtNombre">Nombre</label>
                                                        <asp:TextBox runat="server" ID="txtNombre" CssClass="form-control" />
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="txtDescripcion">Descripción</label>
                                                        <asp:TextBox runat="server" ID="txtDescripcion" CssClass="form-control" />
                                                    </div>
                                                    <label for="txtPrecio">Precio</label>
                                                    <div class="input-group mb-3">
                                                        <div class="input-group-prepend">
                                                            <span class="input-group-text">$</span>
                                                        </div>
                                                        <asp:TextBox onkeydown="return validNumericos(event)" runat="server" ID="txtPrecio" CssClass="form-control" />
                                                        <div class="input-group-append">
                                                            <span class="input-group-text">.00</span>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="txtUrlImagen">Url Imagen</label>
                                                        <asp:TextBox runat="server" ID="txtUrlImagen" CssClass="form-control" />
                                                    </div>

                                                    <div style="margin-top: 20px">
                                                        <label for="formGroupExampleInput2">Categoría</label>
                                                        <asp:DropDownList runat="server" ID="ddlCategorias" CssClass="btn btn-outline-dark dropdown-toggle" Style="text-align: left; margin-left: 20px">
                                                        </asp:DropDownList>
                                                    </div>
                                                    <div style="margin-top: 20px">
                                                        <label for="formGroupExampleInput2">Marca</label>
                                                        <asp:DropDownList runat="server" ID="ddlMarcas" CssClass="btn btn-outline-dark dropdown-toogle" Style="text-align: left; margin-left: 20px">
                                                        </asp:DropDownList>
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
                                                    <h5 class="modal-title" id="confirmacionModificacion2">Su producto ha sido modificado con éxito! </h5>
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
                                                    <p>Desea eliminar este producto?</p>
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
                                                    <h5 class="modal-title" id="confirmacionEliminacionOK2">Su producto ha sido eliminado con éxito! </h5>
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
                    window.location.href = "ModificarProducto.aspx"
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
                    window.location.href = "ModificarProducto.aspx"
                })
            }
        </script>
        <script>
         function validar() {
                var nombre = document.getElementById("<% = txtNombre.ClientID %>").value;
                var descripcion = document.getElementById("<% = txtDescripcion.ClientID %>").value;
                var precio = document.getElementById("<% = txtPrecio.ClientID %>").value;
                var imagen = document.getElementById("<% = txtUrlImagen.ClientID %>").value;
                
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

                if (descripcion === "") {
                    $("#<% = txtDescripcion.ClientID %>").removeClass("is-valid");
                    $("#<% = txtDescripcion.ClientID %>").addClass("is-invalid");   
                    valido = false;
                }
                else {
                    $("#<% = txtDescripcion.ClientID %>").removeClass("is-invalid");
                    $("#<% = txtDescripcion.ClientID %>").addClass("is-valid");
                }

                if (precio === "") {
                    $("#<% = txtPrecio.ClientID %>").removeClass("is-valid");
                    $("#<% = txtPrecio.ClientID %>").addClass("is-invalid");   
                    valido = false;
                }
                else {
                    $("#<% = txtPrecio.ClientID %>").removeClass("is-invalid");
                    $("#<% = txtPrecio.ClientID %>").addClass("is-valid");
                }

                if (imagen === "") {
                    $("#<% = txtUrlImagen.ClientID %>").removeClass("is-valid");
                     $("#<% = txtUrlImagen.ClientID %>").addClass("is-invalid");   
                    valido = false;
                }
                else {
                    $("#<% = txtUrlImagen.ClientID %>").removeClass("is-invalid");
                     $("#<% = txtUrlImagen.ClientID %>").addClass("is-valid");
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
                     $("#<% = txtPrecio.ClientID %>").removeClass("is-invalid");
                     $("#<% = txtPrecio.ClientID %>").addClass("is-valid");
                     return true;
                 }
                 else {
                     $("#<% = txtPrecio.ClientID %>").removeClass("is-valid");
                     $("#<% = txtPrecio.ClientID %>").addClass("is-invalid");
                return false;
            }
        }
    </script>


    </form>
</body>
</html>
