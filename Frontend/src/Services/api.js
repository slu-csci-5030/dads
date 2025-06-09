export const submit_annotation = async (annotation_text, experiment_id) => {
    try {
        const response = await fetch('http://localhost:3001/v1/api/create', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'Authorization': `Bearer ${getToken()}`
            },
            body: JSON.stringify({
                "@context": "http://www.w3.org/ns/anno.jsonld",
                "type": "Annotation",
                "body": {
                    "type": "TextualBody",
                    "value": annotation_text
                },
                "target": experiment_id
            })
        });
        if (response.status === 200 || response.status === 201) {
            const data = await response.json();
            return [true, data['@id']];
        } else {
            return [false, await response.text()];
        }
    } catch (error) {
        return [false, error.message];
    }
};

// Mock getToken function (replace with actual token retrieval logic)
const getToken = () => {
    // Replace with logic to read token from a secure source
    return 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkZXYtdXNlciIsIm5hbWUiOiJEZXZlbG9wZXIiLCJhdWQiOiJsb2NhbC1kZXYiLCJpc3MiOiJodHRwOi8vbG9jYWxob3N0OjMwMDAvIiwibG9jYWxob3N0L2FnZW50IjoiZGV2aUBleGFtcGxlLmNvbSIsImlhdCI6MTc0OTQ4MzU3NywiZXhwIjoxNzQ5NTY5OTc3fQ.TkiEfGhm_9FLH3a3Q7dB4a2qJmzrfIhayfK0CggYau8';
};