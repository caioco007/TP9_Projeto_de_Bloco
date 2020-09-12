package br.edu.infnet.LocacaoDeVeiculo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import br.edu.infnet.LocacaoDeVeiculo.model.negocio.Cadastro;
import br.edu.infnet.LocacaoDeVeiculo.model.service.CadastroService;

@Controller
@SessionAttributes("alerta")
public class AppController {

	@Autowired 
	private CadastroService cadastroService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String showInit() {
		return "login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String showLogin() {
		return this.showInit();
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String showHome(
				Model model,
				@RequestParam String login,
				@RequestParam String senha
			) {

		Cadastro cadastro = cadastroService.isValid(login, senha);
		
		if(cadastro == null) {
			model.addAttribute("mensagem", "Credenciais inválidas: " + login);
			return "login";
		} else {
			model.addAttribute("alerta","Usuário " + cadastro.getLogin() + " está autenticado no sistema");
			return "home";
		}		
	}

	@RequestMapping(value = "/voltar/login", method = RequestMethod.GET) 
	public String voltar() {		
		return "login";
	}
	
	@RequestMapping(value = "/sair", method = RequestMethod.GET)
	public String sair(SessionStatus session) {
		
		session.setComplete();		
		
		return "login";
	}
}
