haml-coderay
============

[![Build Status](http://img.shields.io/travis/blom/haml-coderay.svg)][travis]
[![Gem Version](http://img.shields.io/gem/v/haml-coderay.svg)][gem]

[travis]: https://travis-ci.org/blom/haml-coderay
[gem]: http://rubygems.org/gems/haml-coderay

* [Homepage](https://github.com/blom/haml-coderay)
* [Documentation](http://rubydoc.info/gems/haml-coderay)

[CodeRay][1] filter for [Haml][2]. Specify which [language][3] to highlight
with a shebang followed by the language name:

    :coderay
      #!ruby

      if true
        puts "hello"
      end

Use `:coderay_raw` if you want to disable `#{}` interpolation.

Encoder
-------

The default [encoder][4] and encoder options are `:div` and `{}`, respectively,
and they can be altered through:

    Haml::Filters::CodeRay.encoder
    Haml::Filters::CodeRay.encoder_options

For example, if you want to provide your own styling instead of the default
inline styling:

    Haml::Filters::CodeRay.encoder         = :div
    Haml::Filters::CodeRay.encoder_options = { :css => :class }

Installation
------------

    gem install haml-coderay

[1]: http://coderay.rubychan.de/
[2]: http://haml.info/
[3]: http://rubydoc.info/gems/coderay/CodeRay/Scanners
[4]: http://rubydoc.info/gems/coderay/CodeRay/Encoders
