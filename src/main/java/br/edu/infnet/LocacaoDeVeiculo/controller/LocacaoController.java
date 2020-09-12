package br.edu.infnet.LocacaoDeVeiculo.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import br.edu.infnet.LocacaoDeVeiculo.model.negocio.Locacao;
import br.edu.infnet.LocacaoDeVeiculo.model.service.ClienteService;
import br.edu.infnet.LocacaoDeVeiculo.model.service.LocacaoService;

@Controller
public class LocacaoController {
	
	@Autowired 
	private LocacaoService locacaoService;
	@Autowired 
	private ClienteService clienteService;
	
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home(
			Model model
			) {	
		
		model.addAttribute("listaCliente", clienteService.obterLista());
		model.addAttribute("listaLocacao", locacaoService.obterLista());
		
		return "home";
	}
	
	@RequestMapping(value = "/locacao", method = RequestMethod.GET)
	public String showDetalhe(
				Model model
			) {

		model.addAttribute("listaCliente", clienteService.obterLista());
		
		return "locacao/detalhe";
	}

	@RequestMapping(value = "/locacoes", method = RequestMethod.GET) 
	public String obterLista(
				Model model
			) {	
		
		return "redirect:/home";
	}

	@RequestMapping(value = "/locacao/incluir", method = RequestMethod.POST)
	public String incluir(
				Model model,
				Locacao locacao,
				@RequestParam String dtLoc,
				@RequestParam String dtDev
			) {
		
		DateTimeFormatter dt = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");		
		locacao.setDtLocacao(LocalDateTime.parse(dtLoc, dt));
		locacao.setDtDevolucao(LocalDateTime.parse(dtDev, dt));
		
		locacaoService.incluir(locacao);
		
		return this.obterLista(model);
	}	
	
	@RequestMapping(value = "/locacao/excluir/{id}", method = RequestMethod.GET)
	public String excluir(
				Model model,
				@PathVariable Integer id
			) {
		
		locacaoService.excluir(id);
		
		return this.obterLista(model);
	}
	
	@RequestMapping(value = "/voltar", method = RequestMethod.GET) 
	public String voltar(
			Model model
			) {		
		return this.home(model);
	}
}
