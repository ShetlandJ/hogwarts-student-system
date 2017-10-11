require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')

require_relative('./models/student')



get '/students' do
    @students = Student.all()
    erb (:index)
end

get '/students/gryffindor' do
    @students = Student.all()
    erb (:gryffindor)
end

get '/students/slytherin' do
  @students = Student.all()
  erb (:slytherin)
end

get '/students/ravenclaw' do
    @students = Student.all()
    erb (:ravenclaw)
end

get '/students/hufflepuff' do
    @students = Student.all()
    erb (:hufflepuff)
end

get '/students/new' do
  @houses = House.all()
  erb (:new)
end

get '/students/about' do
  @houses = House.all()
  erb ( :about )
end

get '/students/:id' do
  @student = Student.find(params['id'])
  erb ( :show )
end

get '/students/:id/edit' do
  @student = Student.find(params['id'])
  @houses = House.all()
  erb ( :edit )
end

post '/students/:id' do
  @student = Student.new(params)
  @student.update()
  erb ( :update )
end

post '/students/:id/delete' do
  @student = Student.find(params['id'])
  @student.delete()
  erb ( :delete )
end

post '/students' do
  @student = Student.new(params)
  @student.save()
  erb( :create )
end
