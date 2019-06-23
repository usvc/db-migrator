MIGRATOR_IMAGE=usvc/db-migrator

# if needed to overwrite the above MIGRATOR_IMAGE variable,
# create a file named Makefile.properties and re-declare the
# Makefile variable
-include ./Makefile.properties

DATE_TIMESTAMP=$$(date +'%Y')$$(date +'%m')$$(date +'%d')

build:
	@docker build --file ./Dockerfile --tag $(MIGRATOR_IMAGE):latest .
	@docker tag $(MIGRATOR_IMAGE):latest $(MIGRATOR_IMAGE):$(DATE_TIMESTAMP)
	@RAILS_VERSION=$$(docker run -it $(MIGRATOR_IMAGE):latest rails -v | cut -f 2 -d ' ' | sed -e 's|\r||g') \
		&& docker tag $(MIGRATOR_IMAGE):latest $(MIGRATOR_IMAGE):$${RAILS_VERSION}

publish: build
	@docker push $(MIGRATOR_IMAGE):latest
	@docker push $(MIGRATOR_IMAGE):$(DATE_TIMESTAMP)
	@RAILS_VERSION=$$(docker run -it $(MIGRATOR_IMAGE):latest rails -v | cut -f 2 -d ' ' | sed -e 's|\r||g') \
		&& docker tag $(MIGRATOR_IMAGE):latest $(MIGRATOR_IMAGE):$${RAILS_VERSION}
