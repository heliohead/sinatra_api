require File.expand_path('../../app', __FILE__)
require 'spec_helper'
require 'airborne'

describe 'The Api' do
  it "should not respond to root" do
    get 'http://localhost:9292/'

    expect_status 404
  end

  it "should not respond wrong routes" do
    get 'http://localhost:9292/foo'

    expect_status 404
  end

  it "should respond with right path" do
    get 'http://localhost:9292/passenger'

    expect_status 200
  end

  it "should respond with right path" do
    get 'http://localhost:9292/cab'

    expect_status 200
  end

  it "should respond with right path" do
    get 'http://localhost:9292/ride'

    expect_status 200
  end

  it "should respond with right path" do
    post 'http://localhost:9292/ride/cabs_near'

    expect_status 200
  end

  it "ff" do
    post 'http://localhost:9292/passenger/new' , {name: 'John Doe', password: '123', email: 'john@exemple.org', address: 'Av Pacaembu' }

    expect_json({:longitute => '-46.6625099', :latitude => '-23.5353997'})
  end
end