def select_books_titles_and_years_in_first_series_order_by_year
  "SELECT DISTINCT books.title, books.year
  FROM books
  INNER JOIN series WHERE series.id = 1
  ORDER BY books.year
  LIMIT 3;"

end

def select_name_and_motto_of_char_with_longest_motto
  "SELECT DISTINCT name, motto
  FROM characters
  ORDER BY LENGTH(motto) DESC
  LIMIT 1; "
end


def select_value_and_count_of_most_prolific_species
  "SELECT characters.species, COUNT(species) AS num_species 
  FROM characters
  GROUP BY species
  ORDER BY num_species DESC
  LIMIT 1;"
end

def select_name_and_series_subgenres_of_authors
  "SELECT authors.name,subgenres.name
  FROM series
  INNER JOIN authors
    ON series.author_id = authors.id
  INNER JOIN subgenres
    ON series.subgenre_id = subgenres.id;"
end

def select_series_title_with_most_human_characters
  "SELECT series.title
  FROM series
  INNER JOIN books
  ON books.series_id = series.id
  INNER JOIN character_books
  ON character_books.book_id = books.id
  INNER JOIN characters
  ON character_books.character_id= characters.id
  WHERE characters.species = 'human'
  GROUP BY series.id
  ORDER BY COUNT(characters.species) DESC
  LIMIT 1;"
end

def select_character_names_and_number_of_books_they_are_in
  "SELECT characters.name, COUNT(books.id)
  FROM characters
  INNER JOIN character_books
  ON characters.id=character_books.character_id
  INNER JOIN books
  on character_books.book_id=books.id
  GROUP BY characters.id
  ORDER BY COUNT(books.id) DESC;"
end
