package br.edu.infnet.LocacaoDeVeiculo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import br.edu.infnet.LocacaoDeVeiculo.model.negocio.Cadastro;
import br.edu.infnet.LocacaoDeVeiculo.model.service.CadastroService;

@Controller
public class CadastroController {
	
	@Autowired 
	private CadastroService cadastroService;

	@RequestMapping(value = "/cadastro", method = RequestMethod.POST)
	public String incluir(
				Model model,
				Cadastro cadastro
			) {
		
		cadastroService.incluir(cadastro);
		
		return "login";
	}
	
	@RequestMapping(value = "/cadastro", method = RequestMethod.GET)
	public String showDetalhe() {
				
		return "cadastro/registrar";
	}
}
