haml-coderay
============

[CodeRay][1] filter for [Haml][2]. Specify which [language][3] to
highlight with a shebang followed by the language name:

    :coderay
      #!ruby

      if true
        puts "hello"
      end

The default [encoder][4] and encoder options are `:div` and `{}`,
respectively, and they are accessible as:

    Haml::Filters::CodeRay.encoder
    Haml::Filters::CodeRay.encoder_options

Installation
------------

    gem install haml-coderay

[1]: http://coderay.rubychan.de/
[2]: http://haml-lang.com/
[3]: http://coderay.rubychan.de/doc/classes/CodeRay/Scanners.html
[4]: http://coderay.rubychan.de/doc/classes/CodeRay/Encoders.html
