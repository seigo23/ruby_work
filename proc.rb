# say_proc = Proc.new do |*a| #可変長にすると配列になる
#   p a.class #=>Array
#   p a
# end
#
#
# say_proc.call('param1','param2','param3')



def get_something(proc = nil)
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

  if proc.nil?
    p "procがnilやで"
  else
    proc.call(return_hash_array)
  end

end


#procの定義と宣言
# procオブジェクトの中には処理を入れれる
is_flg_false = Proc.new do |array|

  begin

  array.each do |hash|
    p "#{hash[:name]}さんのチェック"
    if hash[:flg] == false
      raise "#{hash[:name]}さんはflgがfalseです！"
    else
      p "=>OK"
    end
  end

  rescue => e
      p "rescueが呼ばれた"
      p "e.class:#{e.class}"
      p "e.message:#{e.message}"
      p "e.backtrace:#{e.backtrace}"
    end

end

#メソッドにProcオブジェクトを引数として渡して実行する
get_something(is_flg_false)


# #これだけやとインスタンス化してるだけやから何も起こらない
# proc_instance = Proc.new do
#   p "procインスタンスが呼ばれた"
# end
#
# #ここで実行
# p "proc渡して実行"
# get_something(proc_instance)
#
# p "proc渡さず実行"
# get_something()
#
# #結果
# # "proc渡して実行"
# # "procインスタンスが呼ばれた"
# # "proc渡さず実行"
# # "procがnilやで"
#


