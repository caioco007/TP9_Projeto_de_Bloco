package br.edu.infnet.LocacaoDeVeiculo.model.repository;

import java.util.List;

import org.springframework.data.domain.Sort;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import br.edu.infnet.LocacaoDeVeiculo.model.negocio.Economico;

@Repository
public interface IEconomicoRepository extends CrudRepository<Economico, Integer> {
	
	List<Economico> findAll(Sort by);

}
