class CharactersService
  def self.conn
    @@conn ||= Faraday.new(url: "https://last-airbender-api.herokuapp.com/api/v1/characters")
  end

  def self.get_characters_data(nation_title)
    responses = []
    page_counter = 1
    response = conn.get("?affiliation=#{nation_title}+nation&perPage=25&page=#{page_counter}")
    json = JSON.parse(response.body, symbolize_names: true)
    responses << json
    page_counter += 1

    while json.count == 25 do
      response = conn.get("?affiliation=#{nation_title}+nation&perPage=25&page=#{page_counter}")
      json = JSON.parse(response.body, symbolize_names: true)
      responses << json
      page_counter += 1
    end
    
    responses.flatten
  end

  def self.parse_data(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end