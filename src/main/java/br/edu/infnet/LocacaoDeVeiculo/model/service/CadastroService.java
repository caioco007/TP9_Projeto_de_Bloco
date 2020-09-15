package br.edu.infnet.LocacaoDeVeiculo.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.edu.infnet.LocacaoDeVeiculo.model.negocio.Cadastro;
import br.edu.infnet.LocacaoDeVeiculo.model.repository.ICadastroRepository;

@Service
public class CadastroService {
	
	@Autowired
	private ICadastroRepository cadastroRepository;

	public boolean isValid(String login, String senha) {		
		return cadastroRepository.autenticacao(login, senha) != null;
	}
	
	public Cadastro userExist(String login) {
		return cadastroRepository.findByLogin(login);
	}
		
	public void incluir(Cadastro cadastro) {
		cadastroRepository.save(cadastro);
	}
	
}
