package br.edu.infnet.LocacaoDeVeiculo.model.negocio;

import javax.persistence.Entity;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

@Entity
@Table(name = "TEconomico")
@PrimaryKeyJoinColumn(name = "idVeiculo")
public class Economico extends Veiculo{
	
	private Boolean vidroManu;
			
	
	@Override
	public String toString() {
		return String.format("%s - %s",
				super.toString(),
				this.getVidroManu() ? "S" : "N"			
			);
	}
	
	public Boolean getVidroManu() {
		return vidroManu;
	}


	public void setVidroManu(Boolean vidroManu) {
		this.vidroManu = vidroManu;
	}
	
	

}
