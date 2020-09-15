package br.edu.infnet.LocacaoDeVeiculo.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import br.edu.infnet.LocacaoDeVeiculo.model.negocio.Veiculo;
import br.edu.infnet.LocacaoDeVeiculo.model.repository.IVeiculoRepository;

@Service
public class VeiculoService {
	
	@Autowired 
	private IVeiculoRepository veiculoRepository;
	
	public List<Veiculo> obterLista(){
		
		return (List<Veiculo>)veiculoRepository.findAll(Sort.by(Sort.Direction.ASC, "modelo"));
	}
	
	public void excluir(Integer id) {
		veiculoRepository.deleteById(id);
	}
}
