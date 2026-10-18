install:
	bundle install

lint:
	bundle exec rubocop

test:
	bundle exec rake test

console:
	bin/console

.PHONY: install lint test console
