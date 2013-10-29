# Help build my docker files into images.

ruby:
	docker build -t paintedfox/ruby - < ruby.docker

jekyll:
	docker build -t paintedfox/jekyll - < jekyll.docker

tinyproxy:
	docker build -t paintedfox/tinyproxy - < tinyproxy.docker

# Cleans up old containers.
# http://stackoverflow.com/a/18141323
clean:
	docker rm `docker ps -a -q`
