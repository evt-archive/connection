require_relative './server_spec_init'

describe 'Server Statistics' do
  describe 'Receiving From Client' do
    specify 'Bytes Received' do
      Connection::Controls.pair do |remote, local, server|
        remote.write 'some-message'

        local.read

        assert server.stats.bytes_received == 12
      end
    end

    specify 'Client Closes Connection' do
      Connection::Controls.pair do |remote, local, server|
        remote.close

        begin
          local.read
        rescue IOError
        end

        assert server.stats.open_connections == 0
        assert server.stats.closed_connections = 1
        assert server.stats.total_connections == 1
      end
    end

    specify 'Client Resets Connection' do
      Connection::Controls.pair do |remote, local, server|
        Connection::Controls::IO.reset_connection remote.to_io

        begin
          local.read
        rescue Errno::ECONNRESET
        end

        assert server.stats.open_connections == 0
        assert server.stats.reset_connections = 1
        assert server.stats.total_connections == 1
      end
    end
  end

  describe 'Sending To Client' do
    specify 'Bytes Sent' do
      Connection::Controls.pair do |remote, local, server|
        local.write 'some-message'

        remote.read

        assert server.stats.bytes_sent == 12
      end
    end

    specify 'Client Closes Connection' do
      Connection::Controls.pair do |remote, local, server|
        remote.close

        begin
          loop do
            local.write 'some-message'
          end
        rescue Errno::EPIPE
        end

        assert server.stats.open_connections == 0
        assert server.stats.broken_pipes == 1
        assert server.stats.total_connections == 1
      end
    end

    specify 'Client Resets Connection' do
      Connection::Controls.pair do |remote, local, server|
        Connection::Controls::IO.reset_connection remote.to_io

        begin
          local.write 'some-message'
        rescue Errno::EPIPE
        end

        assert server.stats.open_connections == 0
        assert server.stats.broken_pipes == 1
        assert server.stats.total_connections == 1
      end
    end
  end

  specify 'Connection Closed Gracefully' do
    Connection::Controls.pair do |remote, local, server|
      local.close

      assert server.stats.open_connections == 0
      assert server.stats.total_connections == 1
    end
  end
end