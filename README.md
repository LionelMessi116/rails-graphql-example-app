# Rails Graphql API

# Getting started

## Install rvm/rbenv, ruby, rails

## Clone repository

```
git clone git@github.com:Aristat/rails-graphql-example-app.git
```

## Start

```
bin/rails db:create
bin/rails db:migrate
bin/rails db:seed

bundle exec rails s -p 3000

localhost:3000/graphiql
```

Code structure

```
.
├── fixtures                            // fixtures for specs
├── db                                  // migrations and seeds for DB
└── app
    ├── graphql                         // graphql logic
    └── controllers/graphql_controller  // graphql action with jwt auth
```

Generate token for auth

```
bin/rails c
JWTWrapper.generate_user_token(User.last)
```

this token set in headers - 

```
{
  "Authorization": "bearer example_token_from_console"
}
```

## Testing
```
RAILS_ENV=test rspec spec/
```

## Programs for testing

https://github.com/prisma/graphql-playground - for easy query writing
