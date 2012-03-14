class ServeGridfsImage

  def self.config
    @@config ||= default_config.dup
  end

  def self.default_config
    { :path => /^\/grid\/(.+)$/,
      :database => Mongoid.database }
  end

  def initialize(app)
    @app = app
  end

  def call(env)
    if env["PATH_INFO"] =~ ServeGridfsImage.config[:path]
      process_request(env, $1)
    else
      @app.call(env)
    end
  end

  private
  def process_request(env, key)
    begin
      Mongo::GridFileSystem.new(ServeGridfsImage.config[:database]).open(key, 'r') do |file|
        headers = {'Content-Type' => file.content_type}
        headers['ETag'] = %{"#{file['md5']}"} if file['md5']
        [200, headers, [file.read]]
      end
    rescue
      [404, { 'Content-Type' => 'text/plain' }, ['File not found.']]
    end
  end
end
