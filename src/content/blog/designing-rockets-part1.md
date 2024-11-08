---
title: designing rockets - part 1
pubDate: 2024-11-06 03:11:01
description: ''
heroImage: '/rocket3.png'
---

<div style="display: flex; justify-content: center;">
    <img src="/rocket2.png" alt="prs" style="width:200px;"/>
</div>

# Topus - EESC USP

Topus é um grupo de engenharia focado em engenharia aeroespacial. O grupo é composto por estudantes da Universidade de São Paulo, Brasil, focados no desenvolvimento de foguetes e outros componentes aeroespaciais.

O objetivo do grupo é participar de algumas competições e desenvolver uma cultura de engenharia entre os estudantes de diferentes cursos, como engenharia mecânica, engenharia elétrica, ciência da computação, engenharia aeroespacial e outros.

# Definições

## Propulsão

Em um sentido amplo é o ato de modificar o movimento de um copo. Os mecanismos de propulsão fornecem uma força que pode ser utilizada para vencer a gravidade, mudar a velocidade ou superar a resistência do meio ao movimento. A propulsão a jato baseia-se na ejeção de matéria de um sistema gerando uma força de reação sobre o sistema. A propulsão em foguetes é uma classe de propulsão a jato em que o empuxo é produzido pela ejeção exclusivamente de matéria armazenada a bordo. Chamada de propelente. Que nada mais é que um **oxidante** e um **combustível**.

Propulsão em foguetes se enquadram no ramo da química e possuem diferentes tipos que caracterizam o tipo de foguete. Dentre elas, temos a propulsão sólida, líquida e híbrida.

A propulsão sólida é caracterizada por ter o oxidante e o combustível misturados em um único composto.

A propulsão líquida é caracterizada por ter o oxidante e o combustível armazenados separadamente(líquidos) e misturados no momento da queima, aumentando a eficiência do motor.


## Propulsão híbrida

Nesse projeto, estamos projetando um foguete de **propulsão híbrida**. Nessa formação, o combustível e comburente(agente oxidante) se encontram em estados diferentes, o mais comúm é que o combustível seja sólido, preenchendo a câmara de combustão na qual o comburente líquido ou gasoso é injetado.

A queima, se dá através de um processo de difusão turbulenta macroscópica, de forma que a razão oxidante/combustível é controlada e varia ao longo do tempo na câmara de combustão.

As imagens a seguir mostram a estrutura de um motor híbrido e a estrutura de um foguete híbrido.

<div style="display: flex; justify-content: center;">
    <img src="/hybrid-motor.png" alt="prs" style="width:600px;"/>
</div>


<div style="display: flex; justify-content: center;">
    <img src="/structure-hibrid-rocket.png" alt="prs" style="width:600px;"/>
</div>

A técnologia de propulsão híbrida já é conhecida há mais de 50 anos. E ela se caracteriza por alguns pontos:

**Segurança**: A propulsão híbrida é considerada mais segura que a propulsão sólida e líquida. Pois, a mistura do oxidante e do combustível é feita no momento da queima, sendo assim, a taxa de regressão com relação à pressão é independente, tornando sistemas híbridos mais seguros que os sistemas sólidos caso ocorra picos de pressão.

**Controle**: O controle da vazão de oxidante nos motores híbridos permite o controle acurado do nível de empuxo e a realização de manobras de controle e re-acionamentos dentro de uma única missão. Diferente dos sólidos, que funcionam em single burn.

## Escoamento vortical

Em suma, o escoamento vortical é um tipo de escoamento que forma vórtices. Esse fenômeno é importante para a a construção do motor e queima adequada do propelente, pois o fenômeno é responsável por aumentar a taxa de regressão do combustível sólido, permitindo o uso de grãos mono-perfurados.

O video a seguir mostra um exemplo de escoamento vortical de uma peça desenhada pelo grupo.

<div style="display: flex; justify-content: center;">
    <img src="/vortex.gif" />
</div>

E a imagem a baixo mostra o resultado da queima do grão mono-perfurado quando a injeção do oxidante é feita de forma vortecial.

<div style="display: flex; justify-content: center;">
    <img src="/escoamento-vortical.png" alt="prs" style="width:600px;"/>
</div>


# The System (Big Picture)

<div style="display: flex; justify-content: center;">
    <img src="/design-hybrid-motor.png" alt="prs" style="width:700px;"/>
</div>

<div style="display: flex; justify-content: center;">
    <img src="/hybridmotor-system.gif" />
</div>


# Solenoid & pressure transducer system
