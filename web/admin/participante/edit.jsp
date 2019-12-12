
<%@include file="../cabecalho.jsp" %>
<div class="card">
    <div class="card-header">
        <h5 class="title">Edita Participante</h5>
    </div>
    <div class="card-body">
        <!--MODIFICAR PARA ADD-->
        <form action="ParticipanteWS" method="POST" enctype="multipart/form-data">
            <input type="hidden" name="urldestino" value="ParticipanteWS">
            <div class="row">
                <div class="col-md-12 pr-md-1">
                    <div class="form-group">
                        <label>id</label>
                        <input readonly type="text" name="txtId" required class="form-control" placeholder="Participante" value="${obj.id}">
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12 pr-md-1">
                    <div class="form-group">
                        <label>Nome</label>
                        <input type="text" name="txtNome" required class="form-control" placeholder="Nome" value="${obj.nome}" >
                    </div>
                </div>
            </div>
                <div class="row">
                <div class="col-md-12 pr-md-1">
                    <div class="form-group">
                        <label>E-mail</label>
                        <input type="email" name="txtEmail" required class="form-control" placeholder="Email" value="${obj.email}" >
                    </div>
                </div>
            </div>
                     <div class="row">
                <div class="col-md-12 pr-md-1">
                    <div class="form-group">
                        <label>Senha</label>
                        <input type="password" name="txtSenha" required class="form-control" placeholder="Senha" value="${obj.senha}">
                    </div>
                </div>
            </div>
            <button class="btn btn-primary btn-round text-center" type="submit">
                <i class="tim-icons icon-cloud-upload-94"></i> Salvar
            </button>
            <a class="btn btn-primary btn-round text-center" href="ParticipanteWS?acao=list">
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