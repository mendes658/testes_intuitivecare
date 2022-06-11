import requests
import re
from bs4 import BeautifulSoup
import zipfile
import os

response = requests.get('https://www.gov.br/ans/pt-br/assuntos/consumidor'
                        '/o-que-o-seu-plano-de-saude-deve-cobrir-1/o-que-e-o-rol-de-procedimentos-e-evento-em-saude')
content = response.content
soup = BeautifulSoup(content, 'html.parser')
anexos_links = []

# Com o re.compile, a organização dos anexos é feita puxando todos os hrefs das tags <a> que possuem a palavra "Anexo"
for anexo in soup.find_all("a", string=re.compile('Anexo')):
    anexos_links += [anexo['href']]
anexos_zip = zipfile.ZipFile('anexos.zip', 'w')

# Faz o download e zipa os arquivos em seguida
for link in anexos_links:
    downloaded = requests.get(link)
    file_name = (link.split('/'))[-1]  # O filename não está nos headers, e sim no link, sendo necessário o split
    with open(f"{file_name}", "wb") as file:
        file.write(downloaded.content)
        anexos_zip.write(f'{file_name}')
    os.remove(f'{file_name}')
anexos_zip.close()
