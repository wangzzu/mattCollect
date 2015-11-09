# 功能：将hadoop fs -ls输出的信息输出到一个文件中，计算这个目录下所有文件大小之和
# 运行：ruby countSize.rb log1
# 作者：matt
# 版本：1.0
# 创建时间：2015/10/8
# 最后更新：2015/10/8
#encoding=UTF-8
#encoding=UTF-8
require 'set'

filepath=ARGV[0]
sum=0
i=0
File.open("#{filepath}", :encoding => 'utf-8') do |file|
  puts "开始读取log"
  file.each_line do |line|
    if line.include?("-rw-r--r--")
      column=line.split(" ")
      sum=sum+column[4].to_f
      i=i+1
    end
  end
end
puts i.to_s+"个文件的总大小为(GB)："
puts format("%.3f",sum/1024/1024/1024).to_f 
