# pylint: skip-file
from sage.all import QQ, PolynomialRing, NumberField, ProjectiveSpace  # SageMath core objects
from sage.dynamics.all import DynamicalSystem  # For dynamical systems
from six.moves.urllib.request import urlopen  # For HTTP requests
import json

def get_sage_field_NF(label):
    """
    Get a number field from LMFDB by label, return it as a Sage NumberField object.
    """
    url = 'https://beta.lmfdb.org/api/nf_fields/?label=' + label + '&_format=json&_fields=coeffs&_delim=;'
    page = urlopen(url)
    dat = json.loads(page.read().decode('utf-8'))['data']
    
    if dat == []:
        with open('log.txt', 'a') as log_file:
            log_file.write('Field not found in LMFDB: ' + str(label) + '\n')
        return 0

    C = dat[0]['coeffs']
    if C == [0, 1]:
        return QQ

    R = PolynomialRing(QQ, 'z')
    z = R.gen()
    poly = sum(z**i * C[i] for i in range(len(C)))
    K = NumberField(poly, 'a')
    return K

def make_sage_func_NF(coeffs, field_label):
    """
    Given a field label and coefficients, return the Sage dynamical system.
    """
    K = get_sage_field_NF(field_label)
    if K == 0:
        return None 

    P = ProjectiveSpace(K, 1, 'x,y')
    R = P.coordinate_ring()
    x, y = R.gens()
    d = len(coeffs[0]) - 1

    polys = []
    for L in coeffs:
        poly = sum(x**(d - i) * y**i * K(L[i]) for i in range(d + 1))
        polys.append(poly)

    return DynamicalSystem(polys, domain=P)

data_list = [
    ['field_label_1', [[1, 0], [0, 1]], '2.0.3.1'], 
]

function_list = []
for i in range(len(data_list)):
    label = data_list[i][0]
    coeffs = data_list[i][1]
    field_label = data_list[i][2]
    result = make_sage_func_NF(coeffs, field_label)
    function_list.append([label, result])