package br.edu.infnet.LocacaoDeVeiculo.model.negocio;

import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.cache.spi.support.AbstractReadWriteAccess.Item;

import br.edu.infnet.LocacaoDeVeiculo.model.service.LocacaoService;

@Entity
@Table(name = "TLocacao")
public class Locacao {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	private LocalDateTime dtLocacao;
	private LocalDateTime dtDevolucao;
	private Long daysBetween;
	private Float valorTotal;
	@ManyToMany(cascade = CascadeType.DETACH)
	@JoinTable(name = "TLocacaoVeiculo",	
		joinColumns = {@JoinColumn(name="idLocacao")},
		inverseJoinColumns = {@JoinColumn(name="idVeiculo")})
	private List<Veiculo> veiculos;
	@OneToOne(cascade = CascadeType.DETACH)
	@JoinColumn(name = "idCliente")
	private Cliente cliente;
	
	public Locacao() {
		
	}
	
	public Float valorTotal(Integer id) {
	    Float valor = 0F;
	    Long dias = ChronoUnit.DAYS.between(this.getDtLocacao(), this.getDtDevolucao());

	    Locacao locacao = LocacaoService.getById(id);
	    List<Item> listaItem = mestreService.getItemList(id);
	    
	    for (Item item : listaItem) {
	        valor = valor + (item.valor * dias);
	    }

	    return valor;
	}
	
	public Locacao(Integer id, LocalDateTime dtLocacao, LocalDateTime dtDevolucao, Long daysBetween, Float valorTotal) {
		this.setId(id);
		this.setDtLocacao(dtLocacao);
		this.setDtDevolucao(dtDevolucao);
		this.setDaysBetween(daysBetween);
		this.setValorTotal(valorTotal);
	}
	
//	\nValor da locação: %.2f \n%s
	
	@Override
	public String toString() {
		return String.format(
				"[%d] Data de Locação: %s \nData de Devolução: %s \nTotal de dias: %d ",
				this.id, 
				this.dtLocacao,
				this.dtDevolucao,
				this.daysBetween
		);
	}

	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public LocalDateTime getDtLocacao() {
		return dtLocacao;
	}

	public void setDtLocacao(LocalDateTime dtLocacao) {
		this.dtLocacao = dtLocacao;
	}

	public LocalDateTime getDtDevolucao() {
		return dtDevolucao;
	}

	public void setDtDevolucao(LocalDateTime dtDevolucao) {
		this.dtDevolucao = dtDevolucao;
	}
	
	public Long getDaysBetween() {
		return daysBetween;
	}

	public void setDaysBetween(Long daysBetween) {
		this.daysBetween = daysBetween;
	}
	
	public Float getValorTotal() {
		return valorTotal;
	}

	public void setValorTotal(Float valorTotal) {
		this.valorTotal = valorTotal;
	}

	public List<Veiculo> getVeiculos() {
		return veiculos;
	}

	public void setVeiculos(List<Veiculo> veiculos) {
		this.veiculos = veiculos;
	}

	public Cliente getCliente() {
		return cliente;
	}
	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}

}
