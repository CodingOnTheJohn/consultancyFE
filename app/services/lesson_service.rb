class LessonService
  def initialize
  end

  def conn
    conn = Faraday.new(url: "https://codinglessons-112e8fb1f399.herokuapp.com")
  end

  def get_url(url)
    response = conn.get(url)
    json = JSON.parse(response.body, symbolize_names: true)
    json[:data]
  end

  def all_ruby
    get_url("/api/v1/ruby")
  end

  def ruby_lesson_detail(id)
    get_url("/api/v1/ruby/#{id}")
  end

  def all_javascript
    get_url("/api/v1/javascript")
  end

  def javascript_lesson_detail(id)
    get_url("/api/v1/javascript/#{id}")
  end

  def all_interview
    get_url("/api/v1/interview")
  end

  def interview_lesson_detail(id)
    get_url("/api/v1/interview/#{id}")
  end
end