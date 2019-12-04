from app import app

client = app.test_client()


def test_get_index_status_200():
    res = client.get("/")
    assert res.status_code == 200


def test_get_index_content_200():
    res = client.get("/")
    assert res.get_data() == b"new flask app"
