# 💣 Campo Minado em Assembly MIPS

## Descrição
Projeto desenvolvido para a cadeira de Arquitetura e Organização de Computadores como sugestão do professor Ramon Nepomuceno da Universidade Federal do Cariri. Trata-se da implementação do clássico Campo Minado em linguagem assembly da arquitetura MIPS a partir do código em C disponibilizado pelo professor.  
Com o projeto, compreendi melhor o funcionamento de baixo nível do processador, implementando algoritmos de acesso, armazenamento e manipulação das memórias stack e heap, utilização de loopings e saltos, controle de registradores, entre outros fundamentos importantes da programação assembly.

## Tecnologias
[![MIPS](https://custom-icon-badges.demolab.com/badge/MARS--MIPS-000?style=for-the-badge&logo=mars-mips)]()
[![C](https://shields.io/badge/Linguagem_C-000?style=for-the-badge&logo=c)]()

## Estrutura do Repositório

### Arquivos disponibilizados pelo professor proponente:
- **main.asm**: Contém a função principal (main) que controla o fluxo do jogo em Assembly MIPS.
- **printboard.asm**: Implementa a função para imprimir o tabuleiro.
- **initializeboard.asm**: Implementa a função para inicializar o tabuleiro.
- **plantbombs.asm**: Implementa a função para posicionar as bombas no tabuleiro.
- **macros.asm**: Contém macros úteis para facilitar o desenvolvimento em MIPS.
- **Mars.jar**: Executável do Mars MIPS, necessário para rodar os arquivos .asm.

- **minesweeper.c**: Contém a implementação em C do jogo Minesweeper. Este arquivo serve como referência para a lógica do jogo e pode ser utilizado para comparação com as implementações em Assembly MIPS.

### Arquivos desenvolvidos durante o projeto:
- **play.asm**: Implementação a função que determina a jogabilidade.
- **checkvictory.asm**: Implementa a função que checa se o jogador venceu.
- **revealcells.asm**: Implementa a função que revela as cédulas adjacentes à selecionada pelo jogador.

## Instalação e Execução
Tendo todos os arquivos .asm do repositório em uma mesma pasta e instalado o simulador [MARS-MIPS](https://courses.missouristate.edu/kenvollmar/mars/), dentro de seu ambiente slecione Settings e ative as opções "Assemble all files in directory" e "Initialize Program Counter to global 'main' if defined".
Abra todos os arquivos do projeto no MARS e então selecione a opção "Assemble current file [...]" e em seguida "Run the current program". Após isso, o jogo estará pronto para ser jogado.

## Regras
Campo minado é um jogo clássico. Para regras detalhadas, consulte este [link](https://pt.wikipedia.org/wiki/Campo_minado).

## Créditos
Professor proponente: [Ramon Nepomuceno](mailto:ramon.nepomuceno@ufca.edu.br) </br>
Instituição: [Universidade Federal do Cariri](https://www.ufca.edu.br)

## Suporte/Contato
Para quaisquer dúvidas/sugestões/feedback, sinta-se à vontade para me contatar em matheus.bezerra@aluno.ufca.edu.br.
