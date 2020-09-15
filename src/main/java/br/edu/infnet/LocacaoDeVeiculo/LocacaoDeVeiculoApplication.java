package br.edu.infnet.LocacaoDeVeiculo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.openfeign.EnableFeignClients;

@SpringBootApplication
@EnableFeignClients
public class LocacaoDeVeiculoApplication {

	public static void main(String[] args) {
		SpringApplication.run(LocacaoDeVeiculoApplication.class, args);
	}

}
