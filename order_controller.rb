require 'sinatra'
require 'sinatra/contrib/all' if development?
require 'pry-byebug'
require_relative './models/order.rb'

get '/orders/new' do
  erb(:new)
end

get '/orders' do
  @orders = Order.all()
  erb(:index)
end

post '/orders' do

  @order = Order.new(params)
  @order.save
  erb(:create)
end