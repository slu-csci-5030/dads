"""
Module Docstring: Processes number fields and dynamical systems from LMFDB data using SageMath.
"""

import json
import csv
from six.moves.urllib.request import urlopen
from sage.all import QQ, PolynomialRing, NumberField, ProjectiveSpace, DynamicalSystem

def get_sage_field_nf(label):
    """
    Retrieve a number field from LMFDB by label and return it as a SageMath object.

    Args:
        label (str): LMFDB label for the number field.

    Returns:
        SageMath number field or None: The number field or None if not found.
    """
    base_url = 'https://beta.lmfdb.org/api/nf_fields/'
    query = f'?label={label}&_format=json&_fields=coeffs&_delim=;'
    url = base_url + query
    try:
        with urlopen(url) as page:
            data = json.loads(page.read().decode('utf-8'))['data']
        if not data:
            with open('lmfdb_errors.log', 'a', encoding='utf-8') as log_file:
                log_file.write(f'Field not found in LMFDB: {label}\n')
            return None
        coeffs = data[0]['coeffs']
        if coeffs == [0, 1]:
            return QQ
        ring = PolynomialRing(QQ, 'z')
        z_var = ring.gen(0)
        poly = sum(z_var**i * coeffs[i] for i in range(len(coeffs)))
        field = NumberField(poly, 'a')
        return field
    except Exception as e:
        with open('lmfdb_errors.log', 'a', encoding='utf-8') as log_file:
            log_file.write(f'Error retrieving field {label}: {str(e)}\n')
        return None

def make_sage_func_nf(coeffs, field_label):
    """
    Create a SageMath dynamical system from coefficients and a number field label.

    Args:
        coeffs (list): List of coefficient lists for polynomials.
        field_label (str): LMFDB label for the number field.

    Returns:
        DynamicalSystem or None: The dynamical system or None if invalid.
    """
    field = get_sage_field_nf(field_label)
    if field is None:
        return None
    projective_space = ProjectiveSpace(field, 1, 'x,y')
    coord_ring = projective_space.coordinate_ring()
    x_var, y_var = coord_ring.gens()
    degree = len(coeffs[0]) - 1
    polynomials = []
    for coeff_list in coeffs:
        poly = sum(
            x_var**(degree-i) * y_var**i * field(coeff_list[i])
            for i in range(degree + 1)
        )
        polynomials.append(poly)
    return DynamicalSystem(polynomials, domain=projective_space)

def process_data(csv_file='data.csv'):
    """
    Read data from a CSV file and create a list of dynamical systems.

    Args:
        csv_file (str): Path to the CSV file containing (label, coeffs, field_label).

    Returns:
        list: List of [label, dynamical_system] pairs.
    """
    function_list = []
    try:
        with open(csv_file, 'r', encoding='utf-8') as file:
            reader = csv.reader(file)
            next(reader)  # Skip header if present
            data_list = [
                (row[0], json.loads(row[1]), row[2])  # coeffs is JSON-encoded
                for row in reader
            ]
        for label, coeffs, field_label in data_list:
            dynamical_system = make_sage_func_nf(coeffs, field_label)
            if dynamical_system:
                function_list.append([label, dynamical_system])
        return function_list
    except Exception as e:
        with open('lmfdb_errors.log', 'a', encoding='utf-8') as log_file:
            log_file.write(f'Error processing CSV: {str(e)}\n')
        return []

if __name__ == "__main__":
    result = process_data('sample_data.csv')
    print(result)