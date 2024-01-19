## Some through how develop this gem

### Run console for work with gem in interactive mode

```ruby
rvm use 3.0.0
irb -Ilib # if not .irbrc
irb
3.0.0 :002 > Yadisk::VERSION
 => "1.0.0.dev"
```


```ruby
rvm use 3.0.0
bundle install
bin/console
3.0.0 :001 > Yadisk::VERSION
 => "1.0.0.dev"
```


```ruby
rvm use 3.0.0
gem build yadisk.gemspec
gem list yadisk
gem install ./yadisk-1.0.0.dev.gem
gem uninstall yadisk
irb
require 'yadisk'
3.0.0 :001 > Yadisk::VERSION
 => "1.0.0.dev"
```
