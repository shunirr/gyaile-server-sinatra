require 'sinatra'

configure do
  set :file_dir, 'public/files'
  set :file_url, 'http://static.s5r.jp/files'
end

post '/' do
  ext  = File.extname(request[:data][:filename])
  data = request[:data][:tempfile].read

  filename = (rand * 10 ** 8).to_i.to_s(16)
  filename << ext if ext

  File.open("#{options.file_dir}/#{filename}", 'w'){|f| f.write(data)}
  "#{options.file_url}/#{filename}"
end

