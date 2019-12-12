
<%@include file="../cabecalho.jsp" %>
<div class="card">
    <div class="card-header">
        <h5 class="title">Edita Leilão</h5>
    </div>
    <div class="card-body">
        <!--MODIFICAR PARA ADD-->
        <form action="UploadWS" method="POST" enctype="multipart/form-data">
            <input type="hidden" name="urldestino" value="LeilaoWS">
            <div class="row">
                <div class="col-md-12 pr-md-1">
                    <div class="form-group">
                        <label>id</label>
                        <input readonly type="text" name="txtId" required class="form-control" placeholder="Leilão" value="${obj.id}">
                    </div>
                </div>
            </div>
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
                        <input type="date" name="txtData" required class="form-control" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${obj.dataleilao}"/>" >
                    </div>
                </div>
            </div>
                      <div class="row">
                <div class="col-md-12 pr-md-1">
                    <div class="form-group">
                        <label>Horário</label>
                        <input type="date" name="txtData" required class="form-control" value="<fmt:formatDate pattern="HH:mm:ss" value="${obj.hora}"/>" >
                    </div>
                </div>
            </div>
            <button class="btn btn-primary btn-round text-center" type="submit">
                <i class="tim-icons icon-cloud-upload-94"></i> Salvar
            </button>
            <a class="btn btn-primary btn-round text-center" href="AutorWS?acao=list">
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

<%@include file="../rodape.jsp" %>