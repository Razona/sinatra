require 'osc-ruby'

# ローカルホストの UDPポート : 3333 宛にOSCメッセージを送信するOSCクライアントのインスタンスを作成
client = OSC::Client.new('localhost', 3333)

# OSCメッセージを作成
# 第一引数にOSCアドレス、以降に送信する内容を指定する
message = OSC::Message.new('/greeting', 'Hello! OSC')

# OSCメッセージの送信
client.send(message)
