<template>
  <div class="hello">
    <div class="s013">
      <form @submit.prevent="enviarPesquisa">
        <fieldset>
          <legend>PESQUISA TEXTUAL NO CADASTRO DE OPERADORAS</legend>
        </fieldset>
        <div class="inner-form">
          <div class="left">
            <div class="input-wrap first">
              <div class="input-field first">
                <label>DIGITE AQUI</label>
                <input type="text" placeholder="ex: bradesco" v-model="digitado_pesquisa" />
              </div>
            </div>
            <div class="input-wrap second">
              <div class="input-field second">
                <label>COLUNAS</label>
                <div class="input-select">
                  <select name="choices-single-defaul" v-model="escolha_colunas">
                    <option placeholder="Escolha" value="">Todas</option>
                    <option>Registro ANS</option>
                    <option>CNPJ</option>
                    <option>Razão Social</option>
                    <option>Nome Fantasia</option>
                    <option>Modalidade</option>
                    <option>Logradouro</option>
                    <option>Número</option>
                    <option>Complemento</option>
                    <option>Bairro</option>
                    <option>Cidade</option>
                    <option>UF</option>
                    <option>CEP</option>
                    <option>DDD</option>
                    <option>Telefone</option>
                    <option>Fax</option>
                    <option>Endereço eletrônico</option>
                    <option>Representante</option>
                    <option>Cargo Representante</option>
                    <option>Data Registro ANS</option>
                  </select>
                </div>
              </div>
            </div>
          </div>
          <button class="btn-search">PESQUISAR</button>
        </div>
      </form>
    </div>
    <div class="container">
      <div class="table-responsive">
      <table class="table table-bordered">
        <thead>
          <tr>
            <th scope="col">#</th>
            <th scope="col">Registro ANS</th>
            <th scope="col">CNPJ</th>
            <th scope="col">Razão Social</th>
            <th scope="col">Nome Fantasia</th>
            <th scope="col">Modalidade</th>
            <th scope="col">Logradouro</th> 
            <th scope="col">Número</th>
            <th scope="col">Complemento</th>
            <th scope="col">Bairro</th>
            <th scope="col">Cidade</th>
            <th scope="col">UF</th>
            <th scope="col">CEP</th>
            <th scope="col">DDD</th>
            <th scope="col">Telefone</th>
            <th scope="col">Fax</th>
            <th scope="col">Endereço eletrônico</th>
            <th scope="col">Representante</th>
            <th scope="col">Cargo Representante</th>
            <th scope="col">Data Registro ANS</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="(linha, index) in linhas" :key="index">
            <th scope="row">{{ index }}</th>
            <td>{{ linha['Registro ANS']}}</td>
            <td>{{ linha['CNPJ']}}</td>
            <td>{{ linha['Razão Social']}}</td>
            <td>{{ linha['Nome Fantasia']}}</td>
            <td>{{ linha['Modalidade']}}</td>
            <td>{{ linha['Logradouro']}}</td>
            <td>{{ linha['Número']}}</td>
            <td>{{ linha['Complemento']}}</td>
            <td>{{ linha['Bairro']}}</td>
            <td>{{ linha['Cidade']}}</td>
            <td>{{ linha['UF']}}</td>
            <td>{{ linha['CEP']}}</td>
            <td>{{ linha['DDD']}}</td>
            <td>{{ linha['Telefone']}}</td>
            <td>{{ linha['Fax']}}</td>
            <td>{{ linha['Endereço eletrônico']}}</td>
            <td>{{ linha['Representante']}}</td>
            <td>{{ linha['Cargo Representante']}}</td>
            <td>{{ linha['Data Registro ANS']}}</td>
          </tr>
        </tbody>
      </table>
      </div>
    </div>
  </div>
  
</template>

<script>
import api from '@/services/api.js'
export default {
  name: 'HelloWorld',
  props: {
    msg: String
  },
  data(){
    return {
        linhas: [],
        digitado_pesquisa: '',
        escolha_colunas: ''
    };
  },
  methods: {
    enviarPesquisa(){
        api.post('/pesquisa', {
          pesquisa: this.digitado_pesquisa,
          colunas: this.escolha_colunas
        })
          .then((response) => {
            this.linhas = response.data.resultado
            console.log(response.data.resultado)
          })
          .catch(function (error) {
            console.log(error);
          });
    }
  }
}

</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style>

</style>
