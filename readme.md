# Animal Crossing Villager Database

## A database to reference the villagers I've invited to my Animal Crossing: New Horizons island

### API Reference

WIP: endpoint paths, methods, parameters

endpoints example:

**Villagers**

- index: GET /villagers
- show: GET /villagers/:id
- create: POST /villagers
- delete: DELETE /villagers

### Project Evolution

My [entity relationship diagrams](https://ticiax.notion.site/Create-ER-diagram-42bc26586a7d462586a8bf13ae0e17cd) show some of the evolution of my project: the first three diagrams show how I was figuring out the table structure and creating the proper relationships between them in SQL, then I corrected the relationships as I recreated my database/table structures with Flask/SQLAlchemy. Right now, I'm still implementing the basic functions and endpoints, but in the future hope to create a complete web app with a frontend for user access.

### ORM Implementation

While using SQL would've been simpler to get started with, I wanted to build my experience with Flask and SQLAlchemy. I found that it also helped when inputting the initial values for some tables, since I could automate some repetitive values with Python.

```python
import itertools

combo = [['Blue Mtn', 'Kilimanjaro', 'Mocha', 'Blend'],
         [0, 1, 2, 3],
         [0, 1, 2, 3]]
blends = list(itertools.product(*combo))
coffees = []
for b in blends:
    c = Coffee(beans=b[0], milk=b[1], sugar=b[2])
    coffees.append(c)

for c in coffees:
    db.session.add(c)
db.session.commit()
```

Using itertools, I created a list of all possible coffee combinations, then passed each of those values to be added to the coffees table.

### Roadmap

I've created a kanban board of my progress and new features I want to implement in this project, which I will keep adding to: [Link](https://ticiax.notion.site/SQL-portfolio-project-roadmap-db0e1f572e4a4e31bc6e56f2571f46e6)

### Issues

I'm currently facing a couple of challenges that will prevent further progress, so these will be tackled before implementing any improvements:

- When updating models.py, flask db migrate and flask db upgrade don't reflect changes made in Classes - how do I make sure my tables are properly updated?
- How to make create endpoint that passes only required parameters, with nullable parameters optional? My current Villagers table has a lot of parameters, and I'd like to streamline the create endpoint.