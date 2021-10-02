# Proyecto-A: Minesweeper 💥💣
## Curso IIC3745 2021-2 📚

- Prof. Juan P. Sandoval
- Ayudante: Javier Ojeda

## Integrantes 👥

- Rodrigo Alonso
- Barbara Irrarrazaval
- Amaia Juanchuto
- Javiera Ochoa
- Daniela Poblete

## Descripción Aplicación 💬

- Lenguaje: Esta aplicación esta implementada en Ruby v3.0. 
- Arquitectura: Se utilizó una arquitectura MVC (Modelo - Vista - Controlador). 
- Tets: Se realizaron tests unitarios con la libreria de Unit Tests de Ruby.
- La aplicación posee la siguiente división:
    - Modelo
        - `board_creation.rb`
        - `cell.rb`
        - `game_model.rb`
    - Controlador
        - `game_controller.rb`
        - `game_menu.rb`
        - `input_validations.rb`
    - Vista
        - `game_menu_view.rb`
        - `game_view.rb`
    - Tests
        - `cell_test.rb`
        - `controller_test.rb`
        - `create_board_test.rb`
        - `game_menu_stub.rb`
        - `game_menu_test.rb`
        - `game_test.rb`
        - `initialize_model_test.rb`
        - `input_validations_test.rb`
        - `model_stub.rb`
        - `observer_test.rb`
        - `test_helper.rb`
        - `winner_test.rb`


## Comandos importantes ‼️ 

- Descargar aplicación: git clone https://github.com/chic-s-testing/Proyecto-A.git

- Instalar dependencias: bundle install

- Correr tests y rubocop: rake

- Generar reporte de coverage: rake test:all

- Jugar el juego: ruby lib/main.rb

## Video Tutorial de uso 🌐

- https://youtu.be/xtw-EHcRHdk
