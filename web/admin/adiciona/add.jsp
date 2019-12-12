<%@include file="../cabecalho.jsp" %>
<div class="card">
    <div class="card-header">
        <h5 class="title">Adiciona Leil�o</h5>
    </div>
    <div class="card-body">
        <!--MODIFICAR PARA ADD-->
        <form action="UploadWS" method="POST" enctype="multipart/form-data">
            <input type="hidden" name="urldestino" value="LeilaoWS">
            <div class="row">
                <div class="col-md-12 pr-md-1">
                    <div class="form-group">
                        <label>Organizador</label>
                        <input type="text" name="txtOrganizador" required class="form-control" placeholder="Organizador" >
                    </div>
                </div>
            </div>
          <div class="row">
                <div class="col-md-12 pr-md-1">
                    <div class="form-group">
                        <label>Data</label>
                        <input type="date" name="txtData" required class="form-control" placeholder="Data" >
                    </div>
                </div>
            </div>
             <div class="row">
                <div class="col-md-12 pr-md-1">
                    <div class="form-group">
                        <label>Hor�rio</label>
                        <input type="time" name="txtHora" required class="form-control" placeholder="Horario" >
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12 pr-md-1">
                    <div class="form-group">
                        <label>Participantes</label>
                        <div class="row">
                            <c:forEach items="${participantes}" var="obj">
                            <div class="col-md-3">
                                <div class="custom-control custom-checkbox">
                                    <input value="${obj.id}" type="checkbox" class="custom-control-input" id="u${obj.id}" name="txt">
                                    <label class="custom-control-label" for="u${obj.id}">${obj.nome}</label>
                                </div> 
                            </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12 pr-md-1">
                    <div class="form-group">
                        <label>P�ginas</label>
                        <input type="text" name="txtPaginas" required class="form-control" placeholder="`P�ginas" >
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12 pr-md-1">
                    <div class="form-group">
                        <label>ISBN</label>
                        <input type="text" name="txtIsbn" required class="form-control" placeholder="ISBN" >
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12 pr-md-1">
                    <div class="form-group">
                        <label>Idioma</label>
                        <input type="text" name="txtIdioma" required class="form-control" placeholder="Idioma" >
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12 pr-md-1">
                    <div class="form-group">
                        <label>Data de Lan�amento</label>
                        <input type="date" name="txtData" required class="form-control" >
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="form-group">
                        <label>Sinopse</label>
                        <textarea name="txtSinopse" rows="4" cols="80" class="form-control" placeholder="Sinopse"></textarea>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="form-group-file">
                        <label for="file">Foto 1</label>
                        <input type="file" name="txtFoto1" required class="form-control form-control-file">
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="form-group-file">
                        <label for="file">Foto 2</label>
                        <input type="file" name="txtFoto2"  class="form-control form-control-file">
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="form-group-file">
                        <label for="file">Foto 3</label>
                        <input type="file" name="txtFoto3"  class="form-control form-control-file">
                    </div>
                </div>
            </div>
            <button class="btn btn-primary btn-round text-center" type="submit">
                <i class="tim-icons icon-cloud-upload-94"></i> Salvar
            </button>
            <a class="btn btn-primary btn-round text-center" href="UsuarioWS?acao=list">
                <i class="tim-icons icon-bullet-list-67"></i> Listar
            </a>
        </form>
    </div>

    <div class="card-footer">
        <c:if test="${msg != null}">
            <div class="alert alert-primary alert-dismissible fade show" role="alert">
                ${msg}
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <i class="tim-icons icon-simple-remove"></i>
                </button>
            </div>
        </c:if>
    </div>
</div>
</div>
<%@include file="../rodape.jsp" %>