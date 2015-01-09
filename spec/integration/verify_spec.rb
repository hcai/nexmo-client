# encoding: UTF-8

require 'spec_helper'

###
# NOTE: This spec will actually hit Nexmo's servers
###

describe 'NEXMO::Endpoints::Verify' do
  context "Test integration of verify endpoint" do

    # Skip if the creds aren't setup
    if defined?(API_KEY) && defined?(API_SECRET)

      before :each do
        @client = NEXMO::Client.create()
      end

      it 'sends verify request successfully' do
        response = @client.verify.verify_request("16503530279", "Thinplify", {:api_key => API_KEY, :api_secret => API_SECRET})
        response.should be_a(Hash)
        response['request_id'].should_not be_nil
        response['status'].should eq('0')
      end

      it 'should verify successfully' do
         response = @client.verify.check_request("8bd16ef5d9664bc0bd86592157145efe", "0874", {:api_key => API_KEY, :api_secret => API_SECRET})
         response.should be_a(Hash)
         response['status'].should eq('0')
       end

    else
      puts "You should put valid creds in _creds.rb"
    end

  end
end
