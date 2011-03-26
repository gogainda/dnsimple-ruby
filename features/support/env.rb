require 'aruba/cucumber'

Before do
  @aruba_timeout_seconds = 10
end

After do |scenario|
  unless ENV['NODELETE'] || scenario.source_tag_names.include?('@skip-delete')
    if @domain_name && (@domain_name =~ /^cli-/ || @domain_name =~ /in-addr\.arpa/)
      steps %Q(When I run `dnsimple delete #{@domain_name}`)
    end
  end
end
