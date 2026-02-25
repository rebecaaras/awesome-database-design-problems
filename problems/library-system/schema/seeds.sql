-- Mock data
INSERT INTO
    book (
        isbn,
        title,
        publisher,
        year,
        category,
        available
    )
VALUES (
        '9780307269997',
        'The Road',
        'Knopf',
        2006,
        'Fiction',
        true
    ),
    (
        '9780140449136',
        'The Odyssey',
        'Penguin',
        1996,
        'Classic',
        true
    ),
    (
        '9780553386790',
        'A Game of Thrones',
        'Bantam',
        1996,
        'Fantasy',
        true
    ),
    (
        '9780061120084',
        'To Kill a Mockingbird',
        'HarperCollins',
        1960,
        'Classic',
        true
    ),
    (
        '9780307474278',
        'The Girl with the Dragon Tattoo',
        'Norstedts',
        2005,
        'Mystery',
        true
    ),
    (
        '9780439139601',
        'Harry Potter and the Goblet of Fire',
        'Bloomsbury',
        2000,
        'Fantasy',
        true
    ),
    (
        '9780141439600',
        'Pride and Prejudice',
        'Penguin',
        1813,
        'Romance',
        true
    ),
    (
        '9780307743657',
        'The Shining',
        'Doubleday',
        1977,
        'Horror',
        true
    ),
    (
        '9780385490818',
        'Fight Club',
        'W.W. Norton',
        1996,
        'Drama',
        true
    ),
    (
        '9781451673319',
        'Fahrenheit 451',
        'Simon & Schuster',
        1953,
        'Dystopian',
        true
    ),
    (
        '9780143128540',
        'Sapiens',
        'Harper',
        2011,
        'History',
        true
    ),
    (
        '9780131103627',
        'The C Programming Language',
        'Prentice Hall',
        1978,
        'Programming',
        true
    ),
    (
        '9780201633610',
        'Design Patterns',
        'Addison-Wesley',
        1994,
        'Programming',
        true
    ),
    (
        '9780596007126',
        'Head First Design Patterns',
        'O''Reilly',
        2004,
        'Programming',
        true
    ),
    (
        '9780132350884',
        'Clean Code',
        'Prentice Hall',
        2008,
        'Programming',
        true
    ),
    (
        '9781491950357',
        'Designing Data-Intensive Applications',
        'O''Reilly',
        2017,
        'Programming',
        true
    ),
    (
        '9780262033848',
        'Introduction to Algorithms',
        'MIT Press',
        2009,
        'Programming',
        true
    ),
    (
        '9780134685991',
        'Effective Java',
        'Addison-Wesley',
        2018,
        'Programming',
        true
    ),
    (
        '9780134494166',
        'Clean Architecture',
        'Prentice Hall',
        2017,
        'Programming',
        true
    ),
    (
        '9780596517748',
        'JavaScript: The Good Parts',
        'O''Reilly',
        2008,
        'Programming',
        true
    ),
    (
        '9780321125217',
        'Domain-Driven Design',
        'Addison-Wesley',
        2003,
        'Programming',
        true
    ),
    (
        '9780201485677',
        'Refactoring',
        'Addison-Wesley',
        1999,
        'Programming',
        true
    ),
    (
        '9780137081073',
        'The Clean Coder',
        'Prentice Hall',
        2011,
        'Programming',
        true
    ),
    (
        '9780131177055',
        'Agile Software Development',
        'Prentice Hall',
        2002,
        'Programming',
        true
    ),
    (
        '9781492078005',
        'Learning SQL',
        'O''Reilly',
        2020,
        'Programming',
        true
    );

INSERT INTO
    member (
        first_name,
        last_name,
        address,
        phone,
        email,
        membership_date
    )
