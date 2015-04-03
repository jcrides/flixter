class LessonsController < ApplicationController

  def show
  end

  private
  helper_method :current_lesson
  def current_lesson
    @current_lesson ||= Lesson.where(:id => params[:id]).first
  end

end
