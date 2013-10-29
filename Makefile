# Help build my docker files into images.

ruby:
	sudo docker build -t paintedfox/ruby - < ruby.docker

jekyll:
	sudo docker build -t paintedfox/jekyll - < jekyll.docker

# Cleans up old containers.
# http://stackoverflow.com/a/18141323
clean:
	sudo docker rm `sudo docker ps -a -q`
