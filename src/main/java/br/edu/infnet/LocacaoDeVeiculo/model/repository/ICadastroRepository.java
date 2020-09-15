package br.edu.infnet.LocacaoDeVeiculo.model.repository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import br.edu.infnet.LocacaoDeVeiculo.model.negocio.Cadastro;

@Repository
public interface ICadastroRepository extends CrudRepository<Cadastro, Integer> {
	
	@Query("from Cadastro c where c.login =:login and c.senha =:senha")
	Cadastro autenticacao(String login, String senha);
	
	Cadastro findByLogin(String login);
}
