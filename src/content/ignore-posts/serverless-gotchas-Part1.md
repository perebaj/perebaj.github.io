---
title: serverless gotchas. Part1
pubDate: 2024-09-19 16:50:22
description: ''
heroImage: '/blog-placeholder-2.jpg'
---

Em 2018, eu e mais uns malucos tentamos usar o AWS Lambda para fazer um projeto de _crawlers_. A ideia era simples: usar o Lambda para realizar a requisição e parse do HTML para cada URL coletada. Como nada são flores, facilmente encontramos alguns problemas que não estavam nas primeiras páginas da documentação. Problemas como tempo de execução, limite de memória, e até mesmo o custo de execução. Por conta disso começamos a criar vários mecanismos para:

1. Em uma mesma _function_, realizar mais de uma requisição
2. Criar fluxos que conectavam a saída de uma function com a entrada de outra.

No final das contas, posso dizer que foi uma boa dor de cabeça. Mas, como tudo na vida, aprendi bastante com isso.

Eu já comentei sobre isso em um outro post. Mas fui extremamente vago. Aqui vou trazer mais detalhes sobre minhas experiências com _serverless_ , não só na AWS, as também na Azure e GCP.

# Nenhum software em produção é tão simples quanto só um código

Quando você começa a trabalhar com _serverless_, boa parte do marketing criado ao redor das soluções é: "Você só precisa se preocupar com o código". E, de fato, é verdade. Mas, como tudo na vida, não é só isso.

Você realmente pode, só criar seu código e subir para núvem. Mas, em uma code base de verdade, você quer reaproveitar seu módulos, criar testes, pipelines de CI/CD, monitoramente, etc. Quando o número de funções começa a crescer, você percebe que você está lidando com um mono-repo com muitos sub-repositórios. E não é incomum em mono-repos, você ter problemas de organização e escalabilidade.

Uma porque talvez seus builds estejam demorando muito. Muitas imagens para gerenciar, muitos testes para rodar, gerenciar dependências e sub-dependências.

Abaixo vou listar alguns pontos que você deve se atentar quando estiver trabalhando com _serverless_.

## CI/CD
