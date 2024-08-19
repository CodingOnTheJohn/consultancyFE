class LessonsController < ApplicationController
  before_action :set_user
  before_action :set_lesson_type

  def index
    @lessons = LessonsFacade.new(@lesson_type).all
  end

  def show
    @topic = "#{@lesson_type.capitalize} Lesson"
    @lesson = LessonsFacade.new.detail(params[:id])
    @formatted_lesson = markdown_to_html(@lesson.lesson)
    render "shared/lesson_show"
  end
  
  def get_ai_response
    @response = OpenAiFacade.new.get_response(params[:id])
  end

  private

  def set_user
    @user = UserFacade.new.get_user(session[:user_id]) if session[:user_id]
  end

  def set_lesson_type
    @lesson_type = params[:type]
  end

  def markdown_to_html(content)
    renderer = Redcarpet::Render::HTML.new
    markdown = Redcarpet::Markdown.new(renderer, {
      autolink: true,
      tables: true,
      fenced_code_blocks: true,
      strikethrough: true,
      superscript: true,
      underline: true,
      highlight: true,
      quote: true,
      footnotes: true,
      lax_spacing: true
    })
    markdown.render(content).html_safe
  end
end