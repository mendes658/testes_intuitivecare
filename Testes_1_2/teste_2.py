import zipfile
import os
import camelot  # são necessárias as libraries camelot e pandas
import pandas as pd


def progresso(atual, total):
    porcentagem = round(atual / (total / 100), 2)
    return porcentagem


with zipfile.ZipFile('anexos.zip', 'r') as anexos_zip:
    anexo_1 = (anexos_zip.namelist())[0]
    anexos_zip.extract(anexo_1)

# o camelot lê as páginas especificadas e exporta em csv
# em seguida o csv vira um dataframe e é concatenado com os outros
# o máximo de otimização que eu consegui nessa tarefa foi com um 'for' para ler uma pag de cada vez
# lendo todos de uma vez, o uso de memória escalava exponencialmente
# provavelmente há um modo mais eficiente
master_df = pd.DataFrame()
pag_inicial = 3
pag_final = 200
ler = (pag_final-pag_inicial)+1
for n in range(ler):
    tabelas = camelot.read_pdf(f'{anexo_1}', process_background=True,
                               pages=f'{n + pag_inicial}')
    tabelas.export(f'tabela.csv', f='csv')
    master_df = pd.concat([master_df, pd.read_csv(f'tabela-page-{n + pag_inicial}-table-1.csv')])
    os.remove(f'tabela-page-{n + pag_inicial}-table-1.csv')
    print(f'Criando tabelas: {progresso(n, ler)}% concluído. {n}/{ler}')
print(f'100% concluído. {ler}/{ler}')

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
