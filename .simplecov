require "simplecov-rcov"

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  SimpleCov::Formatter::RcovFormatter,
]

SimpleCov.start do
  add_filter    "/.bundle/"
  add_filter    "/.rvm/"
  add_filter    "/config/"
  add_filter    "/features/"
  add_filter    "/spec/"
  add_filter    "/tmp/"
  add_filter    "/vendor/"
  root          File.expand_path(File.dirname(__FILE__))
  coverage_dir  File.join("artifacts", "coverage")
  merge_timeout 3600
end
