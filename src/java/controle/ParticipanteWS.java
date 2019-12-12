package controle;

import dao.ParticipanteDAO;
import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Participante;

@WebServlet(name = "ParticipanteWS", urlPatterns = {"/admin/participante/ParticipanteWS"})
public class ParticipanteWS extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String acao = request.getParameter("txtAcao");
        String id= request.getParameter("txtId");
        RequestDispatcher destino;
        String pagina;
        ParticipanteDAO dao = new ParticipanteDAO();
        Participante obj;
        List<Participante> participantes;
        Boolean deucerto;
        String msg;

        switch (String.valueOf(acao)) {
            case "add":
                pagina = "add.jsp";
                break;
            case "edit":
                obj = dao.buscarPorChavePrimaria(Long.parseLong(id));
                request.setAttribute("obj", obj);
                pagina = "edit.jsp";
                break;
            case "del":
                obj = dao.buscarPorChavePrimaria(Long.parseLong(id));
                deucerto = dao.excluir(obj);
                if (deucerto) {
                    msg = obj.getNome() + " deletado com sucesso!";
                } else {
                    msg = "Problema ao excluir o participante " + obj.getNome();
                }
                participantes = dao.listar();
                request.setAttribute("msg", msg);
                request.setAttribute("lista", participantes);
                pagina = "list.jsp";
                break;
            default:
                participantes = dao.listar();
                request.setAttribute("lista", participantes);
                pagina = "list.jsp";
                break;

        }
        destino = request.getRequestDispatcher(pagina);
        destino.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
   
        Participante obj;
        ParticipanteDAO dao = new ParticipanteDAO();
        Boolean deucerto;
        String msg;
        String pagina = null;
        RequestDispatcher destino;
        List<Participante> participantes = null;

        String id = request.getParameter("txtId");
        String nome = request.getParameter("txtNome");
        String email = request.getParameter("txtEmail");
        String senha = request.getParameter("txtSenha");

        if (id != null) {
            //busca o que existe
            obj = dao.buscarPorChavePrimaria(Long.parseLong(id));
        } else {
            //cria um novo
            obj = new Participante();
        }
        obj.setNome(nome);
        obj.setEmail(email);
        obj.setSenha(senha);

        if (id != null) {
            deucerto = dao.alterar(obj);
            
            if (deucerto) {
                request.setAttribute("msg", "alterado com sucesso");
            } else {
                request.setAttribute("msg", "erro ao alterar");
            }
        } else {
            deucerto = dao.incluir(obj);
            
            if (deucerto) {
                request.setAttribute("msg", "adicionado com sucesso");
            } else {
               request.setAttribute("msg", "erro ao adicionar");
            }
            pagina= "add.jsp";
        }
        
        destino = request.getRequestDispatcher(pagina);
        destino.forward(request, response);
    }

}
