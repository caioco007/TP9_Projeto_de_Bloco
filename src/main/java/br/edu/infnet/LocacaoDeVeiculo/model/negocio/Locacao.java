package br.edu.infnet.LocacaoDeVeiculo.model.negocio;

import java.time.LocalDateTime;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "TLocacao")
public class Locacao {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	private LocalDateTime dtLocacao;
	private LocalDateTime dtDevolucao;
	@OneToOne(cascade = CascadeType.DETACH)
	@JoinColumn(name = "idContato")
	private Cliente cliente;
	
	public Locacao() {
		
	}
	
	public Locacao(Integer id, LocalDateTime dtLocacao, LocalDateTime dtDevolucao) {
		this.setId(id);
		this.setDtLocacao(dtLocacao);
		this.setDtDevolucao(dtDevolucao);
	}
	
	@Override
	public String toString() {
		return String.format(
				"[%d] Data de Locação: %s \nData de Locação: %s \nTotal de dias: %d \nValor da locação: %.2f \n%s ",
				this.id, 
				this.dtLocacao,
				this.dtDevolucao
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

	public Cliente getCliente() {
		return cliente;
	}
	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}

}
