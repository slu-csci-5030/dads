import json
import csv
from six.moves.urllib.request import urlopen
from sage.all import QQ, PolynomialRing, NumberField, ProjectiveSpace, DynamicalSystem

def get_sage_field_NF(label):
    """
    Retrieve a number field from LMFDB by label and return it as a SageMath object.

    Args:
        label (str): LMFDB label for the number field.

    Returns:
        SageMath number field or None: The number field or None if not found.
    """
    url = f'https://beta.lmfdb.org/api/nf_fields/?label={label}&_format=json&_fields=coeffs&_delim=;'
    try:
        with urlopen(url) as page:
            dat = json.loads(page.read().decode('utf-8'))['data']
        if not dat:
            with open('lmfdb_errors.log', 'a', encoding='utf-8') as log_file:
                log_file.write(f'Field not found in LMFDB: {label}\n')
            return None
        coeffs = dat[0]['coeffs']
        if coeffs == [0, 1]:
            return QQ
        R = PolynomialRing(QQ, 'z')
        z = R.gen(0)
        poly = sum(z**i * coeffs[i] for i in range(len(coeffs)))
        K = NumberField(poly, 'a')
        return K
    except Exception as e:
        with open('lmfdb_errors.log', 'a', encoding='utf-8') as log_file:
            log_file.write(f'Error retrieving field {label}: {str(e)}\n')
        return None

def make_sage_func_NF(coeffs, field_label):
    """
    Create a SageMath dynamical system from coefficients and a number field label.

    Args:
        coeffs (list): List of coefficient lists for polynomials.
        field_label (str): LMFDB label for the number field.

    Returns:
        DynamicalSystem or None: The dynamical system or None if invalid.
    """
    K = get_sage_field_NF(field_label)
    if K is None:
        return None
    P = ProjectiveSpace(K, 1, 'x,y')
    R = P.coordinate_ring()
    x, y = R.gens()
    d = len(coeffs[0]) - 1
    polys = []
    for L in coeffs:
        poly = sum(x**(d-i) * y**i * K(L[i]) for i in range(d + 1))
        polys.append(poly)
    return DynamicalSystem(polys, domain=P)

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
        with open(csv_file, 'r', encoding='utf-8') as f:
            reader = csv.reader(f)
            next(reader)  
            data_list = [
                (row[0], json.loads(row[1]), row[2])
                for row in reader
            ]
        for label, coeffs, field_label in data_list:
            dynamical_system = make_sage_func_NF(coeffs, field_label)
            if dynamical_system:
                function_list.append([label, dynamical_system])
        return function_list
    except Exception as e:
        with open('lmfdb_errors.log', 'a', encoding='utf-8') as log_file:
            log_file.write(f'Error processing CSV: {str(e)}\n')
        return []

if __name__ == "__main__":
    result = process_data('Backend/static/test_data.csv')