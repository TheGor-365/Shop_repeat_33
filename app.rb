require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database "sqlite3:pizzashop.sqlite"

class Product < ActiveRecord::Base
end

class Order <ActiveRecord::Base
end

configure do
  enable :sessions
end

helpers do
  def username
    session[:identity] ? session[:identity] : 'Hello stranger'
  end
end

before '/secure/*' do
  unless session[:identity]
    session[:previous_url] = request.path
    @error = 'Sorry, you need to be logged in to visit ' + request.path
    halt erb(:login_form)
  end
end

get '/' do
  @message = 'Can you handle a <a class="text-decoration-none" href="/secure/place">secret</a>?'
  @products = Product.all
  erb :index
end

get '/about' do
  erb :about
end

post '/place_order' do
  @order = Order.create params[:order]
  erb :oreder_placed
end

post '/cart' do
  # get params list and parse it
  @orders_input = params[:orders_input]
  @items = parse_orders_line @orders_input

  # output info about empty cart

  if @items.length == 0
    return erb :cart_is_empty
  end

  # output list of items in cart

  @items.each do |item|
    # item = [id, cnt]
    item[0] = Product.find(item[0])
  end

  # back view

  erb :cart
end

def parse_orders_line orders_input
  s1 = orders_input.split(/,/)

  arr = []

  s1.each do |x|
    s2 = x.split(/=/)
    s3 = s2[0].split(/_/)

    id = s3[1]
    cnt = s2[1]

    arr2 = [id, cnt]
    arr.push arr2
  end
  return arr
end

get '/login/form' do
  erb :login_form
end

post '/login/attempt' do
  session[:identity] = params['username']
  where_user_came_from = session[:previous_url] || '/'
  redirect to where_user_came_from
end

get '/logout' do
  session.delete(:identity)
  erb "<div class='alert alert-message'>Logged out</div>"
end

get '/secure/place' do
  erb 'This is a secret place that only <%=session[:identity]%> has access to!'
end
