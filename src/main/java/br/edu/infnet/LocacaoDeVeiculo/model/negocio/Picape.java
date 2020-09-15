package br.edu.infnet.LocacaoDeVeiculo.model.negocio;

import javax.persistence.Entity;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

@Entity
@Table(name = "TPicape")
@PrimaryKeyJoinColumn(name = "idVeiculo")
public class Picape extends Veiculo {
		
		private Float peso;
	
	@Override
	public String toString() {
		return String.format("%s - %.2f",
				super.toString(),
				this.getPeso()			
			);
	}

	public Float getPeso() {
		return peso;
	}

	public void setPeso(Float peso) {
		this.peso = peso;
	}
	
	
}
