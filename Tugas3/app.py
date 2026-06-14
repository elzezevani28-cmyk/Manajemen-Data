from flask import Flask

app = Flask(__name__)

@app.route("/")
def home():
    return """
    <h1>Analisis Data Sederhana</h1>
    <h3>Demo Docker</h3>
    <p>Jumlah Data : 100</p>
    <p>Rata-rata : 75.4</p>
    <p>Nilai Maksimum : 99</p>
    <p>Nilai Minimum : 45</p>
    """

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
