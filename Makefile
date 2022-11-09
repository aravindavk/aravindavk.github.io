build:
	bundle exec nanoc

build-prod:
	bundle install
	bundle exec nanoc compile --env prod

view:
	bundle exec nanoc view -L
