require 'irb/completion'
require 'irbtools'

alias :q :exit

unless ENV.include?('RAILS_ENV')
  def reload!
    $LOADED_FEATURES.grep(/#{Dir.pwd}/).each {|m| load m }
    true
  end
end

alias :r :reload!

def l; load 'app.rb' end