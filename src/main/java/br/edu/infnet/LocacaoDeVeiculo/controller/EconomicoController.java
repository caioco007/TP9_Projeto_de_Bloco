package br.edu.infnet.LocacaoDeVeiculo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import br.edu.infnet.LocacaoDeVeiculo.model.negocio.Economico;
import br.edu.infnet.LocacaoDeVeiculo.model.service.EconomicoService;

@Controller
public class EconomicoController {

	@Autowired 
	private EconomicoService economicoService;
	
	@GetMapping(value = "/economico")
	public String novo(
				Model model
			) {
		model.addAttribute("operacao", "inclusão");
		
		return "economico/detalhe";
	}
	
	@GetMapping(value = "/economicos")
	public String lista(
				Model model
			) {
		model.addAttribute("economicos", economicoService.obterLista());
		
		return "economico/lista";
	}
	
	@PostMapping(value = "/economico/incluir")
	public String incluir(
				Economico economico
			) {
		
		economicoService.incluir(economico);
		
		return "redirect:/economicos";
	}

	@GetMapping(value = "/economicos/{id}/excluir")
	public String excluir(
				Model model,
				@PathVariable Integer id
			) {
		
		try {
			economicoService.excluir(id);
		} catch (Exception e) {
			model.addAttribute("msgError", "Impossível realizar a exclusão: este item está sendo utilizado!!");
			return this.lista(model);
		}
		
		return "redirect:/economicos";
	}
	
	@GetMapping(value = "/economico/{id}/alterar")
	public String alterar(
				Model model,
				@PathVariable Integer id
			) {
		
		model.addAttribute("economico", economicoService.obterPorId(id));
		model.addAttribute("operacao", "alteração");
		
		return "economico/detalhe";
	}
}