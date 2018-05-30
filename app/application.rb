class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack:: Request.new(env)

    if req.path.match(/items/)

      search_item = req.path.split("/items/").last
      item = @@items.find{|i| i.title == search_item}
      resp.write item.price
    else
      resp.write "Item not found"
      resp.status = 400
    end
    resp.finish

  end
end
