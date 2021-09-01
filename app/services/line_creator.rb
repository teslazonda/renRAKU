require "line/bot"
class LineCreator
  def initialize(message)
    @message = message
  end

  def send_line
  #   message = {
  #     type: 'text',
  #     text: 'hello'
  #   }
  #   client = Line::Bot::Client.new do |config|
  #     config.channel_secret = ENV['LINE_CHANNEL_SECRET']
  #     config.channel_token = ENV['LINE_ACCESS_TOKEN']
    # end
    @client ||= Line::Bot::Client.new { |config|
      config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
      config.channel_token = ENV["LINE_ACCESS_TOKEN"]
    }
    message = {
      type: 'text',
      text: 'hello'
    }
    p @client.push_message(ENV["LINE_ID"], message)

    # response = client.push_message(ENV['LINE_ID'], message)
    # p response
  end
end

# Call --> LineCreator.new(params[:message]).send_line
