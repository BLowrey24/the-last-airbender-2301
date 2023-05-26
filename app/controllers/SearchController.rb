class SearchController < ApplicationController
  def index
    nation = params[:nation]

    conn = Faraday.new(url: "https://last-airbender-api.fly.dev/api/v1/") do |faraday|
    end
      
    response = conn.get("characters?affiliation=#{nation}", perPage: 200)

    json = JSON.parse(response.body, symbolize_names: true)
    @characters = json.take(25)
    @all_nation_members = json.size
  end
end