class TodosController < ApplicationController

    skip_before_action :verify_authenticity_token, 
    :only => [:custom_auth, :update_done]
  
    layout 'todo_layout'
    
  def index
      @todos = Todo.getall
  end

  def show
      @todo = Todo.find(params[:id])
  end

  def new
      @todo = Todo.new
  end
    
  def create
      @todo = Todo.new(todo_params)
      if @todo.save
          flash[:notice] = "Task created!"
          redirect_to(:action => 'index')
      else
          render('new')
      end
  end
    
  def edit
      @todo = Todo.find(params[:id])
  end
    
  def update
      @todo = Todo.find(params[:id])
      if @todo.update_attributes(todo_params)
          flash[:notice] = "Task updated!"
          redirect_to(:action => 'index')
      else
          render('edit')
      end 
  end

  def delete
      @todo = Todo.find(params[:id])
  end
  def destroy
      todo = Todo.find(params[:id]).destroy
      flash[:notice] = "Task deleted!"
      redirect_to(:action => 'index')
  end
    
  def update_done
      
      p params
      @todo = Todo.find(params[:id])
      if @todo.update_attributes(todo_params)
          flash[:notice] = "Task updated!"
      else
          flash[:notice] = "Niet!"
      end
      
      respond_to do |format|
          format.html {render :nothing => true, :statusText => "SEMEK!"}
      end
  end
      
      private
      def todo_params
          params.require(:todo).permit(:header, :content, :done)
      end
end
