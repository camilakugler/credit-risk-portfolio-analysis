# Projeto Análise Histórica de Risco de Crédito

# Importando bibliotecas necessárias
import pandas as pd

# Carregando o arquivo CSV com os dados
df = pd.read_csv("C:\\Users\\user\\Downloads\\dataset\\archive\\accepted_2007_to_2018q4.csv\\accepted_2007_to_2018Q4.csv")

# Exibindo as primeiras linhas do DataFrame para inspeção inicial
print(df.head())
df.info(verbose=True, show_counts=True)  # Exibindo informações sobre o DataFrame, como tipos de dados e valores nulos
print(df.shape)
print(df.describe())

# Convertendo colunas para o tipo apropriado, se necessário
df["issue_d"] = pd.to_datetime(df["issue_d"], format="%b-%Y", errors="coerce")

# Selecionando o período que iremos analisar
df_projeto = df[
    (df["term"].str.strip() == "36 months") &
    (df["issue_d"].dt.year.between(2011, 2015))
]

print(df_projeto.shape)

# Verificando os valores nulos no DataFrame filtrado
print(df_projeto.isnull().sum().to_string())
print(df_projeto[df_projeto["dti"].isnull()][["id", "annual_inc", "dti", "loan_status"]])

# Verificando duplicados no DataFrame filtrado
print("Linhas duplicadas:", df_projeto.duplicated().sum())
print("IDs duplicados:", df_projeto["id"].duplicated().sum())

# Verificando valores zero na coluna 'annual_inc'
print((df_projeto["annual_inc"] == 0).sum())

# Selecionando as colunas para análise no PostgreSQL
colunas = [
    "id",
    "issue_d",
    "term",
    "loan_amnt",
    "funded_amnt",
    "loan_status",
    "grade",
    "int_rate",
    "annual_inc",
    "dti",
    "purpose"
]

df_final = df_projeto[colunas].copy()

# Verificando o resultado
print(df_final.shape)
print(df_final.head())

# Exportando os dados preparados
df_final.to_csv("credit_risk_data.csv", index=False)

print("Arquivo CSV exportado com sucesso!")