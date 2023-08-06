require "csv" # CSVファイルを扱うためのライブラリを読み込んでいます

puts "1 (新規でメモを作成する) 2 (既存のメモを編集する)"

memo_type = gets.to_i # ユーザーの入力値を取得し、数字へ変換しています

# if文を使用して続きを作成していきましょう。
# 「memo_type」の値（1 or 2）によって処理を分岐させていきましょう。
if memo_type.eql?(1)
    puts "拡張子を除いたファイルを入力してください"
    file_name = gets.chomp
    puts "メモしたい内容を記入してください"
    puts "完了後、Ctrl＋Dを押します"
#    memo_type = $stdin.read
    memo = $stdin.read
    CSV.open("#{file_name}.csv","w") do |file|
    file << [memo]
    end

elsif memo_type.eql?(2)
    puts "編集したいファイル名を入力してください"
    file_name = gets.chomp
    if (File.exist?("./#{file_name}.csv"))
        puts "編集内容を記入してください"
        puts "完了後、Ctrl＋Dを押します"
#    memo_type = $stdin.read
        memo = $stdin.read
        CSV.open("#{file_name}.csv","a") do |file|
        file << [memo]
        end
    else
        puts "ファイルが存在しないため処理を終了します。"
    end
        
end
    