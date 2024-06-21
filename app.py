from flask import Flask, render_template, request

app = Flask(__name__)

# Dicionário de sintomas com valores numéricos
sintomas_valores = {
    'febre_alta': 10,
    'calafrios': 8,
    'suores': 6,
    'dor_de_cabeca': 7,
    'nauseas': 5,
    'vomitos': 6,
    'fadiga': 4,
    'dor_muscular': 5
}

# Função para calcular o diagnóstico baseado nos sintomas fornecidos
def diagnostico(paciente, sintomas):
    valor_total = sum(sintomas.get(sintoma, 0) for sintoma in sintomas_valores)
    
    # Defina os limiares para diagnóstico de malária e possível malária
    limiar_malaria = 35
    limiar_possivel_malaria = 20
    
    if valor_total >= limiar_malaria:
        return 'malaria'
    elif valor_total >= limiar_possivel_malaria:
        return 'possivel_malaria'
    else:
        return 'sem_diagnostico'

# Rota para página inicial
@app.route('/', methods=['GET', 'POST'])
def index():
    if request.method == 'POST':
        paciente = request.form['paciente']
        sintomas = {}
        for sintoma in sintomas_valores:
            valor = request.form.get(sintoma, 0)
            sintomas[sintoma] = int(valor)
        
        resultado_diagnostico = diagnostico(paciente, sintomas)
        return render_template('index.html', resultado=resultado_diagnostico, paciente=paciente, sintomas_valores=sintomas_valores)
    
    return render_template('index.html', sintomas_valores=sintomas_valores)

if __name__ == '__main__':
    app.run(debug=True)
