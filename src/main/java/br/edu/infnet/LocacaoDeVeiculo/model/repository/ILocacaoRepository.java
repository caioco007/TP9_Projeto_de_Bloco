package br.edu.infnet.LocacaoDeVeiculo.model.repository;

import java.util.List;

import org.springframework.data.domain.Sort;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import br.edu.infnet.LocacaoDeVeiculo.model.negocio.Locacao;

@Repository
public interface ILocacaoRepository extends CrudRepository<Locacao, Integer> {
	
	List<Locacao> findAll(Sort by);
	
//	@Query("select sum(ve.valor * :daysBetween) from Veiculo ve where ve.locacao.id = :idLocacao")
//	Float totalizarLocacaoQtde(Integer idLocacao, Long daysBetween);
}
