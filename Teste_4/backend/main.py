from fastapi import FastAPI
from fastapi.params import Body
from fastapi.middleware.cors import CORSMiddleware
import pandas as pd
import json
import re
app = FastAPI()


def todas_str(linha):
    str_unica = str(linha['Registro ANS'])+'/'+str(linha['CNPJ'])+'/'+linha['Razão Social']+'/'+str(linha['Nome Fantasia'])+'/'+str(linha['Modalidade'])\
                    +'/'+str(linha['Logradouro'])+'/'+str(linha['Número'])+'/'+str(linha['Complemento'])+'/'+str(linha['Bairro'])\
                    +'/'+str(linha['Cidade'])+'/'+str(linha['UF'])+'/'+str(linha['CEP'])+'/'+str(linha['DDD'])+'/'+str(linha['Telefone'])\
                    +'/'+str(linha['Fax'])+'/'+str(linha['Endereço eletrônico'])+'/'+str(linha['Representante'])+'/'+str(linha['Cargo Representante'])\
                    +'/'+str(linha['Data Registro ANS'])
    return str_unica

def str_escolha(string, linha):
    lista = string.split(',')
    str_unica = ''
    for coluna in lista:
        str_unica += str(linha[coluna])
    return str_unica

origins = ["*"]

app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

@app.get("/")
def root():
    return {"message": "welcome to my api"}


@app.post("/pesquisa")
def create_posts(resultado: dict = Body(...)):
    relatorio_df = pd.read_csv('./csvs/Relatorio_cadop.csv', engine='python', sep=';', skiprows=2)
    copia = relatorio_df.copy()
    pesquisa = (resultado['pesquisa']).upper()
    dict_final = {"resultado": []}
    colunas = (resultado['colunas'])
    for index, row in copia.iterrows():
        if colunas:
            unica_str = str_escolha(colunas, row)
        else:
            unica_str = todas_str(row)
        match = re.search(r'{}'.format(pesquisa), unica_str.upper())
        if match:
            matches = copia.iloc[index]
            matches_json = matches.to_json(force_ascii=False, orient='index')
            json_unico = json.loads(matches_json)
            dict_final['resultado'].append(json_unico)
    return dict_final