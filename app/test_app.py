def test_hello(client):
    response = client.get('/')
    assert response.status_code == 200
    assert b"Hello from Flask CI/CD" in response.data

def test_health(client):
    response = client.get('/health')
    assert response.status_code == 200