### Versões
* Python 3.x
* MySql 8.0

### Pré-requisitos
* O software ghostscript(https://www.ghostscript.com) é necessário na tarefa de transformar um pdf em uma tabela .csv
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
* Tarefas que eu entendi de forma ambígua estão presentes em forma de comentário nos códigos, mostrando as possíveis interpretações.
* Os arquivos csv baixados tiveram que ser formatados no excel para serem importados para a database (formato de data, separação entre decimais, etc)
* Desse modo, os .sql só funcionarão com os arquivos já formatados que estão no repositório, não os originais.
  

  



