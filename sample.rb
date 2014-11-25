require 'aws-sdk'

Aws.config[:region] = "us-east-1"
lambda = Aws::Lambda::Client.new

begin
    param = { key1: "from ruby"}.to_json #=>functionに渡すパラメータをJSON形式で作成

    resp = lambda.invoke_async(function_name: "invoke-from-ruby", invoke_args: param)

    if resp[:status] == 202
        puts "success"
    end
rescue Aws::Lambda::Errors::ServiceError => e
    p e.message
end