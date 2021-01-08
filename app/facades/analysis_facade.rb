class AnalysisFacade

  def fetch_analyses(poems)
    conn = Faraday.new(url: 'https://api.us-south.tone-analyzer.watson.cloud.ibm.com', headers: {'Accept': 'application/json'}) do |conn|
      conn.adapter Faraday.default_adapter
      conn.basic_auth("apikey", "s2jj3v6otcxk3aqAsolaoYAlmC6_ymPdzWT2_ciTnjgJ")
    end

    poems.map do |poem|
      response = conn.get('/instances/e3831969-b6cc-4741-ae7d-3aa55576299e/v3/tone?') do |req|
        req.params['version'] = '2017-09-21'
        req.params['text'] = "#{poem[:lines]}"
      end
      analysis = JSON.parse(response.body, symbolize_names: true)
      Poem.new(poem, analysis)
    end
  end
end
