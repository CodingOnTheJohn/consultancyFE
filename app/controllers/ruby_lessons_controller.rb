class RubyLessonsController < ApplicationController
  def index
    @user = UserFacade.new.get_user(session[:user_id]) if session[:user_id]
    @ruby_lessons = RubyLessonsFacade.new.all
  end

  def show
    @user = UserFacade.new.get_user(session[:user_id]) if session[:user_id]
    @topic = "Ruby Lesson"
    @lesson = RubyLessonsFacade.new.detail(params[:id])
    binding.pry
    @formatted_lesson = markdown_to_html(@lesson.lesson)
    binding.pry
    render "shared/lesson_show"
  end

  def get_ai_response
    @response = OpenAiFacade.new.get_response(params[:id])
  end

  private

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