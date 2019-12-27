class TodosController < ApplicationController
  def index
    all_todos = Todo.all
    render json: all_todos
  end

  def create
    p params[:title]
    p '********************************************'
    todo = Todo.new(title: params[:title], completed: false)
    if todo.save
      render json: {message: 'todo created', data: todo}
    end
  end

  def show

  end

  def update
    todo = Todo.find_by(id: params[:id])
    p " ____________________________________________________"
    p params[:todo][:completed]
    p " ++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
    if params[:todo][:completed] == false
      todo.update(completed: true)
    else
      todo.update(completed: false)
    end
    render json: todo
  end

  def destroy
    todo = Todo.find_by(id: params[:id])
    p '&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&'
    p todo
    todo.destroy
    render json: {message: 'todo deleted', data: todo}
  end
end
