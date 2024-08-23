class LessonService
  def initialize
  end

  def conn
    conn = Faraday.new(url: "https://codinglessons-112e8fb1f399.herokuapp.com")
    # conn = Faraday.new(url: "http://localhost:5000")
  end

  def get_url(url, params = {})
    response = conn.get(url, params)
    json = JSON.parse(response.body, symbolize_names: true)
    json[:data]
  end

  def all_lessons(type)
    get_url("/api/v1/lessons", { type: type })
  end

  def lesson_detail(id)
    get_url("/api/v1/lessons/#{id}")
  end
end
