'''
Script d'execution automatique du notebook de récupération des csv
'''

from nbconvert.preprocessors import ExecutePreprocessor
import nbformat


def run_notebook():
    with open(r'C:\Users\dimle\Documents\clone_repo\preventive_maintenance\automation_update_dataset.ipynb') as f:
        read_notebook = nbformat.read(f, as_version=4)
        execute_preprocessor = ExecutePreprocessor(timeout=600, kernel_name='python3')
        execute_preprocessor.preprocess(read_notebook, {'metadata': {'path': r'C:\Users\dimle\Documents\clone_repo\preventive_maintenance'}})
    with open(r'C:\Users\dimle\Documents\clone_repo\preventive_maintenance\automation_update_dataset.ipynb', 'w', encoding='utf-8') as f:
        nbformat.write(read_notebook, f)


run_notebook()

    
    
