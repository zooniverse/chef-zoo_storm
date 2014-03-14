# encoding: utf-8

require 'bundler'
require 'bundler/setup'
require 'berkshelf/thor'
require 'chef/cookbook/metadata'
require 'aws-sdk'

class Default < Thor
  include Thor::Actions
  
  desc 'install', "Installs cookbooks to cookbooks/"
  def install
    thor "berkshelf:install --path cookbooks"
  end

  desc 'up', "Installs depedencies and runs vagrant up"
  def up
    invoke :install
    run "vagrant up"
  end

  desc 'upload ENVIRONMENT', "Upload to named environment on s3"
  def upload(env = "vagrant")
    run "rm -rf cookbooks/"
    thor "berkshelf:package"

    metadata = Chef::Cookbook::Metadata.new
    metadata.from_file('metadata.rb')

    AWS.config(access_key_id: ENV['S3_ACCESS_ID'], secret_access_key: ENV['S3_ACCESS_KEY'])
    s3 = AWS::S3.new
    obj = s3.buckets['zooniverse-code'].objects["cookbooks/#{env}/#{metadata.name}.tar.gz"]
    obj.write(file: "./package.tar.gz")

    run "rm package.tar.gz"
  end
end
