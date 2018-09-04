require 'sinatra'
require 'osc-ruby'


get '/' do
  erb :index
end

get '/clear' do
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
message = OSC::Message.new('/system', 'conect')

# OSCメッセージの送信
client.send(message)
