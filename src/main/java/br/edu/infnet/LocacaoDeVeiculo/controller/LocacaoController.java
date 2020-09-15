package br.edu.infnet.LocacaoDeVeiculo.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import br.edu.infnet.LocacaoDeVeiculo.model.negocio.Locacao;
import br.edu.infnet.LocacaoDeVeiculo.model.negocio.Veiculo;
import br.edu.infnet.LocacaoDeVeiculo.model.service.ClienteService;
import br.edu.infnet.LocacaoDeVeiculo.model.service.LocacaoService;
import br.edu.infnet.LocacaoDeVeiculo.model.service.VeiculoService;

@Controller
public class LocacaoController {
	
	@Autowired 
	private LocacaoService locacaoService;
	@Autowired 
	private ClienteService clienteService;
	@Autowired 
	private VeiculoService veiculoService;
	
	@GetMapping(value = "/locacao")
	public String novo(
				Model model

			) {
		model.addAttribute("operacao", "inclusão");
		model.addAttribute("veiculos", veiculoService.obterLista());
		model.addAttribute("clientes", clienteService.obterLista());
		
		return "locacao/detalhe";
	}

	@GetMapping(value = "/locacoes")
	public String lista(
				Model model
//				@PathVariable Integer idLocacao,
//				@PathVariable Long daysBetween

			) {
		model.addAttribute("locacoes", locacaoService.obterLista());
//        model.addAttribute("valorTotal", locacaoService.totalizarLocacaoQtde(idLocacao,daysBetween));
		
		return "locacao/lista";
	}
	
	@PostMapping(value = "/locacao/incluir")
	public String incluir(
				Model model,
				@RequestParam String[] veiculosIds,
				Locacao locacao,
				@RequestParam String dtLoc,
				@RequestParam String dtDev,
				@RequestParam Float valor
			) {
		
		DateTimeFormatter dt = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");		
		locacao.setDtLocacao(LocalDateTime.parse(dtLoc, dt));
		locacao.setDtDevolucao(LocalDateTime.parse(dtDev, dt));
		
		
		List<Veiculo> lista = new ArrayList<Veiculo>();
		
		for(String id : veiculosIds) {
			lista.add(new Veiculo(Integer.valueOf(id)));
		}
		
		locacao.setVeiculos(lista);
		
		locacao.setDaysBetween(ChronoUnit.DAYS.between(LocalDateTime.parse(dtLoc, dt), LocalDateTime.parse(dtDev, dt)));
//		locacao.setValorTotal();
		
		locacaoService.incluir(locacao);

		return "redirect:/locacoes";
	}
	
	@GetMapping(value = "/locacao/{id}/excluir")
	public String excluir(
				Model model,
				@PathVariable Integer id,
				@PathVariable Integer idLocacao,
				@PathVariable Long daysBetween
			) {
		
		try {
			locacaoService.excluir(id);
		} catch (Exception e) {
			model.addAttribute("msgError", "Impossível realizar a exclusão: este item está sendo utilizado!!");
			return this.lista(model);
		}
		
		return "redirect:/locacoes";
	}
	@GetMapping(value = "/locacao/{id}/consultar")
	public String consultar(
				Model model,
				@PathVariable Integer id
			) {
		model.addAttribute("operacao", "consulta");
		
		model.addAttribute("locacao", locacaoService.obterPorId(id));
		
		return "locacao/consulta";
	}
}
