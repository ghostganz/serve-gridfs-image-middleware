require 'mongoid-grid_fs'

class ServeGridfsImage

  def self.config
    @@config ||= default_config.dup
  end

  def self.default_config
    {:path => /^\/grid\/(.+)$/,
     :response_headers => {}}
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
      file = GridFs[key]
      return [404, {'Content-Type' => 'text/plain'}, ['File not found.']] unless file
      if_none_match = env['HTTP_IF_NONE_MATCH']
      if if_none_match && if_none_match =~ /^\"(.+)\"$/
        old_md5 = $1
        if file.md5 == old_md5
          return [304, {}, ['']]
        end
      end
      headers = ServeGridfsImage.config[:response_headers].dup
      headers['Content-Type'] = file.content_type if file.content_type
      headers['ETag'] = %{"#{file.md5}"} if file.md5
      #last_modified = file.uploadDate.to_datetime if file.uploadDate
      #if last_modified && last_modified.respond_to?(:httpdate)
      #  headers['Last-Modified'] = last_modified.httpdate
      #end
      [200, headers, file]
    rescue
      puts $!.backtrace.join("\n")
      [500, {'Content-Type' => 'text/plain'}, [$!.to_s]]
    end
  end
end
