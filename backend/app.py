from src import create_app #desde __init__.py porque la carpeta se transforma en paquete al tener un __init__.py

app = create_app()

if __name__ == "__main__":
    app.run(debug=True)
