# def say
#   p "aaa"
#   p "bbb"
#   # yield if block_given?
#
#   a = yield "ddd"
#
#   p a
# end
#
# say do |text|
#   text + "だよ"
# end

#
# say do
#   p "cccc"
# end
#
# p "-----"
#
# say




#やりたいこと
#あるメソッドがあって、そのメソッドを実行するときに処理を差し込みたい
# データを取得するメソッドを作る場合、フラグがtrueのデータがないことを必ず確認したい。

def get2(&a)
  p "get2が呼ばれた"
  a.call
  p "get2のa.callが呼ばれた"
  yield
  p "get2のyieldが呼ばれた"
end






def get(&a)

  ##この辺で諸々取得処理があるとして、

  return_hash_array = [{
      id: "1",
      name: "seigo",
      flg: true
  },{
      id: "2",
      name: "seigo2",
      flg: false
                       },
  ]

  a.call return_hash_array if block_given?
  p "arity=#{a.arity}" if block_given?

  get2(&a)
end


get do |hash_array|
p "getブロックが呼ばれた"
  unless hash_array == nil
    hash_array.each  do |hash|
      if hash[:flg] == false
      p "false発見！"
      end
      p "1つ確認できた"
    end
  end
end


#ブロックはメソッドを実行する


