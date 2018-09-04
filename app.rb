require 'sinatra'
require 'osc-ruby'


get '/' do
  erb :index
end

get '/zahyou/:num' do

    num = params[:num]

    # ローカルホストの UDPポート : 10000 宛にOSCメッセージを送信するOSCクライアントのインスタンスを作成
    client = OSC::Client.new('localhost', 10000)

    # OSCメッセージを作成
    # 第一引数にOSCアドレス、以降に送信する内容を指定する
    message = OSC::Message.new('/system', num)

    # OSCメッセージの送信
    client.send(message)

end

get '/clear/:num' do

  # ローカルホストの UDPポート : 10000 宛にOSCメッセージを送信するOSCクライアントのインスタンスを作成
  client = OSC::Client.new('localhost', 10000)

  # OSCメッセージを作成
  # 第一引数にOSCアドレス、以降に送信する内容を指定する
  message = OSC::Message.new('/system', 'clear')

  # OSCメッセージの送信
  client.send(message)
end


# ローカルホストの UDPポート : 3333 宛にOSCメッセージを送信するOSCクライアントのインスタンスを作成
client = OSC::Client.new('localhost', 10000)

# OSCメッセージを作成
# 第一引数にOSCアドレス、以降に送信する内容を指定する
message = OSC::Message.new('/system', '接続成功')

# OSCメッセージの送信
client.send(message)
