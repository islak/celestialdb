from flask import Flask, jsonify
import psycopg2
import os
from dotenv import load_dotenv

app = Flask(__name__)

# Load environment variables from .env file
load_dotenv()

# Database connection parameters
db_params = {
    'dbname': os.getenv('DB_NAME'),
    'user': os.getenv('DB_USER'),
    'password': os.getenv('DB_PASSWORD'),
    'host': os.getenv('DB_HOST'),
    'port': os.getenv('DB_PORT')
}

# Function to fetch data from PostgreSQL
def fetch_data(query):
    connection = psycopg2.connect(**db_params)
    cursor = connection.cursor()
    cursor.execute(query)
    data = cursor.fetchall()
    cursor.close()
    connection.close()
    return data

@app.route('/')
def index():
    return 'HALO'


# Route to return JSON data for galaxies
@app.route('/galaxies')
def galaxies():
    query = "SELECT * FROM galaxy"
    data = fetch_data(query)
    return jsonify({'galaxies': data})

# Route to return JSON data for stars
@app.route('/stars')
def stars():
    query = "SELECT * FROM star"
    data = fetch_data(query)
    return jsonify({'stars': data})

# Route to return JSON data for planets
@app.route('/planets')
def planets():
    query = "SELECT * FROM planet"
    data = fetch_data(query)
    return jsonify({'planets': data})

# Route to return JSON data for moons
@app.route('/moons')
def moons():
    query = "SELECT * FROM moon"
    data = fetch_data(query)
    return jsonify({'moons': data})

if __name__ == '__main__':
    app.run(debug=True)
