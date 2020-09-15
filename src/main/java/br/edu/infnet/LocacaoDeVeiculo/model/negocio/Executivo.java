package br.edu.infnet.LocacaoDeVeiculo.model.negocio;

import javax.persistence.Entity;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

@Entity
@Table(name = "TExecutivo")
@PrimaryKeyJoinColumn(name = "idVeiculo")
public class Executivo extends Veiculo {
	
	private Boolean automatico;

	
	@Override
	public String toString() {
		return String.format("%s - %s",
				super.toString(),
				this.getAutomatico() ? "S" : "N"			
			);
	}

	public Boolean getAutomatico() {
		return automatico;
	}


	public void setAutomatico(Boolean automatico) {
		this.automatico = automatico;
	}
	
	

}
