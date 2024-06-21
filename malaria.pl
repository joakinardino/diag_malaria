% Fatos sobre sintomas dos pacientes 
sintoma_valor(joaquim, febre_alta, 10).
sintoma_valor(joaquim, calafrios, 8).
sintoma_valor(joaquim, suores, 6).
sintoma_valor(joaquim, dor_de_cabeca, 7).
sintoma_valor(joaquim, nauseas, 5).
sintoma_valor(joaquim, vomitos, 6).
sintoma_valor(joaquim, fadiga, 4).
sintoma_valor(joaquim, dor_muscular, 5).

sintoma_valor(galileu, febre_alta, 10).
sintoma_valor(galileu, calafrios, 8).
sintoma_valor(galileu, dor_de_cabeca, 7).
sintoma_valor(galileu, nauseas, 1).
sintoma_valor(galileu, vomitos, 0).
sintoma_valor(galileu, fadiga, 1).
sintoma_valor(galileu, dor_muscular, 1).

% Regras para diagnóstico baseado nos sintomas
tem_malaria(Paciente) :-
    soma_valores_sintomas(Paciente, Soma),
    Soma >= 35.  % Limiar para diagnóstico de malária

possivel_malaria(Paciente) :-
    soma_valores_sintomas(Paciente, Soma),
    Soma >= 20.  % Limiar para diagnóstico de possível malária

% Predicado para calcular a soma dos valores dos sintomas de um paciente
soma_valores_sintomas(Paciente, Soma) :-
    findall(Valor, sintoma_valor(Paciente, _, Valor), Valores),
    sum_list(Valores, Soma).

% Consultas para diagnóstico
diagnostico(Paciente, malaria) :-
    tem_malaria(Paciente).

diagnostico(Paciente, possivel_malaria) :-
    possivel_malaria(Paciente).
