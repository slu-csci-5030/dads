"""
Module Docstring: Handles interactions with the RERUM server for submitting and retrieving annotations.
"""

import requests

RERUM_BASE = "http://localhost:3001/v1/api"

def get_token(path="rerum_server_nodejs/token.txt"):
    """
    Read the authentication token from a file.

    Args:
        path (str): Path to the token file (default: 'rerum_server_nodejs/token.txt').

    Returns:
        str: The token string with whitespace stripped.
    """
    with open(path, encoding="utf-8") as f:
        return f.read().strip()

def submit_data(filter_data, experiment_id):
    """
    Submit filter data as an annotation to the RERUM server.

    Args:
        filter_data (str): JSON-serialized filter data.
        experiment_id (str): Unique identifier for the experiment.

    Returns:
        tuple: (bool, str) indicating success and either the annotation ID or error message.
    """
    token = get_token()
    annotation = {
        "@context": "http://www.w3.org/ns/anno.jsonld",
        "type": "Annotation",
        "body": {
            "type": "TextualBody",
            "value": filter_data
        },
        "target": experiment_id
    }
    headers = {"Authorization": f"Bearer {token}"}
    try:
        response = requests.post(
            f"{RERUM_BASE}/create",
            json=annotation,
            headers=headers
        )
        if response.status_code in (200, 201):
            data = response.json()
            annotation_id = data.get("@id", None)
            return True, annotation_id
        return False, response.text
    except Exception as e:
        return False, str(e)

def get_data(experiment_id):
    """
    Retrieve annotations for a given experiment ID from the RERUM server.

    Args:
        experiment_id (str): Unique identifier for the experiment.

    Returns:
        tuple: (list or None, str or None) containing the data or an error message.
    """
    token = get_token()
    headers = {"Authorization": f"Bearer {token}"}
    query = {"target": experiment_id}
    try:
        response = requests.post(
            f"{RERUM_BASE}/query",
            json=query,
            headers=headers
        )
        if response.status_code == 200:
            return response.json(), None
        return None, response.text
    except Exception as e:
        return None, str(e)