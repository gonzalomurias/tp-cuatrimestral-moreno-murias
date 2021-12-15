<%@ Page Title="FAQ" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FAQ.aspx.cs" Inherits="tp_cuatrimestral_moreno_murias.FAQ" %>



<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server" align="center">

    <h2 align="center">PREGUNTAS Y RESPUESTAS FRECUENTES</h2>

    <div align="center">
        <div class="accordion" id="accordionExample" style="width: 50%; background-color: black; color: black;">
            <div class="card" style="background-color: black;">
                <div class="card-header" id="headingOne">
                    <h2 class="mb-0">
                        <button class="btn btn-dark btn-block text-left" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne" style="background-color: black">
                            <b>¿Cómo comprar?</b>
                        </button>
                    </h2>
                </div>

                <div id="collapseOne" class="collapse" aria-labelledby="headingOne" data-parent="#accordionExample">
                    <div class="card-body" style="color: white;">

                        <p align="left">
                            <b>1° Mirá nuestros productos:</b> Navegá el catálogo y buscá lo que más te gusta, podes refinar tu búsqueda con nuestros filtros de productos personalizados.<br />
                            <b>2° Agregá al carrito lo que más te guste:</b> Seleccioná tus productos deseados y agregalos al carrito.<br />
                            <b>3° Finalizá tu compra:</b> Una vez que hayas agregado tus productos avanzá al checkout mediante el link "Finalizar pedido" ubicado en el carrito en la parte inferior de la página.<br />
                            <b>4° Pago:</b> Completá el formulario con método de entrega y datos de facturación.
                        </p>

                    </div>
                </div>
            </div>
            <%--  --%>
            <div class="card" style="background-color: black;">
                <div class="card-header" id="headingTwo">
                    <h2 class="mb-0">
                        <button class="btn btn-dark btn-block text-left" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo" style="background-color: black">
                            <b>¿Es seguro comprar en el sitio?</b>
                        </button>
                    </h2>
                </div>

                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
                    <div class="card-body" style="color: white;">
                        <p align="left">Tus datos personales están resguardados y no serán utilizados para otros fines que no sean el de procesamiento de tu compra.</p>
                    </div>
                </div>
            </div>
            <%--  --%>
            <div class="card" style="background-color: black;">
                <div class="card-header" id="heading3">
                    <h2 class="mb-0">
                        <button class="btn btn-dark btn-block text-left" type="button" data-toggle="collapse" data-target="#collapse3" aria-expanded="true" aria-controls="collapse3" style="background-color: black">
                            <b>¿Cuáles son los medios de pago disponibles?</b>
                        </button>
                    </h2>
                </div>

                <div id="collapse3" class="collapse" aria-labelledby="heading3" data-parent="#accordionExample">
                    <div class="card-body" style="color: white;">
                        <p align="left">
                            <b>Tarjeta de crédito:</b> Aprovechá las cuotas sin interés vigentes.
                        <br />
                            <b>Mercado Pago:</b> Aplican todas las promociones disponibles en Mercado Pago.
                        </p>
                    </div>
                </div>
            </div>
            <%--  --%>
            <div class="card" style="background-color: black;">
                <div class="card-header" id="heading4">
                    <h2 class="mb-0">
                        <button class="btn btn-dark btn-block text-left" type="button" data-toggle="collapse" data-target="#collapse4" aria-expanded="true" aria-controls="collapse4" style="background-color: black">
                            <b>Envíos y retiro de pedidos</b>
                        </button>
                    </h2>
                </div>

                <div id="collapse4" class="collapse" aria-labelledby="heading4" data-parent="#accordionExample">
                    <div class="card-body" style="color: white;">
                        <p align="left">
                            Las entregas se realizan en cajas cerradas a través de empresas de correo logístico especializadas en distribución y 
                        entrega de mercaderías. También es posible retirar la mercadería desde nuestro local QuickStrike en Av. Cabildo 2230 (CABA).
                        </p>
                    </div>
                </div>
            </div>
            <%--  --%>
            <div class="card" style="background-color: black;">
                <div class="card-header" id="heading5">
                    <h2 class="mb-0">
                        <button class="btn btn-dark btn-block text-left" type="button" data-toggle="collapse" data-target="#collapse5" aria-expanded="true" aria-controls="collapse5" style="background-color: black">
                            <b>¿Qué pasa si no hay nadie para recibir mi pedido?</b>
                        </button>
                    </h2>
                </div>

                <div id="collapse5" class="collapse" aria-labelledby="heading5" data-parent="#accordionExample">
                    <div class="card-body" style="color: white;">
                        <p align="left">
                            La empresa de correos dejará un aviso de visita y volverá al día siguiente nuevamente. Si en la segunda visita que realiza la empresa de correos tampoco 
                        encuentra a ninguna persona en el domicilio indicado por el usuario, se procederá a dejar la mercadería en la sucursal de la empresa de correos más cercana 
                        al domicilio indicado. Por 5 días la mercadería quedará en la sucursal de correos, cumplido este período de tiempo, si el cliente no pasó a retirarlo se 
                        devolverá la mercadería a nuestro depósito. En este caso, el comprador debe comunicarse con ATENCION AL CLIENTE, para coordinar una nueva entrega. 
                        La nueva entrega puede tener un costo adicional por reprocesamiento.
                        </p>
                    </div>
                </div>
            </div>
            <%--  --%>
            <div class="card" style="background-color: black;">
                <div class="card-header" id="heading6">
                    <h2 class="mb-0">
                        <button class="btn btn-dark btn-block text-left" type="button" data-toggle="collapse" data-target="#collapse6" aria-expanded="true" aria-controls="collapse6" style="background-color: black">
                            <b>¿En qué días y horarios se entregan los pedidos?</b>
                        </button>
                    </h2>
                </div>

                <div id="collapse6" class="collapse" aria-labelledby="heading6" data-parent="#accordionExample">
                    <div class="card-body" style="color: white;">
                        <p align="left">
                            Las entregas de pedidos se realizan de lunes a viernes de 8:00 a 20:00. No se entregan pedidos los días domingos ni feriados, ni los días de paro de transporte.
                        </p>
                    </div>
                </div>
            </div>
            <%--  --%>
            <div class="card" style="background-color: black;">
                <div class="card-header" id="heading7">
                    <h2 class="mb-0">
                        <button class="btn btn-dark btn-block text-left" type="button" data-toggle="collapse" data-target="#collapse7" aria-expanded="true" aria-controls="collapse7" style="background-color: black">
                            <b>¿Recibiste un producto diferente al que compraste?</b>
                        </button>
                    </h2>
                </div>

                <div id="collapse7" class="collapse" aria-labelledby="heading7" data-parent="#accordionExample">
                    <div class="card-body" style="color: white;">
                        <p align="left">
                            Si recibiste un producto totalmente distinto al solicitado en tu compra online, por favor envianos un mail a
                        ventasonline@quickstrike.com.ar para iniciar el proceso de cambio.
                        </p>
                    </div>
                </div>
            </div>
            <%--  --%>
            <div class="card" style="background-color: black;">
                <div class="card-header" id="heading8">
                    <h2 class="mb-0">
                        <button class="btn btn-dark btn-block text-left" type="button" data-toggle="collapse" data-target="#collapse8" aria-expanded="true" aria-controls="collapse8" style="background-color: black">
                            <b>¿Qué pasa si el producto viene fallado?</b>
                        </button>
                    </h2>
                </div>

                <div id="collapse8" class="collapse" aria-labelledby="heading8" data-parent="#accordionExample">
                    <div class="card-body" style="color: white;">
                        <p align="left">
                            Si el producto presenta una falla de fábrica debes informarnos de tal falla enviando un mail a ventasonline@quickstrike.com.ar 
                        para guiarte con el procedimiento a seguir.
                        </p>
                    </div>
                </div>
            </div>
            <%--  --%>
            <div class="card" style="background-color: black;">
                <div class="card-header" id="heading9">
                    <h2 class="mb-0">
                        <button class="btn btn-dark btn-block text-left" type="button" data-toggle="collapse" data-target="#collapse9" aria-expanded="true" aria-controls="collapse9" style="background-color: black";>
                            <b>¿Cuál es el horario de atención al cliente?</b>
                        </button>
                    </h2>
                </div>

                <div id="collapse9" class="collapse" aria-labelledby="heading9" data-parent="#accordionExample">
                    <div class="card-body" style="color: white;">
                        <p align="left">
                            El horario de Atención al cliente es de Lunes a Viernes de 8 a 17 hs.
                        </p>
                    </div>
                </div>
            </div>
            <%--  --%>
            <div class="card" style="background-color: black;">
                <div class="card-header" id="heading10">
                    <h2 class="mb-0">
                        <button class="btn btn-dark btn-block text-left" type="button" data-toggle="collapse" data-target="#collapse10" aria-expanded="true" aria-controls="collapse10" style="background-color: black;">
                            <b>¿Cómo hago para contactarme?</b>
                        </button>
                    </h2>
                </div>

                <div id="collapse10" class="collapse" aria-labelledby="heading10" data-parent="#accordionExample">
                    <div class="card-body" style="color: white;">
                        <p align="left">
                            Puedes contactarnos a través de la dirección de correo ventasonline@quickstrike.com.ar.
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>


</asp:Content>
