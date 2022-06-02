### Descrição
* Testes 1 ao 3 do processo seletivo para estagiário back-end. Utilização de infra em nuvem com notebooks do Google Colab, dentro das pastas dos testes existem READMEs que detalham cada processo.


### Versões
* Python 3.x
* MySql 8.0

### Pré-requisitos gerais
* O software ghostscript(https://www.ghostscript.com) é necessário na tarefa de transformar um pdf em uma tabela .csv, caso o teste 2 não seja feito com infra em nuvem em um notebook Google Colab como descrito no README da pasta "Testes 1 e 2".
* Libraries utilizadas:
* Beautifulsoup (para trabalhar com o html requisitado)
  ```sh
  pip install beautifulsoup4
  ```
* Camelot (em conjunto com o ghostscript, transforma as tabelas .pdf em .csv)
  ```sh
  pip install camelot-py
  ```
* Pandas (transforma as tabelas em dataframes moldáveis)
  ```sh
  pip install pandas
  ```
* Requests (para acessar a página html)
  ```sh
  pip install requests
  ```
### Considerações
* Tarefas que eu entendi de forma ambígua estão presentes em forma de comentário nos códigos, mostrando as possíveis interpretações (como na edição de colunas OD e AMB no teste 2).
* Os arquivos .csv baixados tiveram que ser formatados no excel para serem importados para a database (formato de data, separação entre decimais, etc)
* Desse modo, os .sql só funcionarão com os arquivos já formatados que estão no repositório, não os originais.
* Não consegui realizar o teste 4 por ainda não ter os conhecimentos necessários em Apis e vuejs, apesar de ter tentado bastante.
  
