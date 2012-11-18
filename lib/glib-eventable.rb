require 'pathname'

__LIB__ ||= Pathname.new(__FILE__).join('..', '..', 'lib')
$:.unshift(__LIB__.to_s) unless $:.include?(__LIB__.to_s)

require 'glib/eventable'
