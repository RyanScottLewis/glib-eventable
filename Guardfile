require 'pathname'
require 'socket'

HOST = Socket.gethostbyname(Socket.gethostname).first

if HOST.match(/MPU/i)
  guard 'rspec', cli: '-c -f Fuubar' do
    watch(%r{^spec/.+_spec\.rb$})
    watch(%r{^lib/(.+)\.rb$})     { |m| "spec/#{m[1]}_spec.rb" }
    watch('spec/spec_helper.rb')  { "spec" }
  end
end

if HOST.match(/RyMac/i)
  guard 'shell' do
    watch(/.*/) do |m|
      path = Pathname.new(__FILE__).dirname.expand_path
      
      `rsync -vaz #{path} ryguy@MPU:~/Code/Ruby/Gems/`
    end
  end
  
  guard 'yard' do
    watch(%r{app/.+\.rb})
    watch(%r{lib/.+\.rb})
    watch(%r{ext/.+\.c})
  end
end