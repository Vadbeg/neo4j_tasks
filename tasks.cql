// 1. Get all books written in United Kingdom
MATCH (book: Book) - [:was_written_in] -> (country1: Country {name: 'United Kingdom'})
WITH collect(DISTINCT book.name) as book_name
UNWIND book_name as new_book_name
RETURN new_book_name;

// 2. Get all raters and book names with rater name Vadim and book rating > 7
MATCH ((rater: Rater)-[br: RATING]->(book: Book))
WHERE rater.name = 'Vadim' and br.book_rating > 7
RETURN rater.name, book.name;

// 3. Get all books authors rated by female older than 20 years
MATCH ((rater: Rater)-[br: RATING]->(book: Book))
WHERE rater.sex = 'female' and rater.age > 20
WITH collect(DISTINCT book.author) as book_author
UNWIND book_author as new_book_author
RETURN new_book_author;

// 4. Get all books published before 1945
MATCH (book: Book)
WHERE book.year_of_publishing < 1945
RETURN book.name, book.author;

// 5. Get all books not rated by Vadim
MATCH (rater: Rater {name: 'Vadim'})-[br: RATING]->(book: Book)
WITH collect(DISTINCT book) as books_read
MATCH (book: Book)
WHERE NOT book IN books_read
RETURN book.name, book.author;

// 6. Get all books written not by Ernest Hemingway
MATCH (book: Book {author: 'Ernest Hemingway'})
WITH collect(DISTINCT book) as books_by_hemingway
MATCH (book: Book)
WHERE NOT book IN books_by_hemingway
RETURN book.name, book.author;

// 7. Get all books with average rating higher than 7.0
MATCH ((rater: Rater)-[curr_rating: RATING]->(book: Book))
WITH book.name as book_name, avg(curr_rating.book_rating) as average_rating
WHERE average_rating > 6.0
RETURN book_name, average_rating
ORDER BY average_rating;

// 8. Get all countries with average rating of the book lower than 5.0
MATCH ((rater: Rater)-[curr_rating: RATING]->(book: Book)-[was_written:was_written_in]->(country: Country))
WITH country.name as country_name, avg(curr_rating.book_rating) as average_rating
WHERE average_rating < 5.0
RETURN country_name, average_rating
ORDER BY average_rating;

// 9. Get all male raters older than 19 which rated The Old Man and the Sea
MATCH ((rater: Rater)-[curr_rating: RATING]->(book: Book {name: 'The Old Man and the Sea'}))
WHERE rater.age > 19
RETURN rater.name;

// 10. Get all raters which rated all of the books
MATCH (all_books: Book)
WITH count(all_books) as number_of_all_books
MATCH ((rater: Rater)-[curr_rating: RATING]->(book: Book))
WITH rater.name as rater_name,
     count(book) AS number_of_books_by_rater,
     number_of_all_books as number_of_all_books
WHERE number_of_books_by_rater = number_of_all_books
RETURN rater_name;
