### TESTE 1 - Webscraping 
* Utilizando as libraries "requests" e "BeautifulSoup", a página é acessada, os links de download são colocados numa lista, baixados e zipados.

### TESTE 2 - Transformação de dados
* Utilizando as libraries "camelot" e "pandas" numa plataforma em nuvem (Google Colab -> https://colab.research.google.com/drive/1KLe-y_4ZaeScMLwWT3paLgsj2zmtALDF?usp=sharing), o arquivo "anexos.zip"(tem que ser colocado no ambiente de execução) com o pdf é extraído, as tabelas do pdf são lidas, transformadas em dataframes e unidas. 
* Em seguida a tabela é editada para trocar as colunas OB e AMB (essa tarefa eu entendi de forma ambígua, o código que eu montei troca todas as células, mas caso seja necessário trocar apenas as colunas, existe um comentário no código que faz isso), após isso ela vira .csv e é zipada. 
* Obs:  Se o código não for compilado no Google Colab, é necessário baixar o programa ghostscript (www.ghostscript.com)
