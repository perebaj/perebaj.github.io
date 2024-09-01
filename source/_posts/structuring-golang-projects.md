---
title: structuring golang projects
date: 2024-08-31 18:38:30
tags:
---

# Structuring Golang Projects

<img src="/images/structure.png" alt="prs" style="width:400px;"/>

Who never ask yourself about what is the best way to create a new project? Should I use the Hexagonal, DDD, Clean and these others fancy architectures? Go has a different style, but when you are a newcomer in the language, probably you don't had the enough time to consume and read all the good repositories and resources to drive your decisions. This post is a collection of my thoughts and experiences about how to structure Go projects. With name conventions, package organization, and some tips to make your codebase more readable and maintainable.

# Dilemmas

<img src="/images/structure1.png" alt="prs" style="width:200px;"/>


- Should I put everything together?
- Start small and grow?
- What is the "Go way"?


# What is non-negotiable?

- Consistency across the codebase
- Easy to change, loosely coupled
- Easy to test, that implies decoupled package with clear duties and goals
- Design reflect how the software works

## Grouping

Pros and Cons of each approach and my final decision(Yep, I have my favorite one 🧙‍♂️)

All examples will turn around an application that implements a file system, that implements an in-memory file system and a file system that uses the disk.

The entities that this file system will deal with are:

- Lamps
- Processes

<<<<<<< Updated upstream
### Flat
=======
And these operations will serve an HTTP API.

Above the structure of each approach and a brief explanation of each one.

### Flat

```txt
├── flat
│   ├── disk.go
│   ├── inmem.go
│   ├── lamps.go
│   ├── main.go
│   └── processes.go
```

>>>>>>> Stashed changes
### By Function/Layer
### By Context

## Package organization
<<<<<<< Updated upstream
=======

>>>>>>> Stashed changes
### Domain Types
### Service Types

## Names and Conventions

## Mock

Mock


# Important Resources

- [What's in a name? - Andrew Gerrand](https://go.dev/talks/2014/names.slide#19)
- [GopherCon 2018: Kat Zien - How Do You Structure Your Go Apps](https://www.youtube.com/watch?v=oL6JBUk6tj0)
- [GopherCon Russia - Ashley McNamara + Brian Ketelsen. Go best practices](https://www.youtube.com/watch?v=MzTcsI6tn-0)
- [Structuring Applications in Go](https://medium.com/@benbjohnson/3b04be4ff091)
- [Standard Package Layout](https://medium.com/@benbjohnson/standard-package-layout-7cdbc8391fc1)
