# frozen_string_literal: true

class ChatService
  def conn
    Faraday.new(url: 'https://api.openai.com/v1/completions') do |f|
      f.headers['Content-Type'] = 'application/json'
      f.headers['Authorization'] = "Bearer #{ENV['OPENAI_API_KEY']}"
    end
  end

  def parse_tools_response(response_text)
    tool_lines = response_text.split("\n")
    tool_lines.reject!(&:empty?).map!(&:strip)
    tool_lines
  end

  def get_tools(project)
    payload = {
      "model": 'text-davinci-003',
      "prompt": "Give me a list of tools needed to build #{project}?",
      "max_tokens": 200,
      "temperature": 0.5
    }

    response = JSON.parse(
      conn.post do |request|
        request.body = payload.to_json
      end.body, symbolize_names: true
    )

    tools_array = parse_tools_response(response[:choices][0][:text])
    tools_array
  end
end
