MATCH (n)
DETACH DELETE n;

CREATE
(book1: Book {name: ''The Adventures of Sherlock Holmes'',
                     author: ''Arthur Conan Doyle'',
                     year_of_publishing: 1892}),
       (book2: Book {name: ''All the King\''s Men'',
                     author: ''Robert Penn Warren'',
                     year_of_publishing: 1946}),
       (book3: Book {name: ''The Lord of the Rings'',
                     author: ''John Ronald Reuel Tolkien'',
                     year_of_publishing: 1954}),
       (book4: Book {name: ''The Old Man and the Sea'',
                     author: ''Ernest Hemingway'',
                     year_of_publishing: 1952}),
       (book5: Book {name: ''Harry Potter and the Philosopher\''s Stone'',
                     author: ''Joanne Rowling'',
                     year_of_publishing: 1997}),
       (book6: Book {name: ''A Farewell to Arms'',
                     author: ''Ernest Hemingway'',
                     year_of_publishing: 1929})

CREATE
(country1: Country {name: ''United Kingdom''}),
       (country2: Country {name: ''United States''}),
       (country3: Country {name: ''Bahamas''})

CREATE
(rater1: Rater {name: ''Vadim'', age: 19, sex: ''male''}),
       (rater2: Rater {name: ''Vlad'', age: 25, sex: ''male''}),
       (rater3: Rater {name: ''Ilja'', age: 44, sex: ''male''}),
       (rater4: Rater {name: ''Masha'', age: 17, sex: ''female''}),
       (rater5: Rater {name: ''Dasha'', age: 24, sex: ''female''})

CREATE
((book1)-[:was_written_in]->(country1)),
       ((book2)-[:was_written_in]->(country2)),
       ((book3)-[:was_written_in]->(country1)),
       ((book4)-[:was_written_in]->(country3)),
       ((book5)-[:was_written_in]->(country1)),
       ((book6)-[:was_written_in]->(country2))

CREATE
((rater1)-[:RATING {book_rating: 5}]->(book1)),
       ((rater1)-[:RATING {book_rating: 8}]->(book4)),
       ((rater1)-[:RATING {book_rating: 9}]->(book5)),
       ((rater1)-[:RATING {book_rating: 2}]->(book6)),

       ((rater2)-[:RATING {book_rating: 4}]->(book1)),
       ((rater2)-[:RATING {book_rating: 2}]->(book2)),
       ((rater2)-[:RATING {book_rating: 8}]->(book3)),
       ((rater2)-[:RATING {book_rating: 1}]->(book5)),
       ((rater2)-[:RATING {book_rating: 10}]->(book6)),

       ((rater3)-[:RATING {book_rating: 0}]->(book1)),
       ((rater3)-[:RATING {book_rating: 5}]->(book2)),
       ((rater3)-[:RATING {book_rating: 7}]->(book3)),
       ((rater3)-[:RATING {book_rating: 9}]->(book4)),
       ((rater3)-[:RATING {book_rating: 5}]->(book5)),
       ((rater3)-[:RATING {book_rating: 3}]->(book6)),

       ((rater4)-[:RATING {book_rating: 9}]->(book1)),
       ((rater4)-[:RATING {book_rating: 8}]->(book2)),
       ((rater4)-[:RATING {book_rating: 7}]->(book3)),
       ((rater4)-[:RATING {book_rating: 6}]->(book4)),
       ((rater4)-[:RATING {book_rating: 5}]->(book5)),
       ((rater4)-[:RATING {book_rating: 4}]->(book6)),

       ((rater5)-[:RATING {book_rating: 3}]->(book1)),
       ((rater5)-[:RATING {book_rating: 2}]->(book2)),
       ((rater5)-[:RATING {book_rating: 1}]->(book5)),
       ((rater5)-[:RATING {book_rating: 2}]->(book6))