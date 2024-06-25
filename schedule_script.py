'''
Script d'execution automatique du notebook de récupération des csv
'''

from nbconvert.preprocessors import ExecutePreprocessor
import nbformat

from datetime import date


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


# # cration date du jour
aujourdhui = date.today()
aujourdhui = aujourdhui.strftime('%Y-%m-%d')

run_notebook(aujourdhui)

    
    
