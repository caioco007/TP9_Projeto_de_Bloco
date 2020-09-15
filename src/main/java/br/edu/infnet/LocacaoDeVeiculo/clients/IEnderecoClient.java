package br.edu.infnet.LocacaoDeVeiculo.clients;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import br.edu.infnet.LocacaoDeVeiculo.model.negocio.Endereco;

@FeignClient(url = "https://viacep.com.br/ws", name = "enderecoClient")
public interface IEnderecoClient {
	
	@GetMapping(value ="/{cep}/json", consumes = MediaType.APPLICATION_JSON_VALUE)
	public Endereco obterPorCep (@PathVariable String cep);	
	
}
