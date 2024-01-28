## Request

### DSL build request

```ruby
req = Yadisk::Client::Request.get(
  url: 'https://httpbin.org/get',
  query: { 'hello' => 'world', 'other' => 'value' },
  headers: { 
    'Content-Type' => 'application/json', 
    'Accept': 'application/json', 
    'User-Agent' => 'My User Agent' 
  }
)
puts req.to_curl
```

```ruby
req = Yadisk::Client::Request.build(config: Yadisk::Client.configuration) do |r|
  r.method = :get
  r.url = 'https://httpbin.org/get'
  r.query = { 'hello' => 'world', 'other' => 'value' }
  r.headers = { 
    'Content-Type' => 'application/json', 
    'Accept': 'application/json', 
    'User-Agent' => 'My User Agent' 
  }
end
puts req.to_curl
```
