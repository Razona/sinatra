require 'sinatra'
require 'osc-ruby'


def osc_send(msg)

  # ローカルホストの UDPポート : 3333 宛にOSCメッセージを送信するOSCクライアントのインスタンスを作成
  client = OSC::Client.new('localhost', 10000)

  # OSCメッセージを作成
  # 第一引数にOSCアドレス、以降に送信する内容を指定する
  message = OSC::Message.new('/system', msg)

  # OSCメッセージの送信
  client.send(message)

end

#起動時に接続成功メッセージ
osc_send('接続成功')



#一応作ったルートとindex
get '/' do
  erb :index
end


get '/zahyou/:num' do
#座標に関するパラメーターを代入
    num = params[:num]
#osc送信
    osc_send(num)
end


get '/clear' do
  #osc送信
  osc_send('clear')
end
