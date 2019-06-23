MIGRATION_IMAGE=usvc/db-migrator

db_migrate:
	@$(MAKE) rake CMD="db:migrate"

db_seed:
	@$(MAKE) rake CMD="db:seed"

db_rollback:
	@$(MAKE) rake CMD="db:rollback"

rake:
	@docker run -it \
		--network host \
		--env RAILS_ENV=development \
		--volume $$(pwd):/app \
		--user $$(id -u) \
		--entrypoint rake \
		$(MIGRATION_IMAGE):latest ${CMD}
