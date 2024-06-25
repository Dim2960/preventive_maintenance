from nbconvert.preprocessors import ExecutePreprocessor
import nbformat

from datetime import datetime, timedelta


def run_notebook(date:str):
    with open(r'save_db_to_sql.ipynb', encoding='utf-8') as f:
        read_notebook = nbformat.read(f, as_version=4)

        # Créer une nouvelle cellule de code pour définir la variable
        variable_cell = nbformat.v4.new_code_cell(f'aujourdhui = "{date}"')
        
        # Insérer la nouvelle cellule au début du notebook
        read_notebook.cells.insert(0, variable_cell)

        execute_preprocessor = ExecutePreprocessor(timeout=600, kernel_name='python3')
        execute_preprocessor.preprocess(read_notebook, {'metadata': {'path': r'C:\Users\dimle\Documents\clone_repo\preventive_maintenance'}})

        # Supprimer la cellule ajoutée après l'exécution
        read_notebook.cells.pop(0)

    with open(r'save_db_to_sql.ipynb', 'w', encoding='utf-8') as f:
        nbformat.write(read_notebook, f)


# Définition des dates de début et de fin
debut = datetime(2024, 6, 5)  # Date de début (année, mois, jour)
fin = datetime(2024, 6, 24)  # Date de fin (année, mois, jour)

# Liste pour stocker les dates
list_date = []

# Boucle pour générer les dates entre début et fin
while debut <= fin:
    list_date.append(debut.strftime('%Y-%m-%d'))  # Formatage de la date comme chaîne de caractères
    debut += timedelta(days=1)  # Incrémentation d'un jour


compteur = 1

for date in list_date:
    print(f'jour n {compteur} sur {len(list_date)}\n')
    run_notebook(date)
    compteur += 1

