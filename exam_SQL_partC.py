from SQL import run_query_select, run_update_query


def display_all_movies():
    movies = run_query_select("SELECT * FROM movies")
    for movie in movies:
        print(movie)


def search_movies_by_name():
    term = input("Enter movie name or part of it: ").strip()
    movies = run_query_select(
        "SELECT * FROM movies WHERE movie_name LIKE ?",
        (f"%{term}%",),)
    if movies:
        for movie in movies:
            print(movie)
    else:
        print("No matching movies found.")


def add_movie():
    movie_name = input("Movie name: ").strip()
    genre = input("Genre: ").strip()
    country = input("Country: ").strip()
    language = input("Language: ").strip()
    year = int(input("Year (>= 2009): ").strip())
    revenue = float(input("Revenue (>= 0): ").strip())

    new_id = run_update_query(
        """
        INSERT INTO movies (movie_name, genre, country, language, year, revenue)
        VALUES (?, ?, ?, ?, ?, ?)
        """,
        (movie_name, genre, country, language, year, revenue),
    )
    print("Movie added! ID:", new_id)


if __name__ == "__main__":
    print("1. All movies")
    display_all_movies()

    print("\n2. Search a movie")
    search_movies_by_name()

    print("\n3. Add a movie")
    add_movie()
