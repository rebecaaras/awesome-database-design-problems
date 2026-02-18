# Solutions to [Awesome Database Design Problems](./awesome_db_design_problems.md)

This folder is my personal expansion with solutions for the very nice [Database Design Problems](https://github.com/StructuredCS/awesome-database-design-problems) curated by [Dr. Qiang Hao](https://qhao.info/)

[Here](./awesome_db_design_problems.md) you can understand more about the structure and goals of the problems.

Within the [problems](/problems) folder there are the folders with solutions for each problems. Rules for each problem are given in the .md file and a ER diagram might have been provided as a .png from the original author or by me.

Currently only the library-system problem is solved, but hopefully soon I'll add comprehensive solutions for all problems.

The main file is db_decisions.md in each folder. Which carries all the main decisions explanations.

You can also execute each schema and reproduce the database on your machine.

```
problems
   ├── library-system
   │   ├── db_decisions.md -> main file
   │   ├── library-system.md -> problem description
   │   ├── library-system.png -> ER diagram
   │   └── schema
   │   |   ├── author.sql
   │   |   ├── book_author.sql
   │   |   ├── book.sql
   │   |   └── member.sql
       ├── erd.dbml (ER diagram, visualize [here](https://dbdiagram.io/d))

```

Feel free to suggest improvements and contribute!
