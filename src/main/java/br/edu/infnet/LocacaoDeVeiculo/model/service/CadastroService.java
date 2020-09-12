package br.edu.infnet.LocacaoDeVeiculo.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.edu.infnet.LocacaoDeVeiculo.model.negocio.Cadastro;
import br.edu.infnet.LocacaoDeVeiculo.model.repository.ICadastroRepository;

@Service
public class CadastroService {
	
	@Autowired
	private ICadastroRepository cadastroRepository;

	public Cadastro isValid(String login, String senha) {		
		return cadastroRepository.autenticacao(login, senha);
	}
	
	public List<Cadastro> obterLista(){
		return (List<Cadastro>)cadastroRepository.findAll();
	}
		
	public void incluir(Cadastro cadastro) {
		cadastroRepository.save(cadastro);
	}

	public void excluir(Integer id) {
		cadastroRepository.deleteById(id);
	}
	
}
