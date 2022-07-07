# Requiring this file speeds up ERB::Util.html_escape, ERB::Util.h and
# CGI.escapeHTML using the C version from FasterHTMLEscape

# Replaces ERB::Util.h, ERB::Util.html_escape, and CGI.escapeHTML to call
# FasterHTMLEscape.h
def replace_erb_cgi_html_escape
  require 'faster_html_escape'
  require 'erb'
  require 'cgi'
  ERB::Util.send :remove_method, :h, :html_escape
  class << ERB::Util; self; end.send :remove_method, :h, :html_escape
  ERB::Util.send :include, FasterHTMLEscape
  ERB::Util.send :module_function, :h
  ERB::Util.send :module_function, :html_escape
  class << CGI; self; end.send :remove_method, :escapeHTML
  class << CGI; self; end.send(:define_method, :escapeHTML){|string| FasterHTMLEscape.h(string)}
end

replace_erb_cgi_html_escape
