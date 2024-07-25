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

  def ruby_detail(id)
    get_url("/api/v1/ruby/#{id}")
  end
end