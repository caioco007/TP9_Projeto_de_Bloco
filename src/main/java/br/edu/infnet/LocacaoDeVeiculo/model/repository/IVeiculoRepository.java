package br.edu.infnet.LocacaoDeVeiculo.model.repository;

import java.util.List;

import org.springframework.data.domain.Sort;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import br.edu.infnet.LocacaoDeVeiculo.model.negocio.Veiculo;

@Repository
public interface IVeiculoRepository extends CrudRepository<Veiculo, Integer>{
	
	List<Veiculo> findAll(Sort by);
}
