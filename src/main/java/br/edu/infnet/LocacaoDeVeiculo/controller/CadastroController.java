package br.edu.infnet.LocacaoDeVeiculo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import br.edu.infnet.LocacaoDeVeiculo.model.negocio.Cadastro;
import br.edu.infnet.LocacaoDeVeiculo.model.service.CadastroService;

@Controller
public class CadastroController {
	
	@Autowired 
	private CadastroService cadastroService;	
	
	@RequestMapping(value = "/cadastro", method = RequestMethod.GET)
	public String showDetalhe() {
				
		return "registrar";
	}
	
	@RequestMapping(value = "/cadastro/lista", method = RequestMethod.GET) 
	public String obterLista(
				Model model
			) {
		
		model.addAttribute("listaCadastro", cadastroService.obterLista());
		
		return this.showDetalhe();
	}
	
	@RequestMapping(value = "/cadastro/incluir", method = RequestMethod.POST)
	public String incluir(
				Model model,
				Cadastro cadastro
			) {
		
		cadastroService.incluir(cadastro);
		
		return this.obterLista(model);
	}
	
	@RequestMapping(value = "/cadastro/excluir/{id}", method = RequestMethod.GET)
	public String excluir(
				Model model,
				@PathVariable Integer id
			) {
		
		cadastroService.excluir(id);
		
		return this.obterLista(model);
	}
}
