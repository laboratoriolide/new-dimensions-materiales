import pandas as pd
import numpy as np

def calcular_cubo(numero):
    '''
    Función que calcula el cubo de un número
    
    Parámetros:
    - numero (entero o decimal): Es un valor numérico

    Retorna:
    - numero_cubo (entero o decimal): Es el cubo del número ingresado
    '''
    numero_cubo = numero ** 3
    return numero_cubo


def calcular_cuadrado(numero):
    '''
    Función que calcula el cuadrado de un número
    
    Parámetros:
    - numero (entero o decimal): Es un valor numérico

    Retorna:
    - numero_cuadrado (entero o decimal): Es el cuadrado del número ingresado
    '''
    numero_cuadrado = numero ** 2
    return numero_cuadrado


def media_desviacion(x, desviacion = True):
    media = np.mean(x)
    if desviacion == True:
        desviacion = np.std(x)
        resultados = pd.DataFrame({'Media': [media], 'Desviacion': [desviacion]})
    else:
        resultados = pd.DataFrame({'Media': [media]})
    return resultados