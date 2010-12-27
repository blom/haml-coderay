haml-coderay
============

* [Homepage](https://github.com/blom/haml-coderay)
* [Documentation](http://rdoc.info/gems/haml-coderay)

[CodeRay][1] filter for [Haml][2]. Specify which [language][3] to highlight
with a shebang followed by the language name:

    :coderay
      #!ruby

      if true
        puts "hello"
      end

Use `:coderay_raw` if you want to disable `#{}` interpolation.

The default [encoder][4] and encoder options are `:div` and `{}`, respectively,
and they can be altered through:

    Haml::Filters::CodeRay.encoder
    Haml::Filters::CodeRay.encoder_options

Installation
------------

    gem install haml-coderay

[1]: http://coderay.rubychan.de/
[2]: http://haml-lang.com/
[3]: http://coderay.rubychan.de/doc/classes/CodeRay/Scanners.html
[4]: http://coderay.rubychan.de/doc/classes/CodeRay/Encoders.html
