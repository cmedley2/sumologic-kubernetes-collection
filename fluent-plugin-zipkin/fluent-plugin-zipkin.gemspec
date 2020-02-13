lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name    = "fluent-plugin-zipkin"
  spec.version = "0.0.0"
  spec.authors = ["Sumo Logic"]
  spec.email   = ["collection@sumologic.com"]

  spec.summary       = %q{Fluentd plugin for using zipkin tracing format (both in and out way).}
  spec.homepage      = "https://github.com/SumoLogic/sumologic-kubernetes-collection"
  spec.license       = "Apache-2.0"

  test_files, files  = `git ls-files -z`.split("\x0").partition do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.files         = files
  spec.executables   = files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = test_files
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 12.0"
  spec.add_development_dependency "test-unit", "~> 3.0"
  spec.add_development_dependency "benchmark-ips", "~> 2.7"

  spec.add_runtime_dependency "fluentd", [">= 1.6.3", "<= 1.9.1"]
  spec.add_runtime_dependency "google-protobuf", "~> 3"
  spec.add_runtime_dependency "snappy", "> 0"
  spec.add_runtime_dependency "oj", "~> 3"
end