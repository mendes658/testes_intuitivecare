import zipfile
import os
import camelot 
import pandas as pd


def progresso(atual, total):
    porcentagem = round(atual / (total / 100), 2)
    barrinha = '{:<50}'.format(int(porcentagem/2)*'❚')
    barra_comp = f'[{barrinha}] {porcentagem}% | [{atual}/{total}]'
    return barra_comp

with zipfile.ZipFile('anexos.zip', 'r') as anexos_zip:
    anexo_1 = (anexos_zip.namelist())[0]
    anexos_zip.extract(anexo_1)

"""* O camelot irá ler as páginas especificadas nas variáveis 'pag_inicial' e 'pag_final' e transformar as tabelas em .csv, após cada leitura elas serão concatenadas num dataframe pandas.
* O máximo de otimização que eu consegui nessa parte foi com um 'for' para ler uma por uma, provavelmente há um modo mais eficiente.
* Em seguida as rows das colunas 'OD' e 'AMB' são alteradas no dataframe. Entendi essa tarefa de duas formas, explicitadas no código abaixo↓
"""

master_df = pd.DataFrame()
pag_inicial = 3
pag_final = 200
ler = (pag_final-pag_inicial)+1
for n in range(ler):
    tabelas = camelot.read_pdf(f'{anexo_1}', process_background=True,
                               pages=f'{n + pag_inicial}', line_scale = 35)
    tabelas.export(f'tabela.csv', f='csv')
    master_df = pd.concat([master_df, pd.read_csv(f'tabela-page-{n + pag_inicial}-table-1.csv')])
    os.remove(f'tabela-page-{n + pag_inicial}-table-1.csv')
    print(f'Criando tabelas: {progresso(n, ler)}', end='\r') #no google colab o "\r" para escrever em uma linha só não funcionou
print(f'Criando tabelas: {progresso(ler, ler)}')

# cria um novo pandas dataframe, itera sobre as rows e altera de acordo
master_df.to_csv('tabela_unica.csv', index=False)
df = pd.read_csv("tabela_unica.csv")
correct_df = df.copy()
for index, row in correct_df.iterrows():
    if row['OD'] == 'OD':
        correct_df.loc[index, 'OD'] = 'Seg. Odontológica'
    if row['AMB'] == 'AMB':
        correct_df.loc[index, 'AMB'] = 'Seg. Ambulatorial'

# entendi a tarefa de alterar as células de forma ambígua
# caso o correto seja alterar apenas as colunas, ative abaixo:
'''
correct_df.rename(columns={'OD': 'Seg. Odontológica', 'AMB': 'Seg. Ambulatorial'}, inplace=True)
'''

correct_df.to_csv(r'tabela_unica_fixd.csv', index=False, header=True)
with zipfile.ZipFile('Teste_Pedro_Mendes.zip', 'w', compression=zipfile.ZIP_DEFLATED) as zipado:
    zipado.write('tabela_unica_fixd.csv')
os.remove('tabela_unica.csv')
os.remove('tabela_unica_fixd.csv')
os.remove(f'{anexo_1}')
