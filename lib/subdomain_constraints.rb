class SubdomainConstraints

  def initialize(options)
    @subdomain = options[:subdomain]
  end

  def matches?(req)
    req.subdomains.include?(@subdomain)
  end

end
