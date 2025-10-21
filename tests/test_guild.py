import pytest
from fastapi.testclient import TestClient
from app.main import app

client = TestClient(app)

@pytest.fixture(scope="module")
def guild_data():
    return {
        "name": "TestGuild",
        "rating": 5,
        "created_at": "2025-10-21"
    }

def test_create_guild(guild_data):
    response = client.post("/guilds", json=guild_data)
    assert response.status_code == 200
    data = response.json()
    assert data["name"] == guild_data["name"]
    assert data["rating"] == guild_data["rating"]
    # повертаємо id для подальших тестів
    guild_id = data["guild_id"]
    return guild_id

def test_read_guild():
    # спочатку створимо гільдію
    response = client.post("/guilds", json={
        "name": "TempGuild",
        "rating": 2,
        "created_at": "2025-10-21"
    })
    guild_id = response.json()["guild_id"]

    # тепер перевіряємо отримання
    response = client.get(f"/guilds/{guild_id}")
    assert response.status_code == 200
    data = response.json()
    assert data["name"] == "TempGuild"
    assert data["rating"] == 2

def test_update_guild():
    # створюємо гільдію
    response = client.post("/guilds", json={
        "name": "UpdateGuild",
        "rating": 1,
        "created_at": "2025-10-21"
    })
    guild_id = response.json()["guild_id"]

    # редагуємо
    response = client.put(f"/guilds/{guild_id}", json={
        "name": "UpdatedGuild",
        "rating": 10,
        "created_at": "2025-10-21"
    })
    assert response.status_code == 200
    data = response.json()
    assert data["name"] == "UpdatedGuild"
    assert data["rating"] == 10

def test_delete_guild():
    # створюємо гільдію
    response = client.post("/guilds", json={
        "name": "DeleteGuild",
        "rating": 0,
        "created_at": "2025-10-21"
    })
    guild_id = response.json()["guild_id"]

    # видаляємо
    response = client.delete(f"/guilds/{guild_id}")
    assert response.status_code == 200
    data = response.json()
    assert data["guild_id"] == guild_id

    # перевіряємо, що її більше немає
    response = client.get(f"/guilds/{guild_id}")
    assert response.status_code == 404