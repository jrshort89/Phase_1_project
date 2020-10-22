require "bundler/setup"
Bundler.require


require_all 'app/models'

ENV["SINATRA_ENV"] ||= 'development'
ActiveRecord::Base.establish_connection(ENV["SINATRA_ENV"].to_sym)

Menu.start_menu
# Api.get_beer_list("https://data.opendatasoft.com/api/records/1.0/search/?dataset=open-beer-database%40public-us&rows=200&facet=style_name&facet=cat_name&facet=name_breweries&facet=country&refine.country=United+States")
