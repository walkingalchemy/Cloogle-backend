<p align="center"><img src="https://png.icons8.com/dotty/64/000000/grid.png"></p>

# Cloogle Crossword
> A dynamic crossword web app

Cloogle is a web based crossword app allowing users to complete and save crosswords from a historical database of New York Times crossword puzzles [hosted here](https://github.com/doshea/nyt_crosswords).

This is the repository for the Ruby on Rails backend that serves the JSON API. The frontend api repository resides at: [Cloogle-Backend](https://github.com/walkingalchemy/Cloogle-backend).




## Installing / Getting started

This project uses [Rails 5.1.4](http://weblog.rubyonrails.org/2017/8/24/Rails-5-1-4-rc1-and-5-0-6-rc1-released/).  It also uses the [Postgres](https://www.postgresql.org/) database. Go check them out if you don't have them locally installed. 

Fork and/or clone the repository down then from within the top level directory run:

```shell
rails db:create
rails db:migrate
```
to get the server database spun up locally.
Then
```shell
rails s
```
to get it serving to your local host.

The frontend client is set by default to point to a backend running on localhost:3000 which is the Rails server default if nothing else is running.


## Api Reference
```
     api_v1_boards GET   /api/v1/boards(.:format)                                  api/v1/boards#index
      api_v1_board GET   /api/v1/boards/:id(.:format)                              api/v1/boards#show
      api_v1_users POST  /api/v1/users(.:format)                                   api/v1/users#create
       api_v1_user PATCH /api/v1/users/:id(.:format)                               api/v1/users#update
                   PUT   /api/v1/users/:id(.:format)                               api/v1/users#update
            api_v1 GET   /api/v1/users/:name(.:format)                             api/v1/users#show
api_v1_board_users POST  /api/v1/board_users(.:format)                             api/v1/board_users#create
                   GET   /api/v1/board_users/:user_id/:board_id(.:format)          api/v1/board_users#show
                   PATCH /api/v1/board_users/:user_id/:board_id(.:format)          api/v1/board_users#update
                   PATCH /api/v1/board_users/progress/:user_id/:board_id(.:format) api/v1/board_users#update_progress

```

## Licensing
[MIT](https://oss.ninja/mit?organization=Sebastian%20Royer) 
Copyright 2018 [Sebastian Royer](https://github.com/walkingalchemy) and [Matt McAlister](https://github.com/matt-mcalister)


## Thanks to:
<a href="https://icons8.com">Icon pack by Icons8</a>
