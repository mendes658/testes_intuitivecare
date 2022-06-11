import zipfile
import tabula
import pandas as pd
import requests
import re
from bs4 import BeautifulSoup
import os

class ScraperAndReader:
    def __init__(self):
        self.anexo = ''
        self.dataframe_master = ''
        self.correct_dataframe = ''
    
    def downloadAndZip(self):
        print('DOWNLOADING FILES...')
        response = requests.get('https://www.gov.br/ans/pt-br/assuntos/consumidor'
                        '/o-que-o-seu-plano-de-saude-deve-cobrir-1/o-que-e-o-rol-de-procedimentos-e-evento-em-saude')
        content = response.content
        soup = BeautifulSoup(content, 'html.parser')
        anexos_links = []
        for anexo in soup.find_all("a", string=re.compile('Anexo')):
            anexos_links += [anexo['href']]
        with zipfile.ZipFile('anexos.zip', 'w') as zipado:
            for link in anexos_links:
                downloaded = requests.get(link)
                file_name = (link.split('/'))[-1]
                with open(f"{file_name}", "wb") as file:
                    file.write(downloaded.content)
                    zipado.write(f'{file_name}')
                os.remove(f'{file_name}')


    def zipToDataFrame(self):
        print('READING PDF AND TRANSFORMING TABLES TO CSV...')
        with zipfile.ZipFile('anexos.zip', 'r') as anexos_zip:
            anexo_1 = (anexos_zip.namelist())[0]
            self.anexo = anexo_1
            anexos_zip.extract(anexo_1)
        master_df = pd.DataFrame()
        teste = tabula.read_pdf(f'{anexo_1}', pages='3-189', lattice=True)
        for tabela in teste:
            master_df = pd.concat([master_df, tabela])
        self.dataframe_master = master_df

    def changeRows(self):
        dataframe = self.dataframe_master
        print('EDITING ROWS...')
        correct_df = dataframe.copy()
        correto = correct_df.replace(to_replace=['OD', 'AMB'], value=['Seg. Odontológica', 'Seg. Ambulatorial'])
        self.correct_dataframe = correto
    
    def dataFrameToZipCsv(self):
        dataframe = self.correct_dataframe
        dataframe.to_csv(r'tabela_unica_fixd.csv', index=False, header=True)
        with zipfile.ZipFile('Teste_Pedro_Mendes.zip', 'w', compression=zipfile.ZIP_DEFLATED) as zipado:
            zipado.write('tabela_unica_fixd.csv')
    
    def deleteUnusable(self):
        os.remove('tabela_unica_fixd.csv')
        os.remove(f'{self.anexo}')


