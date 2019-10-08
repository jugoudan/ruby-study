class TestSidekiqJob < ApplicationJob
  queue_as :default

  
  def perform(arg)
     result=fib(arg.to_i)
     f=File.new(arg+".txt","w+")
     f.puts(result)
    f.close
  end

  def fib(n)
    return n if n == 0 || n == 1
    fib(n-1) + fib(n-2)
  end


end
