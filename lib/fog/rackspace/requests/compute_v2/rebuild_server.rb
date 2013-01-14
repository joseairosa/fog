module Fog
  module Compute
    class RackspaceV2
      class Real
        def rebuild_server(server_id, image_id, options={})
          data = {
            'rebuild' => options || {}
          }
          data['rebuild']['imageRef'] = image_id

          request(
            :body => Fog::JSON.encode(data),
            :expects => [202],
            :method => 'POST',
            :path => "servers/#{server_id}/action"
          )
        end
      end

      class Mock
        def rebuild_server(server_id, image_id, options={})
          server = self.data[:servers][server_id]
          response(
            :body => {"server" => server},
            :status => 202
          )
        end
      end
    end
  end
end
