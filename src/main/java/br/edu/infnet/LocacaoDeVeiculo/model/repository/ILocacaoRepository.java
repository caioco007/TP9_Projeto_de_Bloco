package br.edu.infnet.LocacaoDeVeiculo.model.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import br.edu.infnet.LocacaoDeVeiculo.model.negocio.Locacao;

@Repository
public interface ILocacaoRepository extends CrudRepository<Locacao, Integer> {

}
