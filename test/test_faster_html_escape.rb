#!/usr/local/bin/ruby
require 'faster_html_escape'
require 'erb'
require 'time'
text = STDIN.read
method = (ARGV[0] == 'fhe' ? FasterHTMLEscape : ERB::Util).method(:h)
times = (ARGV[1] || 1).to_i
multiplier = (ARGV[2] || 1).to_i
text *= multiplier
if ARGV[0] == 'check'
  puts "ERB::Util.h(text) #{ERB::Util.h(text) == FasterHTMLEscape.h(text) ? '==' : '!='} FasterHTMLEscape.h(text), size #{text.length}"
else
  print "Using #{method.inspect} #{times} time(s) on text of size #{text.length}..."
  start = Time.now
  times.times{ method.call(text) }
  seconds = Time.now - start
  puts "took %0.6f seconds" % seconds
end
