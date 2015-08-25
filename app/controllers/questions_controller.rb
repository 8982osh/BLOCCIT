class QuestionsController < ApplicationController
  
  def index
    
    if params[:search]
      @questions = Question.where(title: params[:search])
    else
      @questions = Question.all
      #flash[:error] = "There is no title by that name. Please try again or create new question."
       #redirect_to @question
    end
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new(params[:id])
    @question.save
    #
  end

  def edit
    @question = Question.find(params[:id])
  end
  
  def create
    @question = Question.new(params.require(:question).permit(:title, :body))
     if @question.save
       flash[:notice] = "Your question was saved."
       redirect_to @question
     else
       flash[:error] = "There was an error saving the question. Please try again."
       render :new
     end
  end
  
  def update
    @question = Question.find(params[:id])
     if @question.update_attributes(params.require(:question).permit(:title, :body, :resolved))
       flash[:notice] = "Question was updated."
       redirect_to @question
     else
       flash[:error] = "There was an error saving the question. Please try again."
       render :edit
     end
  end
  
  def destroy
    @question = Question.destroy(params[:id])
    #@question = Question.find(params[:id])
    #@question.destroy
    flash[:notice] = "Your question has been removed."
    redirect_to @question
  end

#for checkbox  
  def resolved
    @question = Question.find(params[question:id])
    redirect_to @question
  end
  
  #search for title
  #def find
  #  @question = Question.find(params[:search])
  #end
end
