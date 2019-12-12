package modelo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Temporal;

@Entity
@NamedQueries({
    @NamedQuery(name = "Leilao.findAll", query = "SELECT a FROM Leilao a"),
    @NamedQuery(name = "Leilao.findFilter", query = "SELECT a FROM Leilao a WHERE a.organizador = :filtro")
})
public class Leilao implements Serializable {

    @ManyToMany(mappedBy = "leiloes")
    private List<Participante> participantes;

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String organizador;
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date dataleilao;
    @Temporal(javax.persistence.TemporalType.TIME)
    private Date hora;

    public List<Participante> getParticipantes() {
        return participantes;
    }

    public void setParticipantes(List<Participante> participantes) {
        this.participantes = participantes;
    }
  

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getOrganizador() {
        return organizador;
    }

    public void setOrganizador(String organizador) {
        this.organizador = organizador;
    }

    public Date getHora() {
        return hora;
    }

    public void setHora(Date hora) {
        this.hora = hora;
    }

    public Date getDataleilao() {
        return dataleilao;
    }

    public void setDataleilao(Date dataleilao) {
        this.dataleilao = dataleilao;
    }


    

}
