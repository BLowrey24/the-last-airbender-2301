class SearchController < ApplicationController
  def index
    nation = params[:nation]

    conn = Faraday.new(url: "https://last-airbender-api.fly.dev/api/v1/") do |faraday|
    end
      
    response = conn.get("characters?affiliation=#{nation}")

    json = JSON.parse(response.body, symbolize_names: true)
    @characters = json
  end
end