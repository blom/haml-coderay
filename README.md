haml-coderay
============

[CodeRay][1] filter for [Haml][2]. Specify [language][3] to highlight
with an exclamation point followed by the language name:

    :coderay
      !ruby

      if true
        puts "hello"
      end

    :coderay
      !xml

      <foo>
        <bar>...</bar>
      </foo>

The default encoder and encoder options are `:div` and `{}`,
repectively, and are accessible through the following variables:

    Haml::Filters::CodeRay.encoder
    Haml::Filters::CodeRay.encoder_options

[1]: http://coderay.rubychan.de/
[2]: http://haml-lang.com/
[3]: http://coderay.rubychan.de/doc/classes/CodeRay/Scanners.html
