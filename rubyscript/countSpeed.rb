# 功能：根据我们测试输出的信息，因为测试是多线程，所以需要对log计算（如：测试速度之和）
# 运行：ruby countSpeed.rb log1
# 作者：matt
# 版本：1.0
# 创建时间：2015/11/8
# 最后更新：2015/11/8
#encoding=UTF-8
require 'set'

filepath=ARGV[0]
sum=0
i=0
File.open("#{filepath}", :encoding => 'utf-8') do |file|
  puts "开始读取log"
  file.each_line do |line|
    if line.include?("acks为")
      puts line.to_s
    end
    if line.include?("batch为")
      puts line.to_s
    end
    if line.include?("max.request.size")
      puts line.to_s
    end
    if line.include?("send.buffer.bytes")
      puts line.to_s
    end
    if line.include?("buffer.memory为")
      puts line.to_s
    end
    if line.include?("receiveBufferBytes为")
      puts line.to_s
    end
    if line.include?("话单的处理速度为(MB/s)： ")
      column=line.split("： ")
      sum=sum+column[1].to_f
      i=i+1
    end  
  end
end
puts i.to_s+"个线程的速度总和为(MB/s)："
puts format("%.3f",sum).to_f 
