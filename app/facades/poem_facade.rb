class PoemFacade
  def search_by_author(author)
    conn = Faraday.new(url: 'https://poetrydb.org', headers: {'Accept': 'application/json'})

    response = conn.get("/author/#{author}/.json")
    poems = JSON.parse(response.body, symbolize_names: true)
  end
end
