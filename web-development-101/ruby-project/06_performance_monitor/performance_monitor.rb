def measure num=1
  start = Time.now
  num.times do
    yield
  end
  done = Time.now
  (done -  start) / num
end