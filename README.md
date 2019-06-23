# Rails Graphql API

# Getting started

## Install rvm/rbenv, ruby, rails

## Clone repository

```
git clone git@github.com:Aristat/rails-graphql-example-app.git
```

## Start

```
rake db:create
rake db:migrate
rake db:seed

bundle exec rails s -p 3000

localhost:3000/graphiql
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

Examples queries and mutations in fixtures/graphql/*

## Testing
```
RAILS_ENV=test rspec spec/
```

## Programs for testing

https://github.com/prisma/graphql-playground - for easy query writing
