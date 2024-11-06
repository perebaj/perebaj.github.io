---
title: structuring golang projects
pubDate: 2024-08-31 18:38:30
description: ''
heroImage: '/structure.png'
---

# Structuring Golang Projects


Who never ask yourself about what is the best way to create a new project? Should I use the Hexagonal, DDD, Clean and these others fancy architectures? Go has a different style, but when you are a newcomer in the language, probably you don't had the enough time to consume and read all the good repositories and resources to drive your decisions. This post is a collection of my thoughts and experiences about how to structure Go projects. With name conventions, package organization, and some tips to make your codebase more readable and maintainable.

# Dilemmas

<div style="display: flex; justify-content: center;">
    <img src="/structure1.png" alt="prs" style="width:200px;"/>
</div>

- Should I put everything together?
- Start small and grow?
- What is the "Go way"?


# What is non-negotiable?

- Consistency across the codebase
- Easy to change, loosely coupled
- Easy to test, that implies decoupled package with clear duties and goals
- Design reflect how the software works

## Grouping

### Flat

```txt
.
├── cmd
│   └── main.go
└── flat
    ├── disk.go
    ├── http.go
    ├── inmem.go
    ├── lamps.go
    ├── output.txt
    └── processes.go

```

At least for me, in a first glance, seems a good approach. Everything is together, easy to find, easy to change. But, obviously, when the projects grow, this approach will become a mess.

It's visual easy that this design will produce circular dependencies.


### By Function/Layer
### By Context

```txt
.
├── Dockerfile
├── Makefile
├── cmd
│   └── appname
│       └── main.go
├── compose.yaml
├── domain1.go
├── domain2.go
├── domain3.go
├── firestore
│   ├── domain1.go
│   └── firestore.go
├── http
│   ├── docs
│   │   └── swagger.yaml
│   ├── domain1.go
│   └── http.go
├── mock
│   └── domain1.go
├── output.txt
├── postgres
│   ├── domain1.go
│   ├── migrations
│   │   ├── migration1-down.sql
│   │   └── migration1-up.sql
│   └── postgres.go
└── pubsub
    ├── domain3.go
    └── pubsub.go
```

## Package organization

This was the best definition of how to organize packages in the golang style without screwing up the codebase. It's a 2 definition rule that shape the whole codebase.

### Domain Types

Are types that model your business domain

### Service

Are the packages that operates on or with domain types

## Names and Conventions

## Mock


# Important Resources

- [What's in a name? - Andrew Gerrand](https://go.dev/talks/2014/names.slide#19)
- [GopherCon 2018: Kat Zien - How Do You Structure Your Go Apps](https://www.youtube.com/watch?v=oL6JBUk6tj0)
- [GopherCon Russia - Ashley McNamara + Brian Ketelsen. Go best practices](https://www.youtube.com/watch?v=MzTcsI6tn-0)
- [Structuring Applications in Go](https://medium.com/@benbjohnson/3b04be4ff091)
- [Standard Package Layout](https://medium.com/@benbjohnson/standard-package-layout-7cdbc8391fc1)
- [wtf](https://github.com/benbjohnson/wtf/tree/main)
- [Kat Zien - Structure examples](https://github.com/katzien/go-structure-examples/tree/master)
