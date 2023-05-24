# app/services/openai_service.rb
require "openai"
class OpenaiService
  attr_reader :client, :prompt

  def initialize(prompt)
    @client = OpenAI::Client.new
    @prompt = prompt
  end

  def call
    begin
      response = client.chat(
        parameters: {
            model: "gpt-3.5-turbo",
            messages: [{ role: "user", content: prompt }],
            temperature: 0.7,
            stream: false,
            max_tokens: 100
        })

      # Log the full response
      Rails.logger.info "Full OpenAI API response: #{response}"

      # Rest of your code...
      puts response.inspect
      return response["choices"][0]["message"]["content"] if response
    rescue => e
      Rails.logger.error "Error calling OpenAI API: #{e.message}"
      return nil
    end
  end
end
