package br.edu.infnet.LocacaoDeVeiculo.model.repository;

import java.util.List;

import org.springframework.data.domain.Sort;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import br.edu.infnet.LocacaoDeVeiculo.model.negocio.Executivo;

@Repository
public interface IExecutivoRepository extends CrudRepository<Executivo, Integer> {
	
	List<Executivo> findAll(Sort by);

}
