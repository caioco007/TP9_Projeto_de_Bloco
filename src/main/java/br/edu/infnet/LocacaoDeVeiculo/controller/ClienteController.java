package br.edu.infnet.LocacaoDeVeiculo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import br.edu.infnet.LocacaoDeVeiculo.model.negocio.Cliente;
import br.edu.infnet.LocacaoDeVeiculo.model.service.ClienteService;

@Controller
public class ClienteController {
	
	@Autowired
	private ClienteService clienteService;
		
	@RequestMapping(value = "/cliente", method = RequestMethod.GET)
	public String showDetalhe() {
		return "cliente/detalhe";
	}

	@RequestMapping(value = "/clientes", method = RequestMethod.GET) 
	public String obterLista(
				Model model
			) {
		
		model.addAttribute("listaCliente", clienteService.obterLista());
		
		return "cliente/lista";
	}

	@RequestMapping(value = "/cliente", method = RequestMethod.POST)
	public String incluir(
				Model model,
				Cliente cliente
			) {
		
		clienteService.incluir(cliente);
		
		return this.obterLista(model);
	}	
	
	@RequestMapping(value = "/cliente/excluir/{id}", method = RequestMethod.GET)
	public String excluir(
				Model model,
				@PathVariable Integer id
			) {
		
		clienteService.excluir(id);
		
		return this.obterLista(model);
	}
	
}
