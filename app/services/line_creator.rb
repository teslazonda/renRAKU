require "line/bot"

class LineCreator
  def initialize(message)
    @message = message
  end

  def client
    @client ||= Line::Bot::Client.new { |config|
      config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
      config.channel_token = ENV["LINE_ACCESS_TOKEN"]
    }
  end

  def send_line
    message = {
      type: 'text',
      text: @message
    }
    p client.push_message(ENV["LINE_ID"], message)
  end
end

# Call --> LineCreator.new(params[:message]).send_line