VALUES (
        'Diego',
        'Almeida',
        'Rua D, 101',
        '11999990004',
        'diego@email.com',
        '2024-04-01'
    ),
    (
        'Fernanda',
        'Costa',
        'Rua E, 102',
        '11999990005',
        'fernanda@email.com',
        '2024-04-02'
    ),
    (
        'Gabriel',
        'Pereira',
        'Rua F, 103',
        '11999990006',
        'gabriel@email.com',
        '2024-04-03'
    ),
    (
        'Helena',
        'Ramos',
        'Rua G, 104',
        '11999990007',
        'helena@email.com',
        '2024-04-04'
    ),
    (
        'Igor',
        'Martins',
        'Rua H, 105',
        '11999990008',
        'igor@email.com',
        '2024-04-05'
    ),
    (
        'Juliana',
        'Barbosa',
        'Rua I, 106',
        '11999990009',
        'juliana@email.com',
        '2024-04-06'
    ),
    (
        'Lucas',
        'Fernandes',
        'Rua J, 107',
        '11999990010',
        'lucas@email.com',
        '2024-04-07'
    ),
    (
        'Marcos',
        'Rocha',
        'Rua K, 108',
        '11999990011',
        'marcos@email.com',
        '2024-04-08'
    ),
    (
        'Natália',
        'Melo',
        'Rua L, 109',
        '11999990012',
        'natalia@email.com',
        '2024-04-09'
    ),
    (
        'Otávio',
        'Dias',
        'Rua M, 110',
        '11999990013',
        'otavio@email.com',
        '2024-04-10'
    ),
    (
        'Paula',
        'Teixeira',
        'Rua N, 111',
        '11999990014',
        'paula@email.com',
        '2024-04-11'
    ),
    (
        'Rafael',
        'Campos',
        'Rua O, 112',
        '11999990015',
        'rafael@email.com',
        '2024-04-12'
    ),
    (
        'Sofia',
        'Cardoso',
        'Rua P, 113',
        '11999990016',
        'sofia@email.com',
        '2024-04-13'
    ),
    (
        'Tiago',
        'Monteiro',
        'Rua Q, 114',
        '11999990017',
        'tiago@email.com',
        '2024-04-14'
    ),
    (
        'Vanessa',
        'Freitas',
        'Rua R, 115',
        '11999990018',
        'vanessa@email.com',
        '2024-04-15'
    ),
    (
        'William',
        'Gomes',
        'Rua S, 116',
        '11999990019',
        'william@email.com',
        '2024-04-16'
    ),
    (
        'Yasmin',
        'Lima',
        'Rua T, 117',
        '11999990020',
        'yasmin@email.com',
        '2024-04-17'
    ),
    (
        'Zeca',
        'Araújo',
        'Rua U, 118',
        '11999990021',
        'zeca@email.com',
        '2024-04-18'
    ),
    (
        'Bruna',
        'Nunes',
        'Rua V, 119',
        '11999990022',
        'bruna@email.com',
        '2024-04-19'
    ),
    (
        'Caio',
        'Moreira',
        'Rua W, 120',
        '11999990023',
        'caio@email.com',
        '2024-04-20'
    ),
    (
        'Daniela',
        'Rezende',
        'Rua X, 121',
        '11999990024',
        'daniela@email.com',
        '2024-04-21'
    ),
    (
        'Eduardo',
        'Batista',
        'Rua Y, 122',
        '11999990025',
        'edu@email.com',
        '2024-04-22'
    ),
    (
        'Flávia',
        'Sales',
        'Rua Z, 123',
        '11999990026',
        'flavia@email.com',
        '2024-04-23'
    ),
    (
        'Gustavo',
        'Moura',
        'Rua AA, 124',
        '11999990027',
        'gustavo@email.com',
        '2024-04-24'
    );

-- LIBRARIANS
INSERT INTO
    librarian (name, email, hire_date)
VALUES (
        'Mariana Costa',
        'mariana.costa@library.com',
        '2023-05-10'
    ),
    (
        'Ricardo Lima',
        'ricardo.lima@library.com',
        '2022-08-01'
    );