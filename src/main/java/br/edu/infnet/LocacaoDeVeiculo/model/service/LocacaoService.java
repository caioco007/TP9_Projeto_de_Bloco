package br.edu.infnet.LocacaoDeVeiculo.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.edu.infnet.LocacaoDeVeiculo.model.negocio.Locacao;
import br.edu.infnet.LocacaoDeVeiculo.model.repository.ILocacaoRepository;

@Service
public class LocacaoService {

	@Autowired
	private ILocacaoRepository locacaoRepository;

	public List<Locacao> obterLista(){
		return (List<Locacao>)locacaoRepository.findAll();
	}
	
	public void incluir(Locacao locacao) {
		locacaoRepository.save(locacao);
	}

	public void excluir(Integer id) {
		locacaoRepository.deleteById(id);
	}
}
