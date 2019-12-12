package controle;

import dao.LeitaoDAO;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Leilao;
import util.FormataData;

@WebServlet(name = "LeilaoWS", urlPatterns = {"/admin/leilao/LeilaoWS"})
public class LeilaoWS extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String acao = request.getParameter("txtAcao");
        RequestDispatcher destino;
        String pagina;
        LeitaoDAO dao = new LeitaoDAO();
        Leilao obj;
        List<Leilao> leiloes;
        Boolean deucerto;
        String msg;
        
        switch (String.valueOf(acao)) {
            case "add":
                pagina = "add.jsp";
                break;
            case "edit":
                obj = dao.buscarPorChavePrimaria(Long.parseLong(request.getParameter("txtId")));
                request.setAttribute("obj", obj);
                pagina = "edit.jsp";
                break;
            case "del":
                obj = dao.buscarPorChavePrimaria(Long.parseLong(request.getParameter("txtId")));
                deucerto = dao.excluir(obj);
                if (deucerto) {
                    msg = obj.getOrganizador() + " deletado com sucesso!";
                } else {
                    msg = "Problema ao excluir o leilao " + obj.getOrganizador();
                }
                leiloes = dao.listar();
                request.setAttribute("msg", msg);
                request.setAttribute("lista", leiloes);
                pagina = "list.jsp";
                break;
            default:
                leiloes = dao.listar();
                request.setAttribute("lista", leiloes);
                pagina = "list.jsp";
                break;
         }
        destino = request.getRequestDispatcher(pagina);
        destino.forward(request, response);
    }
 @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Leilao obj;
        LeitaoDAO dao = new LeitaoDAO();
        Boolean deucerto;
        String msg;
        String pagina;
        RequestDispatcher destino;
        List<Leilao> leiloes = null;

        String id = request.getParameter("txtId");
        String organizador = request.getParameter("txtOrganizador");
        String data = request.getParameter("txtData");
        String hora = request.getParameter("txtHora");

        Date dataleilao = FormataData.formata(data, "yyyy-MM-dd");
        Date horaleilao = FormataData.formata(hora, "HH:mm:ss");
        
      
        if (id != null) {
            //busca o que existe
            obj = dao.buscarPorChavePrimaria(Long.parseLong(id));
        } else {
            //cria um novo
            obj = new Leilao();
        }
        obj.setOrganizador(organizador);
        obj.setDataleilao(dataleilao);
        obj.setHora(horaleilao);

        if (id != null) {
            deucerto = dao.alterar(obj);
            request.setAttribute("lista", leiloes);

            pagina = "list.jsp";
            leiloes = dao.listar();
            request.setAttribute("lista", leiloes);

            if (deucerto) {
                msg = obj.getOrganizador() + " alterado com sucesso!";
            } else {
                msg = "Problema ao editar o leilao " + obj.getOrganizador();
            }
        } else {
            deucerto = dao.incluir(obj);
            pagina = "add.jsp";
            if (deucerto) {
                msg = obj.getOrganizador() + " adicionado com sucesso!";
            } else {
                msg = "Problema ao adicionar o leilao " + obj.getOrganizador();
            }
        }
        request.setAttribute("msg", msg);
        destino = request.getRequestDispatcher(pagina);
        destino.forward(request, response);
    }
}