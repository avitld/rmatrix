.PHONY install

install:
  chmod a+x matrix.rb
  mkdir /usr/share/rmatrix/
  chmod a+x /usr/share/rmatrix/
  mv matrix.rb /usr/share/rmatrix/
  touch /usr/bin/rmatrix
  echo "ruby /usr/share/rmatrix/matrix.rb" >> /usr/bin/rmatrix
  chmod a+x /usr/bin/rmatrix

deb-deps:
  apt install ruby libncurses-dev ruby-dev
  gem install curses

arch-deps:
  pacman -S ruby rubygems ncurses

gentoo-deps:
  emerge -av dev-lang/ruby sys-libs/ncurses dev-ruby/rubygems

rpm-deps:
  dnf install ruby ncurses rubygems
